class AddAddressAndCityToClassifieds < ActiveRecord::Migration
  def change
    add_column :classifieds, :address, :string
  end
end
