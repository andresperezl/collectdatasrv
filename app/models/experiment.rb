class Experiment < ActiveRecord::Base
	has_many :phone_acc_data
	has_many :phone_gyr_data
	has_many :strap_acc_data

	def processed?
		processed
	end

	def process
		[strap_acc_data.order(ts: :asc), phone_acc_data.order(ts: :asc), phone_gyr_data.order(ts: :asc)].each do |data|
			process_data(data)
		end
		self.processed = true
		self.save
	end

	private
		def process_data(data)
			if data.count > 0
				base_ts = data.first.ts
				data.each do |datum|
					datum.ts -= base_ts
					datum.ts /= 1000000
					datum.save
				end
			end
		end
end
