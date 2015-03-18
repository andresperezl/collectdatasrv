class Experiment < ActiveRecord::Base
	has_many :phone_acc_data
	has_many :phone_gyr_data
	has_many :strap_acc_data
	has_one  :experiment_stat

	def processed?
		processed
	end

	def process
		dataset = [strap_acc_data.order(ts: :asc), phone_acc_data.order(ts: :asc), phone_gyr_data.order(ts: :asc)]
		dataset.each do |data|
			process_data(data)
		end
		ExperimentStat.create(experiment: self,
			phone_acc_rate: phone_acc_data(true).order(ts: :asc).last.ts/(dataset[1].size-1),
			phone_gyr_rate: phone_gyr_data(true).order(ts: :asc).last.ts/(dataset[2].size-1),
			strap_acc_rate: strap_acc_data(true).order(ts: :asc).last.ts/(dataset[0].size-1)
			)
		self.processed = true
		self.save
	end

	private
		def process_data(data)
			if data.count > 0
				base_ts = data.first.ts
				xyz = MetricsHelper::Filters::wma(data.pluck(:x,:y,:z))
				bias = xyz.inject(Vector[0,0,0]){ |sum, v| sum+(v) }*(1/xyz.size.to_f)
				data.each_with_index do |datum,i|
					datum.ts -= base_ts
					datum.energy = Math.sqrt((datum.x)**2+(datum.y)**2+(datum.z)**2) - bias.norm
					datum.filtered_energy = Math.sqrt((xyz[i][0])**2+(xyz[i][1])**2+(xyz[i][2])**2) - bias.norm
					datum.save
				end
				filtered_energies = MetricsHelper::Filters::wma(data.pluck(:energy), 3)
				data.each_with_index do |datum, i|
					datum.filtered_energy = filtered_energies[i]
					datum.save
				end
				
			end
		end
end
