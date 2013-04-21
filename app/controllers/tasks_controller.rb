class TasksController < ApplicationController

	before_filter :load_space

	def index
		@task = Task.all

		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @task }
		end
	end

	def show
		@task = Task.find(params[:id])

		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @task }
		end
	end

	def new
		@task = Task.new

		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @task }
		end
	end

	def edit
		@task = Task.find(params[:id])
	end

	def create
		@task = @space.tasks.create(params[:task])

		redirect_to space_tasks_path(@space)

		# put in notices here stating whether the create was successful
	end

	def update
		@task = Task.find(params[:id])

		@task.update_attributes(params[:task])

		redirect_to space_task_path(@space, @task)

		# put notices here stating whether successful or not.
	end

	def destroy
		@task = Task.find(params[:id])

		@task.destroy

		respond_to do |format|
			format.html { redirect_to space_tasks_path(@space) }
			format.json { head :no_content }
		end
	end

	def load_space
		@space = Space.find(params[:space_id])
	end

end
