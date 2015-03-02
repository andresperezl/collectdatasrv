class CreatePhoneGyrData < ActiveRecord::Migration
  def change
    create_table :phone_gyr_data do |t|
      t.references :experiment, index: true
    end
    add_column :phone_gyr_data, :x, :real
    add_column :phone_gyr_data, :y, :real
    add_column :phone_gyr_data, :z, :real
    add_column :phone_gyr_data, :ts, :bigint
    add_foreign_key :phone_gyr_data, :experiments
  end
end
