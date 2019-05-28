require 'nationbuilder'

nation_slug = '[nation_slug]'
api_token = '[api_token]'
client = NationBuilder::Client.new(nation_slug, api_token, retries: 8)

response = client.call(:blog_posts, :index, site_slug: '[site_slug], id: [id], limit: 100)
paginated = NationBuilder::Paginator.new(client, response)

page1 = paginated

blogs1 = page1['results']
#Array of blog posts

blogs1.each do |blog|
  puts blog['id']
end
#Iterate through the array of blog posts and print the ids in the array
