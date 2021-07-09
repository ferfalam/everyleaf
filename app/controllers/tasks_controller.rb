class TasksController < ApplicationController
    before_action :set_task, only: [:edit, :update, :destroy]
    def index
      @tasks = Task.all
    end
  
    def new
      @task = Task.new
    end
  
    def create
        @task = Task.new(task_params)
        if @task.save
            redirect_to tasks_path, notice:"Task create successfully"
        else
            render :new
        end
    end
  
    def edit
    end
  
    def update
        if @task.update(task_params)
            redirect_to tasks_path, notice:"Task updated successfully"
        else
            render :new
        end
    end
  
    def destroy
        @task.destroy
        redirect_to tasks_path, notice:"Task deleted successfully"
    end
  
    private
    def set_task
      @task = Task.find(params[:id])
    end
    
    def task_params
        params.require(:task).permit(:name,:details)
    end
    
  end
  