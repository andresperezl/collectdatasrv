class CreatePhoneAccData < ActiveRecord::Migration
  def change
    create_table :phone_acc_data do |t|
      t.references :experiment, index: true
    end
    add_column :phone_acc_data, :x, :real
    add_column :phone_acc_data, :y, :real
    add_column :phone_acc_data, :z, :real
    add_column :phone_acc_data, :ts, :bigint
    add_foreign_key :phone_acc_data, :experiments
  end
end
