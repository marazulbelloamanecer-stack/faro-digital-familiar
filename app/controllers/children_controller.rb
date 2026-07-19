class ChildrenController < ApplicationController
  before_action :authenticate_parent!

  def new
    @child = Child.new
  end

  def create
    @child = current_parent.children.new(child_params)
    if @child.save
      redirect_to panel_path, notice: "¡Hijo agregado exitosamente!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def zone
    @parent = current_parent
    @children = @parent.children
  end

  def play
    @child = current_parent.children.find(params[:id])
  end

  private

  def child_params
    params.require(:child).permit(:name, :age)
  end

  def current_parent
    @current_parent ||= Parent.find(session[:parent_id])
  end

  def authenticate_parent!
    redirect_to login_path, alert: "Debes iniciar sesión primero" unless session[:parent_id]
  end

  def cuento
  @cuento_id = params[:id]
end
end