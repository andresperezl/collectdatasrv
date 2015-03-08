class AddProccessedToExperiment < ActiveRecord::Migration
  def change
    add_column :experiments, :processed, :boolean
  end
end
