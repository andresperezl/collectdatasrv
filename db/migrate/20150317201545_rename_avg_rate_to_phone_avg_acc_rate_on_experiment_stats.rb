class RenameAvgRateToPhoneAvgAccRateOnExperimentStats < ActiveRecord::Migration
  def change
  	rename_column :experiment_stats, :avg_rate, :phone_acc_rate
  end
end
