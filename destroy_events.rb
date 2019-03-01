require 'nationbuilder'

nation_slug = '[nation_slug]]'
api_token = '[api_token]'
client = NationBuilder::Client.new(nation_slug, api_token, retries: 8)

#array of ids
event_pages = [array of event ids]

#splits array into batches of 10 and assigns to subarray
a1, a2, a3, a4, a5 = event_pages.each_slice(10).to_a

#destroys 10 event page ids at a time for performance reasons
a1.each do |id|
	client.call(:events, :destroy, site_slug: 'nation_slug', id: id)
end

sleep(65)
# delay 65 seconds to allow page destroy to complete

a2.each do |id|
	client.call(:events, :destroy, site_slug: 'nation_slug', id: id)
end

sleep(65)

a3.each do |id|
	client.call(:events, :destroy, site_slug: 'nation_slug', id: id)
end

sleep(65)

a4.each do |id|
	client.call(:events, :destroy, site_slug: 'nation_slug', id: id)
end

sleep(65)

a5.each do |id|
	client.call(:events, :destroy, site_slug: 'nation_slug', id: id)
end
