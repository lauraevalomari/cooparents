class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.geocoded
    @markers = @appointments.map do |appointment|
      {
        lat: appointment.latitude,
        lng: appointment.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { appointment: appointment }),
        marker_html: render_to_string(partial: "marker")
      }
    end
      # Scope your query to the dates being shown:
      # start_date = params.fetch(:date, Date.today).to_date

      # # For a monthly view:
      # @appointments = Appointment.where(starts_at: date.beginning_of_month.beginning_of_week..date.end_of_month.end_of_week)

      # # Or, for a weekly view:
      #   @appointments = Appointment.where(starts_at: date.beginning_of_week..start_date.end_of_week)
  end

  def my_appointments
    @appointments = Appointment.where(parent_in_charge_id: current_user.id)
  end

  def childs_appointments
  end

  def new
    @children = current_user.children
    @parents = @children.map(&:parents).flatten.uniq
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    parent_in_charge = User.find_by(email: params[:appointment][:parent_in_charge_id])
    @appointment.parent_in_charge_id = parent_in_charge.id
    @appointment.appointment_creator = current_user
    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def show
    @appointment = Appointment.find(params[:id])
    @marker = @appointment.geocoded.map do |appointment|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {appointment: appointment})
      }
    end
  end

  def destroy
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:appointment_id])
  end

  def appointment_params
    params.require(:appointment).permit(:title, :child_id, :date, :start_time, :end_time, :parent_in_charge, :address, :category)
  end
end
