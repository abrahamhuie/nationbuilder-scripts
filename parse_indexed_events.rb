require 'nationbuilder'
require 'pp'
require 'json'

nation_slug = '[nation_slug]'
api_token = '[api_token]'
client = NationBuilder::Client.new(nation_slug, api_token, retries: 8)

#Paginated index of NB Events
index = client.call(:events, :index, site_slug: 'site_slug')

#Array of events
events = index['results']

#Pretty print array of events
pp events

#First event in the results array
index['results'].first

#Iterate through the array of events and print the ids in the array
events.each do |event|
puts event['id']
end