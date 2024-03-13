class TasksController < ApplicationController
before_action :set_task, only: [:show, :destroy, :edit, :update]

  def index
    @tasks = Task.all
    @tasks_to_do_today = Task.where("due_date = ?", Date.today).count
    @tasks_preview = Task.where("due_date = ?", Date.today).order(created_at: :desc).limit(2)
    @tasks_completed_today = Task.where("due_date = ? AND status = ?", Date.today, "completed").count
    @percentage_completed = (@tasks_completed_today.to_f / @tasks_to_do_today.to_f) * 100
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.task_creator_id = current_user.id
    if @task.save
      redirect_to task_path(@task.id), notice: "Tâche créée avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    @task.update(params[:task])
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def set_task
    task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :deadline, :requirements, :status, :details, :category, :parent_in_charge_id)
  end
end
