class SessionsController < ApplicationController
  def new
  end

  def create
    parent = Parent.find_by(email: params[:email])

    # 👇 AQUÍ VA EL CÓDIGO NUEVO (justo después de buscar al padre)
    if parent.nil?
      flash[:alert] = "No encontramos tu cuenta. ¿Quieres registrarte?"
      redirect_to signup_path and return
    end

    if parent.authenticate(params[:password])
      session[:parent_id] = parent.id
      redirect_to panel_path, notice: "¡Bienvenido de vuelta!"
    else
      flash.now[:alert] = "Correo o contraseña incorrectos"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:parent_id] = nil
    redirect_to root_path, notice: "Has cerrado sesión"
  end
end