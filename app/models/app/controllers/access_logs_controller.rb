class AccessLogsController < ApplicationController
  before_action :authenticate_employee!

  def index
    @access_logs = AccessLog.all
  end

  def new
    @access_log = AccessLog.new
  end

  def create
    @access_log = AccessLog.new(access_log_params)
    if @access_log.save
      redirect_to access_logs_path, notice: 'Acceso registrado correctamente.'
    else
      render :new
    end
  end

  def edit
    @access_log = AccessLog.find(params[:id])
  end

  def update
    @access_log = AccessLog.find(params[:id])
    if @access_log.update(access_log_params)
      redirect_to access_logs_path, notice: 'Acceso actualizado correctamente.'
    else
      render :edit
    end
  end

  def export_to_excel
    @access_logs = AccessLog.all
    respond_to do |format|
      format.xlsx do
        render xlsx: 'access_logs', filename: 'access_logs.xlsx'
      end
    end
  end

  private

  def access_log_params
    params.require(:access_log).permit(:employee, :entry_time, :exit_time, :vehicle_id, :visitor_id)
  end
end
