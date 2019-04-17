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
page2 = page1.next
page3 = page2.next
page4 = page3.next
page5 = page4.next
page6 = page5.next
page7 = page6.next
#pagination results

tags_array1 = page1.body["results"]
tags_array2 = page2.body["results"]
tags_array3 = page3.body["results"]
tags_array4 = page4.body["results"]
tags_array5 = page5.body["results"]
tags_array6 = page6.body["results"]
tags_array7 = page7.body["results"]
#push pagination results into an array of tags

tags_1 = []
tags_2 = []
tags_3 = []
tags_4 = []
tags_5 = []
tags_6 = []
tags_7 = []

puts "Processing..."

tags_array1.each {|x| tags_1.push(x["name"]) }
sleep(5)
tags_array2.each {|x| tags_2.push(x["name"]) }
sleep(5)
tags_array3.each {|x| tags_3.push(x["name"]) }
sleep(5)
tags_array4.each {|x| tags_4.push(x["name"]) }
sleep(5)
tags_array5.each {|x| tags_5.push(x["name"]) }
sleep(5)
tags_array6.each {|x| tags_6.push(x["name"]) }
sleep(5)
tags_array7.each {|x| tags_7.push(x["name"]) }
sleep(5)
#pushes tag names into array

puts "Getting tags from #{nation_slug}, adding them to CSV #{nation_slug}_people_tags.csv."

CSV.open("#{nation_slug}_people_tags.csv", "w") do |csv|
  csv << tags_1
  sleep(5)
  csv << tags_2
  sleep(5)
  csv << tags_3
  sleep(5)
  csv << tags_4
  sleep(5)
  csv << tags_5
  sleep(5)
  csv << tags_6
  sleep(5)
  csv << tags_7
  sleep(5)
end

puts "CSV ready."
