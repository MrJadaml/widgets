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

  private

  def widget_params
    params.require(:widget).permit(:name, :description, :age)
  end
end
