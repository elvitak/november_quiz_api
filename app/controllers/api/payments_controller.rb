class Api::PaymentsController < ApplicationController
  def create
    # create a Stripe::Customer with Stripe API
    customer = Stripe::Customer.create(
      email: params[:payment][:email],
      source: params[:payment][:stripeToken]
    )

    # create a Stripe::Charge
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: params[:payment][:amount],
      currency: params[:payment][:currency],
      description: 'Payment for quiz'
    )
    binding.pry
    # response with charge status (paid)
    render json: { paid: charge.paid }, status: 201
  end
end
