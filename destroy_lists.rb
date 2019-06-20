require 'nationbuilder'
require 'CSV'

nation_slug = '[nation_slug]'
api_token = '[api_key]'
client = NationBuilder::Client.new(nation_slug, api_token, retries: 8)

puts "Connected to #{nation_slug}."

lists = [#list_ids]

puts "Starting list delete."

lists.each do |list|
	puts "Deleting id:#{list}"
	client.call(:lists, :destroy, id: list)
	sleep(1)
end

puts "Job complete"
