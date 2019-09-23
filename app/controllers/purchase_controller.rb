class PurchaseController < ApplicationController

  before_action :set_item, only: [:index, :pay, :done]
  before_action :set_card, only: [:index, :pay]

  def index
    if @card.blank?
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = Rails.application.credentials.PAYJP_PRIVATE_KEY
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
    render layout: "register-layout"
  end

  def pay
    Payjp::api_key = Rails.application.credentials.PAYJP_PRIVATE_KEY
    Payjp::Charge.create(
      :amount => @item.price,
      :customer => @card.customer_id,
      :currency => 'jpy'
    )
    redirect_to done_item_purchase_index_path(@item.id)
  end

  def done
    @@item.update_attribute(:condition, 3)
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_catd
    @card = Card.where(user_id: current_user.id).first
  end
end
