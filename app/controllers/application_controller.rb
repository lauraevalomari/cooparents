class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # def my_children
  #  @children = Child.where("first_parent_id = ? OR second_parent_id = ?", current_user.id, current_user.id)
  # end
end
