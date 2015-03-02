class CreateStrapAccData < ActiveRecord::Migration
  def change
    create_table :strap_acc_data do |t|
      t.references :experiment, index: true
    end
    add_column :strap_acc_data, :x, :real
    add_column :strap_acc_data, :y, :real
    add_column :strap_acc_data, :z, :real
    add_column :strap_acc_data, :ts, :bigint
    add_foreign_key :strap_acc_data, :experiments
  end
end
