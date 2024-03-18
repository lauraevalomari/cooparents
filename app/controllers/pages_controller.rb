class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @five_appointments_to_come = Appointment.five_appointments_to_come(current_user) if current_user
    @two_first_tasks_for_user = Task.two_first_tasks_for_user(current_user) if current_user
    @two_first_tasks_count = @two_first_tasks_for_user.count if current_user
    redirect_to new_user_session_path unless current_user
  end

end
