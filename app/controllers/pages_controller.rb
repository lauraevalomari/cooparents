class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @three_appointments_to_come = Appointment.three_appointments_to_come(current_user) if current_user
    @two_first_tasks_for_user = Task.two_first_tasks_for_user(current_user) if current_user
    @two_first_tasks_count = @two_first_tasks_for_user.count if current_user

    @all_tasks_for_user = Task.all_tasks_for_user(current_user) if current_user
    @all_tasks_count = @all_tasks_for_user.count if current_user

    @all_appointments_for_user = Appointment.all_appointments_for_user(current_user) if current_user
    @all_appointments_for_count = @all_appointments_for_user.count if current_user

    @all_pending_tasks_for_user = Task.all_pending_tasks_for_user(current_user) if current_user
    @all_pending_tasks_count = @all_pending_tasks_for_user.count if current_user

    total_tasks = Task.where(parent_in_charge: current_user).count
    completed_tasks = Task.where(parent_in_charge: current_user, status: true).count
    if total_tasks != 0
      @percentage_completed = ((completed_tasks.to_f / total_tasks.to_f) * 100).to_i
    else
      @percentage_completed = 0
    end
    redirect_to new_user_session_path unless current_user
  end
end
