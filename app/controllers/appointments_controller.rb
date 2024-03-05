class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
  end

  def create
    @appointment = Appointment.new(params[:appointment])
    @appointment.save
  end

  def new
    @appointment = Appointment.new
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.update(params[:appointment])
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
  end
end
