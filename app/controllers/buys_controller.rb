class BuysController < ApplicationController

  def index
    @buy_buyer = BuyBuyer.new
  end

  def create
    @buy_buyer = BuyBuyer.new(buyer_params)
    if @donation_address.valid?
      @donation_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def buyer_params
    params.require(:buy_buyer).permit(:postal, :prefecture_id, :city, :address, :building, :phone).merge(buy_id: current_user.id)
  end
end
