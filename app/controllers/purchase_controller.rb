class PurchaseController < ApplicationController

  before_action :set_item, only: [:index, :pay, :done]
  before_action :set_card, only: [:index, :pay, :done]

  def index
    @region = Region.all
    if @card.blank?
      redirect_to controller: "mypage/card", action: "new"
    else
      set_payjp
      render layout: "register-layout"
    end
  end

  def pay
    Payjp::api_key = Rails.application.credentials.PAYJP_PRIVATE_KEY
    Payjp::Charge.create(
      :amount => @item.price,
      :customer => @card.customer_id,
      :currency => 'jpy'
    )
    redirect_to done_item_purchase_index_path(@item)
  end

  def done
    @region = Region.all
    @item.update_attribute(:sold_condition, 3)
    set_payjp
    render layout: "register-layout"
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def set_payjp
    Payjp.api_key = Rails.application.credentials.PAYJP_PRIVATE_KEY
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.card_id)
  end
end
