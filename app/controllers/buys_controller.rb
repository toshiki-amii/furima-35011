class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create, ]
  before_action :move_to_top, only: [:index, :create]
  

  def index
    @buy_buyer = BuyBuyer.new
  end

  def create
    @buy_buyer = BuyBuyer.new(buyer_params)
    if @buy_buyer.valid?
      pay_item
      @buy_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buy_buyer).permit(:postal, :prefecture_id, :city, :address, :building, :phone).merge(
      item_id: params[:item_id], user_id: current_user.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_top
    redirect_to controller: :items, action: :index if @item.buy.present? || current_user.id == @item.user.id 
  end

end
