class JobsController < ApplicationController
	
	
	def index
		@jobs = Job.all
	end

	def new
		@job = Job.new
		@job.build_client
	end

	def create
		@job = current_user.jobs.build(job_params)

		if @job.save
			redirect_to job_path(@job)
		else
			flash.now[:danger] = "Couldn't create new job" 
			render :new
		end
	end

	def edit
		@job = Job.find_by_id(params[:id])
	end

	def update
		@job = Job.find_by_id(params[:id])
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
		params.require(:job).permit(:name, :jobdate, :payrate, :paid, :equipment, category_id: [], categories_attributes:[:title] )
	end

	def require_same_user
		if current_user != @job.user
			flash[:danger] = "You can only edit or delete your own jobs"
			redirect_to root_path
		end
	end

end