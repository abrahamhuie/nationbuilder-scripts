require 'nationbuilder'
 
nation_slug = '[nation_slug]'
api_token = '[api_token]'
client = NationBuilder::Client.new(nation_slug, api_token, retries: 8)
 
donations = [ids]

donations.each do |id|
	client.call(:donations, :destroy, id: id)
end