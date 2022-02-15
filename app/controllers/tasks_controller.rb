class TasksController < ApplicationController

  before_action :find_task, only: [ :show, :edit, :update, :destroy ]

  def index
    @tasks = Task.all
  end

  def show
    # @task = Task.find(params[:id])
  end

  def new
    @tasks = Task.new
  end

  def create
    @task = Task.new(set_task)
    @task.save
    redirect_to tasks_path(@restaurant)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task.update(set_task)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def set_task
    params.require(:task).permit(:title, :details, :completed)
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
