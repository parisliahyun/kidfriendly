Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_lre2JS3OVUNRpIPcNMSxaoWS'],
  :secret_key      => ENV['sk_test_VlNyeISArM9COjlFMXVyzPon']
}

Stripe.api_key = Rails.configuration.stripe['sk_test_VlNyeISArM9COjlFMXVyzPon']

Stripe.api_key = "sk_test_VlNyeISArM9COjlFMXVyzPon"
STRIPE_PUBLIC_KEY = "pk_test_lre2JS3OVUNRpIPcNMSxaoWS"