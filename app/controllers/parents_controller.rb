class ParentsController < ApplicationController
  before_action :authenticate_parent!, only: [:panel]

  def new
    @parent = Parent.new
  end

  def create
    @parent = Parent.new(parent_params)
    if @parent.save
      session[:parent_id] = @parent.id
      redirect_to panel_path, notice: "¡Cuenta creada exitosamente!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def panel
    @parent = current_parent
  end

  private

  def parent_params
    params.require(:parent).permit(:name, :email, :password, :password_confirmation)
  end

  def current_parent
    @current_parent ||= Parent.find_by(id: session[:parent_id])
  end

  def authenticate_parent!
    unless current_parent
      redirect_to login_path, alert: "Debes iniciar sesión primero"
    end
  end
end