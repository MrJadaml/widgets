class WidgetsController < ApplicationController

  def index
    @widgets = Widget.all
  end

  def new
    @widget = Widget.new
  end

  def create
    @widget = Widget.new(widget_params)
    @widget.save
    redirect_to root_path
  end

  def edit
    @widget = Widget.find(params[:id])
  end

  def update
    @widget = Widget.find(params[:id])
    if @widget.update(widget_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @widget = Widget.find(params[:id])
  end

  def destroy
    @widget = Widget.find(params[:id])
    @widget.destroy
    redirect_to widgets_path
  end

  private

  def widget_params
    params.require(:widget).permit(:name, :description, :age)
  end
end
