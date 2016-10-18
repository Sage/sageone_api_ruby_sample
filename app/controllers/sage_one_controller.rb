require 'rest_client'
require 'uri'

class SageOneController < ApplicationController

  # redirect to the Sage One authorisation server with the required query params
  def auth
    redirect_to auth_url
  end

  # POST request to exchange authorisation code for access token
  def exchange_code_for_token
    current_user.update_attributes(:api_country_code => params[:country].downcase)
    body_params = token_request_body
    body_params << ["code", params[:code]]
    body_params << ["grant_type", "authorization_code"]
    body_params << ["redirect_uri", sageone_config['sageone']['callback_url']]

    get_token(body_params)
    redirect_to sageone_data_path
  end

  # use the refresh token to renew the access token
  def renew_token
    body_params = token_request_body
    body_params << ["refresh_token", current_user.refresh_token]
    body_params << ["grant_type", "refresh_token"]

    get_token(body_params)
    redirect_to sageone_data_path
  end

  def data
  end

  def call_api
    request_method = params.keys[0].split('_')[0]
    base_endpoint = sageone_config['sageone']['base_endpoint'][current_user.api_country_code]
    endpoint = params["#{request_method}_endpoint"]
    url = "#{base_endpoint}/#{endpoint}"
    signing_secret = sageone_config['sageone']['signing_secret']
    token = current_user.access_token
    guid = current_user.resource_owner_id

    body_params = put_or_post?(request_method) ? params["#{request_method}_data"] : nil

    @signer = SageoneApiSigner.new({
        request_method: request_method,
        url: url,
        body: body_params,
        body_params: body_params,
        signing_secret: signing_secret,
        access_token: token,
        business_guid: guid
    })

    payload = body_params
    header = @signer.request_headers("Sage One Sample Application")

    header["ocp-apim-subscription-key"] = sageone_config['sageone']['apim_subscription_key']
    header["X-Site"] = guid

    begin
      api_call = RestClient.method(request_method)
      response = put_or_post?(request_method) ? api_call.call(url, payload, header) : api_call.call(url, header)
      request_method == "delete" ? @response = response : @response = JSON.parse(response.to_s)
    rescue => e
      puts e.response.to_str
      @error = JSON.parse(e.response.to_s)
    end
  end

  private

  def auth_url
    @client_id = sageone_config['sageone']['client_id']
    @callback_url = sageone_config['sageone']['callback_url']
    @auth_endpoint = sageone_config['sageone']['auth_endpoint']
    "#{@auth_endpoint}?response_type=code&client_id=#{@client_id}&redirect_uri=#{@callback_url}&scope=full_access"
  end

  def sageone_config
    YAML.load_file(File.expand_path('../../../config/sageone.yml', __FILE__))
  end

  def token_request_body
    body_params = []
    body_params << ["client_id", sageone_config['sageone']['client_id']]
    body_params << ["client_secret", sageone_config['sageone']['client_secret']]
    body_params
  end

  def get_token(body_params)
    response = RestClient.post sageone_config['sageone']['token_endpoint'][current_user.api_country_code], URI.encode_www_form(body_params)
    parsed = JSON.parse(response.to_str)
    current_user.update_attributes(:access_token => parsed["access_token"],
                                   :token_issued => Time.now,
                                   :refresh_token => parsed["refresh_token"],
                                   :resource_owner_id => parsed["resource_owner_id"])
  end

  def put_or_post?(method)
    ["put","post"].include? method
  end
end
