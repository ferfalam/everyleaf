class TasksController < ApplicationController
    before_action :set_task, only: [:edit, :show, :update, :destroy]
    def index
      @tasks = Task.all.order(created_at: :desc)
    end
  
    def new
      @task = Task.new
    end
  
    def create
      @task = Task.new(task_params)
      if @task.save
        redirect_to tasks_path, notice: "Task created successfully"
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @task.update(task_params)
        redirect_to tasks_path, notice: "Task updated successfully"
      else
        render :edit
      end
    end
  
    def show
    end
  
    def destroy
      @task.destroy
      redirect_to tasks_path, notice: "Task deleted successfully"
    end
  
    private
    def set_task
      @task = Task.find(params[:id])
    end
  
    def task_params
      params.require(:task).permit(:name, :details)
    end
  
end
