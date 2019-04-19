require 'nationbuilder'

nation_slug = '[nation_slug]'
api_token = '[api_token]'
client = NationBuilder::Client.new(nation_slug, api_token, retries: 8)

response = client.call(:events, :index, site_slug: 'site_slug', limit: 100)
paginated = NationBuilder::Paginator.new(client, response)

page1 = paginated

events1 = page1.body['results']

events1.each do |event|
  puts event['id']
end
#Iterate through the array of event pages and print the ids in the array
