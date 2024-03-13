class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @first_appointment_today = Appointment.daily_appointments(current_user).order(start_time: :asc).first
  end


end
