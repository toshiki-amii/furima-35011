class BuysController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @buy_buyer = BuyBuyer.new
  end

  def create
    binding.pry
    @item = Item.find(params[:item_id])
    @buy_buyer = BuyBuyer.new(buyer_params)
    if @buy_buyer.valid?
      pay_item
      @buy_buyer.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buy_buyer).permit(:postal, :prefecture_id, :city, :address, :building, :phone).merge(item_id: params[:item_id], user_id: current_user, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: buyer_params[:token],
        currency: 'jpy'
      )
  end

end
