require 'nationbuilder'

nation_slug = '[nation_slug]'
api_token = '[api_token]'
client = NationBuilder::Client.new(nation_slug, api_token, retries: 8)

spam_pages = []

spam_pages.each do |id|
	client.call(:blog_posts, :destroy, site_slug: '[site_slug]', blog_id: #, blog_post_id: #)
	puts "Deleted blog post:#{id}"
	sleep(6.5)
end
