class AddEnergyToPhoneAccData < ActiveRecord::Migration
  def change
    add_column :phone_acc_data, :energy, :real
  end
end
