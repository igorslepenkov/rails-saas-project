module StripeServices
  class PaymentIntent
    def initialize(params)
      @plan = params.require('plan')
    end

    def create
      plan_amount = calculate_order_amount(@plan)
      Stripe::PaymentIntent.create(
        amount: plan_amount,
        currency: 'usd',
        automatic_payment_methods: {
          enabled: true
        }
      )
    end

    private

    def calculate_order_amount(plan)
      plans_prices = {
        premium: 10
      }
      plans_prices[plan.to_sym] * 100
    end
  end
end