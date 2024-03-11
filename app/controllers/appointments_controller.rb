class AppointmentsController < ApplicationController
  def index
    if params[:date].present?
      selected_date = Date.parse(params[:date])
      @appointments = Appointment.where(date: selected_date.beginning_of_day..selected_date.end_of_day)
    else
      @appointments = Appointment.where('date >= ? AND date <= ? AND start_time >= ?', Date.today.beginning_of_day, Date.today.end_of_day, Time.now).order(:start_time)
    end
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
    @appointment.user_id = current_user.id
    @appointment.appointment_creator_id = current_user.id
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
    # @markers = @appointments.geocoded.map do |appointment|
    #   {
    #     lat: appointment.latitude,
    #     lng: appointment.longitude,
    #     info_window_html: render_to_string(partial: "info_window", locals: {appointment: appointment})
    #   }
    # end
  end

  def destroy
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:appointment_id])
  end

  def appointment_params
    params.require(:appointment).permit(:title, :category, :child_id, :child_presence_mandatory, :date, :start_time, :end_time, :parent_in_charge_id, :address, :details)
  end
end
