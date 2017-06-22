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

	def create
		@job = Job.new(job_params)
		@job.user = current_user
		if @job.save
			redirect_to job_path(@job)
		else
			flash[:danger] = "Couldn't create new job" 
			render :new
		end
	end

	def edit
		@job = Job.find_by_id(params[:id])
	end

	def update
		@job = Job.find_by_id(params[:id])
	end

	def destroy
		@job = Job.find_by_id(params[:id])
		@job.destroy
		redirect_to jobs_path
	end

	private

	def job_params
		params.require(:job).permit(:name, :jobdate, :payrate, :paid, :equipment, :user_id, category_id: [], categories_attributes:[:title] )
	end

end