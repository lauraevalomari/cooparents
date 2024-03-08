class AppointmentsController < ApplicationController
  def index
      # Scope your query to the dates being shown:
      start_date = params.fetch(:date, Date.today).to_date

      # For a monthly view:
      @appointments = Appointment.where(starts_at: date.beginning_of_month.beginning_of_week..date.end_of_month.end_of_week)

      # Or, for a weekly view:
        @appointments = Appointment.where(starts_at: date.beginning_of_week..start_date.end_of_week)
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
    @appointment = Appointment.new(appointment_params)
    @appointment.save
    # No need for app/views/restaurants/create.html.erb
    redirect_to appointment_path(@appointment)
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

  def appointment_params
    params.require(:appointment).permit(:title, :date, :start_time, :end_time, :rating)
  end

end
