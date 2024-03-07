class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
  end

  def my_appointments
    @appointments = Appointment.where(parent_in_charge_id: current_user_id)
  end

  # def childs_appointments

  # end

  def new
    @appointment = Appointment.new
  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:appointment_id])
  end
end
