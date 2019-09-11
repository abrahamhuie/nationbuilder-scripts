require 'nationbuilder'
require 'CSV'

nation_slug = '[nation_slug]'
api_token = '[api_token]'
client = NationBuilder::Client.new(nation_slug, api_token, retries: 8)

puts "Connected to #{nation_slug}."

response = client.call(:people_tags, :index, limit: 100)
paginated = NationBuilder::Paginator.new(client, response)

page1 = paginated
page2 = page1.next
page3 = page2.next
page4 = page3.next
page5 = page4.next
page6 = page5.next

tags_array = []

page1.body["results"].each { |x| tags_array << x["name"]}
page2.body["results"].each { |x| tags_array << x["name"]}
page3.body["results"].each { |x| tags_array << x["name"]}
page4.body["results"].each { |x| tags_array << x["name"]}
page5.body["results"].each { |x| tags_array << x["name"]}
page6.body["results"].each { |x| tags_array << x["name"]}

puts "Getting tags from #{nation_slug}, adding them to CSV #{nation_slug}_people_tags.csv."

CSV.open("#{nation_slug}_people_tags.csv", "w") do |x|
  tags_array.each do |y|
    x << [y]
  end
end

puts "CSV ready."
