class AddFilteredEnergy < ActiveRecord::Migration
  def change
  	add_column :phone_gyr_data, :energy, :real
  	add_column :strap_acc_data, :energy, :real
  	add_column :phone_acc_data, :filtered_energy, :real
  	add_column :phone_gyr_data, :filtered_energy, :real
  	add_column :strap_acc_data, :filtered_energy, :real
  end
end
