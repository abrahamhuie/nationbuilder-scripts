require 'nationbuilder'
 
nation_slug = '[nation_slug]'
api_token = '[api_token]'
client = NationBuilder::Client.new(nation_slug, api_token, retries: 8)

params = {
  id: 286740,
  person: {
    last_name: "Pina",
    first_name: "Jimmy"
  }
}

client.call(:people, :update, params)
