class ListItemsController < ApplicationController
  before_action :find_list_item, only: [:show, :edit, :update, :destroy]
  before_action :find_list, only: [:index, :new]

  def index
    @list_items = @list.list_items
  end

  def show
  end

  def new
    @list_item = @list.list_items.new
  end

  private 

  def find_list_item
    @list_item = ListItem.find(params[:id])
  end

  def find_list
    @list = List.find(params[:list_id])
  end

  def list_item_params
    params.reqiure(:list_item).permit(:content, :list_id)
  end
end
