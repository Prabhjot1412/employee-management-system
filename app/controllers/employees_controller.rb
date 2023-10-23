# frozen_string_literal: true

# This is the EmployeesController class, responsible for handling employee-related actions.
class EmployeesController < ApplicationController
  before_action :authenticate_user!
  # load_and_authorize_resource
  before_action :set_employee, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token

  # GET /employees or /employees.json
  def index
    @employees = User.all
  end

  # GET /employees/1 or /employees/1.json
  def show; end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit; end

  # POST /employees or /employees.json
  def create
    flash[:message] = if GraphqlService.create(employee_params)
                        'success'
                      else
                        'failure'
                      end

    redirect_to root_path
  end

  # PATCH/PUT /employees/1 or /employees/1.json
  def update
    flash[:message] = if GraphqlService.update(update_params)
                        'success'
                      else
                        'failure'
                      end

    redirect_to root_path
  end

  # DELETE /employees/1 or /employees/1.json
  def destroy
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee
    @employee = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def employee_params
    {
      name: params[:employee][:name],
      email: params[:employee][:email],
      password: params[:employee][:password]
    }
  end

  def update_params
    {
      id: @employee.id,
      name: params[:user][:name],
      email: params[:user][:email],
      password: params[:user][:password]
    }.reject { |_k, v| v.nil? }
  end
end
