class JobsController < ApplicationController

	def index
		@jobs = Job.all
	end

	def show 
		@job = Job.find_by_id(params[:id])
	end

	def new
		@job = Job.new
	end

	def destroy
		@job = Job.find_by_id(params[:id])
		@job.destroy
		redirect_to jobs_path
	end

end