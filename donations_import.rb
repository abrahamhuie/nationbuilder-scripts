require 'csv'
require 'nationbuilder'

slug = 'slug'
token = 'api_key'

client = NationBuilder::Client.new(slug, token)
errors = []

puts "Starting at #{Time.now}."

CSV.foreach('[file_name].csv', headers: true) do |row|

  donation = {
    donation: {
      "donor_id": row['signup_id'],
      "amount_in_cents": row['amount_in_cents'],
      "succeeded_at": row['succeeded_at'],
      "payment_type_name": row['payment_type_name'],
      "billing_address": {
        "address1": row['address1'],
        "address2": row['address2'],
        "city": row['city'],
        "state": row['state'],
        "zip": row['zip']
      },
      "[custom_field_slug]": row['custom_field_slug]'],
    }
  }
  begin
  	client.call(:donations, :create, donation)
  rescue => e
  	errors << e 
  end
end

puts errors
puts "Finished at #{Time.now}".
