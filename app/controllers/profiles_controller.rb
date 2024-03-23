class ProfilesController < ApplicationController
  def show
    @list_children = current_user.children.map { |child| child.first_name }
  end
end
