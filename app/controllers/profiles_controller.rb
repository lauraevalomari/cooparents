class ProfilesController < ApplicationController
  def show
    @list_children = current_user.children.map { |child| child.first_name }

    @all_tasks_for_user = Task.all_tasks_for_user(current_user) if current_user
    @all_tasks_count = @all_tasks_for_user.count if current_user
  end
end
