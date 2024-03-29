class TasksController < ApplicationController
before_action :set_task, only: [:show, :destroy, :edit, :update]

  def index
    @tasks = Task.all
    @all_tasks_for_user = Task.all_tasks_for_user(current_user) if current_user
  end

  def show

  end

  def new
    @children = current_user.children
    @parents = @children.map(&:parents).flatten.uniq
    @task = Task.new
    @children = current_user.children
    @parents = @children.map(&:parents).flatten.uniq
  end

  def create
    @task = Task.new(task_params)
    @task.task_creator_id = current_user.id
    @task.child_id = task_params[:child_id]
    @task.status = false
    if @task.save
      redirect_to task_path(@task.id), notice: "Tâche créée avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @children = current_user.children
    @parents = @children.map(&:parents).flatten.uniq
  end

  def update

    @task.update(status: true) if params[:status]
    @task.update(task_params) if params[:task]

    if @task.save
      redirect_to task_path(@task), notice: "Changements enregistrés avec succès."
    else
      render :edit, status: :unprocessable_entity
    end

    # @children = current_user.children
    # @parents = @children.map(&:parents).flatten.uniq

  end

  def destroy
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :deadline, :child_id, :details, :requirements, :status, :rich_details, :category, :parent_in_charge_id, :attachment)
  end
end
