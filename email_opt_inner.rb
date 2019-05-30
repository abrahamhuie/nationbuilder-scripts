require 'nationbuilder'
require 'CSV'

nation_slug = '[nation_slug]'
api_token = '[api_token]'
client = NationBuilder::Client.new(nation_slug, api_token, retries: 8)

#single request
params = {
  "id": #,
  person: {
  "email1_is_bad": false
  }
}

client.call(:people, :update, params)

#iterate through several ids in an array
nb_ids = []

nb_ids.each do |id|
	client.call(:people, :update, { "id": id, person: { "email1_is_bad": false } } )
	sleep(1)
end
