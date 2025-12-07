require_relative "client"

client = Client.new
client.payment_service.make_payment("cred")
client.payment_service.make_payment("ashish@ybl")
client.payment_service.make_payment("nope")
