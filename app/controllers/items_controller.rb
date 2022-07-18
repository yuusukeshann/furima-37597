class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, except: [:new, :create, :index, :show]
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    # メモ @item = Item.find(params[:id])
  end

  def edit
    # メモ @item = Item.find(params[:id])
  end

  def update
    # メモ @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    #メモ @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :brand_name, :expository_writing, :category_id, :condition_id, :delivery_charge_id,
                                 :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    # @item = Item.find(params[:id])
    redirect_to action: :index unless user_signed_in? && current_user.id == @item.user_id
  end


  def set_item
    @item = Item.find(params[:id])
  end

end
