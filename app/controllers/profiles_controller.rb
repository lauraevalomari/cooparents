class ProfilesController < ApplicationController
  def show
    @list_children = current_user.children.map { |child| child.first_name }

    @all_tasks_for_user = Task.all_tasks_for_user(current_user) if current_user
    @all_tasks_count = @all_tasks_for_user.count if current_user
  end

  def edit
    @children = current_user.children
    @parents = @children.map(&:parents).flatten.uniq
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path, notice: "Changements enregistrés avec succès."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:email, :first_name, :phone_number, :encrypted_password, :photo)
  end
end
