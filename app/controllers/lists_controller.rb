class ListsController < ApplicationController
  before_action :find_list, only: [:show, :update, :destroy]
  before_action :find_user, only: [:new, :create]

  def index
    @lists = current_user.lists
  end

  def new
    @list = List.new(user_id: @user.id)
    @list.list_items.build
  end

  def show
  end

  def create
    @list = @user.lists.build(list_params)
    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      render :new
    end
  end

  def update
    if @list.update(list_params)
      redirect_to @list, notice: 'List was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to user_lists_path(@list.user), notice: 'List was successfully deleted.'
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title, :user_id, list_items_attributes: [:id, :content, :_destroy])
  end
end
