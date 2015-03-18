class CreateExperimentStats < ActiveRecord::Migration
  def change
    create_table :experiment_stats do |t|
      t.references :experiment, index: true
      t.integer :avg_rate

      t.timestamps null: false
    end
    add_foreign_key :experiment_stats, :experiments
  end
end
