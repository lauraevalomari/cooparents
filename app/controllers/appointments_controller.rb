class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.where(date: Date.today).order(:start_time)
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
    @children = current_user.children
    @parents = @children.map(&:parents).flatten.uniq
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
    params.require(:appointment).permit(:title, :child, :date, :start_time, :end_time, :parent_in_charge, :address, :category)
  end
end
