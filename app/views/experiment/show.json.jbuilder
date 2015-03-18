json.experiment @ex, :id, :created_at
json.data do
	json.phone_acc @phone_acc
	json.phone_gyr @phone_gyr
	json.strap_acc @strap_acc
end
json.stats do
	json.phone_acc do
		json.rate @ex.experiment_stat.phone_acc_rate
	end
	json.phone_gyr do
		json.rate @ex.experiment_stat.phone_gyr_rate
	end
	json.strap_acc do
		json.rate @ex.experiment_stat.strap_acc_rate
	end
end