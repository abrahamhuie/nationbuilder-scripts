require 'nationbuilder'
require 'pp'

nation_slug = '[nation_slug]'
api_token = '[api_token]'
client = NationBuilder::Client.new(nation_slug, api_token, retries: 8)
response = client.call(:blog_posts, :index, site_slug: #, id: #, limit: 100)
paginated = NationBuilder::Paginator.new(client, response)
page1 = paginated
page2 = page1.next
page3 = page2.next

#Blog posts arrays, limit 100
blogs1 = response['results']
blogs2 = page1.body['results']
blogs3 = page2.body['results']

#Pretty print array of events
pp blogs1

#First event in the results array
blogs1.first

#Iterate through the array of events and print the ids in the array
blogs1.each do |blog|
puts blog['id']
end
