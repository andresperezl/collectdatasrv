class AddStrapAccRateToExperimentStats < ActiveRecord::Migration
  def change
    add_column :experiment_stats, :strap_acc_rate, :integer
  end
end
