json.experiment @ex, :id, :created_at
json.data do
	json.phone_acc @phone_acc
	json.phone_gyr @phone_gyr
	json.strap_acc @strap_acc
end