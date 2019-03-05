require 'nationbuilder'

nation_slug = '[nation_slug]'
api_token = '[api_token]'
client = NationBuilder::Client.new(nation_slug, api_token, retries: 8)

event_pages = []

event_pages.each do |id|
	client.call(:events, :destroy, site_slug: 'site_slug', id: id)
	puts "Deleted event:#{id}"
	sleep(6.5)
end
