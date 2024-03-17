class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @five_appointments_to_come = Appointment.five_appointments_to_come(current_user)
  end

end
