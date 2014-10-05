class ChargesController < ApplicationController


def new
end

def create
	Stripe.api_key = "sk_test_1WB8cexbqa7n6KerhleA6t8k"
  # Amount in cents
  @amount = 5000

  customer = Stripe::Customer.create(
    :email => 'example@stripe.com',
    :card  => params[:stripeToken]
  ) 

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to charges_path
end

def index
end
end