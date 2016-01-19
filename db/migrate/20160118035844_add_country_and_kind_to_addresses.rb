class AddCountryAndKindToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :country, :string
    add_column :addresses, :kind, :string
  end
end
