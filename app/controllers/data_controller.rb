class DataController < ApplicationController
  def create
    Thread.new do
    	strap_data = data_params["strap"]
    	phone_acc_data = data_params["phone_acc"];
    	phone_gyr_data = data_params["phone_gyr"];
    	StrapAccDatum.create(strap_data) if strap_data
    	PhoneAccDatum.create(phone_acc_data) if phone_acc_data
    	PhoneGyrDatum.create(phone_gyr_data) if phone_gyr_data
      ActiveRecord::Base.connection.close
    end
  	render json: {}
  end

  def show
  end

  private
  	def data_params
  		params.permit(strap: [:experiment_id, :x, :y, :z, :ts], phone_acc: [:experiment_id, :x, :y, :z, :ts], phone_gyr: [:experiment_id, :x, :y, :z, :ts] )
  	end
end
