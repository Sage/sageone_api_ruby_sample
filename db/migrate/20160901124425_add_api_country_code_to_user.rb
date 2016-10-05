class AddApiCountryCodeToUser < ActiveRecord::Migration
  def change
    add_column :users, :api_country_code, :string
  end
end
