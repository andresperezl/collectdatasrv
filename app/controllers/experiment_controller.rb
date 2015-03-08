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
  	@phone_acc = @ex.phone_acc_data.order(ts: :asc).pluck(:ts, :x, :y, :z)
  	@phone_gyr = @ex.phone_gyr_data.order(ts: :asc).pluck(:ts, :x, :y, :z)
  	@strap_acc = @ex.strap_acc_data.order(ts: :asc).pluck(:ts, :x, :y, :z)
  end


  private
  	def experiment_params
  		params.permit(:id)
  	end
end
