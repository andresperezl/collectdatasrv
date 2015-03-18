class ExperimentController < ApplicationController
  def create
  	ex = Experiment.create;
  	render json: { id: ex.id }
  end
  def index
  	@exs = Experiment.all.order(created_at: :desc)

  end

  def show
  	@ex = Experiment.find(experiment_params[:id])
  	@ex.process unless @ex.processed?
  	@phone_acc = @ex.phone_acc_data.order(ts: :asc).pluck(:ts, :energy, :filtered_energy)
  	@phone_gyr = @ex.phone_gyr_data.order(ts: :asc).pluck(:ts, :energy, :filtered_energy)
  	@strap_acc = @ex.strap_acc_data.order(ts: :asc).pluck(:ts, :energy, :filtered_energy)
  end


  private
  	def experiment_params
  		params.permit(:id)
  	end
end
