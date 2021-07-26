class TasksController < ApplicationController
    before_action :set_task, only: [:edit, :show, :update, :destroy]
    def index
      if params[:sort_expired].present?
        @tasks = current_user.tasks.order(deadline: :asc)
      else
        @tasks = current_user.tasks.order(created_at: :desc)
      end

      if params[:sort_priority].present?
        @tasks = current_user.tasks.order(priority: :desc)
      else
        @tasks = current_user.tasks.order(created_at: :desc)
      end

      if params[:task].present?
        if !params[:task][:name].empty? && !params[:task][:status].empty? && !params[:task][:tag_id].empty?
          @tasks = []
          TagTask.where(tag_id: params[:task][:tag_id]).each do |tag_task|
            if tag_task.task.user_id == current_user.id
              if tag_task.task.name.match(/#{params[:task][:name]}/i)
                if tag_task.task.status == params[:task][:status]
                  @tasks << tag_task.task
                end
              end
            end
          end
        elsif !params[:task][:name].empty? 
          @tasks = current_user.task.where("name LIKE ?", "%#{params[:task][:name]}%")
        elsif !params[:task][:status].empty? 
          @tasks = current_user.task.where(status: params[:task][:status])
        elsif !params[:task][:tag_id].empty?
          @tasks = []
          TagTask.where(tag_id: params[:task][:tag_id]).each do |tag_task|
            if tag_task.task.user_id == current_user.id
              @tasks << tag_task.task
            end
          end
        else
          @tasks = current_user.tasks.order(created_at: :desc)
        end
      end
    end
  
    def new
      @task = Task.new
      @task.user_id = current_user.id
    end
  
    def create
      @task = Task.new(task_params)
      @task.user_id = current_user.id
      if @task.save
        params[:task][:tag_ids].each do |tag_id|
          @task.tag_task.create(tag_id: tag_id)
        end
        redirect_to tasks_path, notice: "Task created successfully"
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @task.update(task_params)
        TagTask.where(task_id: @task.id).each do |tag_task|
          tag_task.destroy
        end
        params[:task][:tag_ids].each do |tag_id|
          @task.tag_task.create(tag_id: tag_id)
        end
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
      params.require(:task).permit(:name, :details, :deadline, :status, :priority)
    end
  
end
