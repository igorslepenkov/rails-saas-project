Rails.configuration.stripe = {
  pulishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
  secrete_key: ENV['STRIPE_SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secrete_key]
