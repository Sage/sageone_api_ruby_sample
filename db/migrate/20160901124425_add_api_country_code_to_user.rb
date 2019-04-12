class AddApiCountryCodeToUser < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :api_country_code, :string
  end
end
