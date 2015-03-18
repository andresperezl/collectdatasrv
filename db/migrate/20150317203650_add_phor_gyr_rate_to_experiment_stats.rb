class AddPhorGyrRateToExperimentStats < ActiveRecord::Migration
  def change
    add_column :experiment_stats, :phone_gyr_rate, :integer
  end
end
