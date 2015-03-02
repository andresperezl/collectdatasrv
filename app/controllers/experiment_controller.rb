class ExperimentController < ApplicationController
  def create
  	ex = Experiment.create;
  	render json: { id: ex.id }
  end
end
