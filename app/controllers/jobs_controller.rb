class JobsController < ApplicationController
	before_action :set_job, only: [:edit, :update, :show, :destroy]
	before_action :require_same_user, except: [:new, :index, :create, :viewdate]
	before_action :require_login, only: [:new, :index, :create]
	
	
	def index
		if params[:client_id]
			@jobs = Client.find(params[:client_id]).jobs
			@client = Client.find(params[:client_id])
		else
			@jobs = current_user.jobs
		end
		respond_to do |format|
			format.html { render :index }
			format.json { render json: @jobs }
		end
	end

	def new
			@job = Job.new
			@clients = Client.all
	end

	def create
		@job = current_user.jobs.build(job_params)
		if @job.save!
			 render json: @job 
		else
			flash[:danger] = "Couldn't create job" 
			redirect_to new_job_path
		end
	end

	def edit
		@clients = Client.all
	end

	def update
		if @job.update(job_params)
			redirect_to job_path(@job)
		else
			flash[:danger] = "Couldn't update job" 
			redirect_to edit_job_path(@job)
		end
	end

	def show 
		respond_to do |format|
			format.html { render :show }
			format.json { render json: @job }
		end
	end


	def destroy
		@job.destroy
		redirect_to jobs_path
	end

	def viewdate
		@job_sorted = current_user.jobs.jobdate_sort
	end



	private

	def job_params
		params.require(:job).permit(:client_id, :name, :jobdate, :payrate, :paid, :equipment, :category_ids, category_ids: [], categories_attributes: [:title])
	end



	def require_same_user
		if current_user != @job.user
			flash[:danger] = "You are not the user that are associated with this page. Only logged in and associated user can see this page."
			redirect_to root_path
		end
	end

	def set_job
		@job = Job.find_by_id(params[:id])
	end

	def require_login
		if !logged_in?
			flash[:danger] = "You need to be logged in to see this page"
			redirect_to login_path
		end
	end

end