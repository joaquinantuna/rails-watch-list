class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]
  def index
    @lists = List.all
  end

  def show
  end

  def new
    @list = List.new # needed to instantiate the form_for
  end

  def create
    @list = List.new(list_params)
    @list.save
    # Will raise ActiveModel::ForbiddenAttributesError
    # no need for app/views/restaurants/create.html.erb
    redirect_to list_path(@list)
  end

  def destroy
    @list.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end

end
