class ChildrenController < ApplicationController
  before_action :set_child, only: [:show, :edit, :update, :destroy]

  def index
    @children = Child.all
  end

  def new
    @child = Child.new
  end

  def create
    @child = Child.new(child_params)
    @child.first_parent_id = @current_user.id
    if @child.save
      redirect_to child_path(@child.id), notice: "Enfant ajouté !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    set_child
  end

  def edit
  end

  def update
    @child.update(child_params)
  end

  def destroy
    @child = Child.find(params[:id])
    @child.destroy
    redirect_to children_path, status: :see_other
  end

  private

  def set_child
    @child = Child.find(params[:child_id])
  end

  def child_params
    params.require(:child).permit(:first_name, :last_name, :birth_date, :birth_place, :school, :first_parent_id, :second_parent_id)
  end
end
