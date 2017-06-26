require 'pry'

class JobsController < ApplicationController
	
	
	def index
		if params[:client_id]
			@jobs = Client.find(params[:client_id]).jobs
			@client = Client.find(params[:client_id]).fullname
		else
			@jobs = current_user.jobs
		end
	end


	def new
		@job = Job.new
		@clients = Client.all
	end

	def create


		@job = current_user.jobs.build(job_params)

		if @job.save
			redirect_to job_path(@job)
		else
			flash[:danger] = "Couldn't create new job" 
			 redirect_to new_job_path
		end
	end

	def edit
		@job = Job.find_by_id(params[:id])
		@clients = Client.all
	end

	def update
		@job = Job.find_by_id(params[:id])
		if @job.update(job_params)
			redirect_to job_path(@job)
		else
			flash[:danger] = "Couldn't update job" 
			 redirect_to edit_job_path(@job)
		end
	end

		def show 
		@job = Job.find_by_id(params[:id])
	end


	def destroy
		@job = Job.find_by_id(params[:id])
		@job.destroy
		redirect_to jobs_path
	end



	private

	def job_params
		params.require(:job).permit(:client_id, :name, :jobdate, :payrate, :paid, :equipment, category_ids: [], categories_attributes:[:title])
	end

	def require_same_user
		if current_user != @job.user
			flash[:danger] = "You can only edit or delete your own jobs"
			redirect_to root_path
		end
	end

end