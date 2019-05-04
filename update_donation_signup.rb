require 'nationbuilder'

nation_slug = '[nation_slug]'
api_token = '[api_token]'
client = NationBuilder::Client.new(nation_slug, api_token, retries: 8)

params = {
	"id": #,
	"donation": {
      "donor_id": #,
      	}
}
}

client.call(:donations, :update, params)
