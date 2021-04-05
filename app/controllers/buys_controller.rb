class BuysController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @buy_buyer = BuyBuyer.new
  end

  def create
    @buy_buyer = BuyBuyer.new(buyer_params)
    if @buy_buyer.valid?
      @buy_buyer.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
  def buyer_params
    params.require(:buy_buyer).permit(:postal, :prefecture_id, :city, :address, :building, :phone).merge(buy_id: current_user.id)
  end
end
