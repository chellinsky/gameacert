class UserTasksController < ApplicationController
	def new
		if params[:task_id]
			@task = Task.find(params[:task_id])
			@user_task = UserTask.new(task_id: @task.id, user_id: current_user.id)
		else
			flash[:error] = "Task required"
		end
	rescue ActiveRecord::RecordNotFound
		render file: 'public/404', status: :not_found
	end

	def create
		if params[:user_task] && params[:user_task].has_key?('task_id')
			@task = Task.find(params[:user_task][:task_id])
			@user_task = UserTask.new(task_id: @task.id, user_id: current_user.id)
			@user_task.save
			flash[:notice] = "You successfully marked task #{@task.name} complete"
			@space = Space.find(@task.space_id)
			redirect_to game_space_path(@space.game_id, @space)
		else
			flash[:error] = "Task required"
			redirect_to root_path
		end
	end

end
