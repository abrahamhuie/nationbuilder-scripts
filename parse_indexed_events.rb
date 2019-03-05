require 'nationbuilder'
require 'pp'

nation_slug = '[nation_slug]'
api_token = '[api_token]'
client = NationBuilder::Client.new(nation_slug, api_token, retries: 8)
response = client.call(:events, :index, site_slug: 'site_slug', limit: 100)
paginated = NationBuilder::Paginator.new(client, response)
page1 = paginated
page2 = page1.next
page3 = page2.next

#Events arrays, limit 100
events1 = response['results']
events2 = page1.body['results']
events3 = page2.body['results']

#Pretty print array of events
pp events1

#First event in the results array
events1.first

#Iterate through the array of events and print the ids in the array
events1.each do |event|
puts event['id']
end
