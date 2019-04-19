require 'nationbuilder'
require 'CSV'

nation_slug = '[nation_slug]'
api_token = '[api_token]'
client = NationBuilder::Client.new(nation_slug, api_token, retries: 8)

puts "Connected to #{nation_slug}."

response = client.call(:people_tags, :index, limit: 100)
paginated = NationBuilder::Paginator.new(client, response)
#initiate pagination

page1 = paginated
#pagination results

tags_array1 = page1.body["results"]
#push pagination results into an array of tags

tags_1 = []

puts "Processing..."

tags_array1.each {|x| tags_1.push(x["name"]) }
sleep(5)
#pushes tag names into array

puts "Getting tags from #{nation_slug}, adding them to CSV #{nation_slug}_people_tags.csv."

CSV.open("#{nation_slug}_people_tags.csv", "w") do |x|
  tags_1.each do |y|
    x << [y]
  end
end
#adds tags to csv

puts "CSV ready."
