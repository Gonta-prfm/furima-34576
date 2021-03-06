class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item,   only: [:index, :create]
  before_action :move_index, only: [:index, :create]

  def index
    @purchase_street_address = PurchaseStreetAddress.new
  end

  def create
    @purchase_street_address = PurchaseStreetAddress.new(private_params)
    if @purchase_street_address.valid?
      pay_item
      @purchase_street_address.save
      redirect_to root_path
    else 
      render :index
    end
  end

    private
    def private_params
      params.require(:purchase_street_address).permit(:postal_code, :prefecture_id, :municipality, :address, :buliding_name, 
                     :phone_number,).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: private_params[:token],
        currency: 'jpy'
      )
    end

    def set_item
      @item = Item.find(params[:item_id])
    end

    def move_index
      if current_user.id == @item.user_id || @item.purchase.present?
        redirect_to root_path
      end
    end
end


