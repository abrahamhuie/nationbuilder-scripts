require 'nationbuilder'
 
nation_slug = '[nation_slug]'
api_token = '[api_token]'
client = NationBuilder::Client.new(nation_slug, api_token, retries: 8)

params = {
  person: {
    last_name: "Pina",
    first_name: "Jimmy",
    id: 286740
  }
}

client.call(:people, :update, params)