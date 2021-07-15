require 'nokogiri'
require 'open-uri'

#page = Nokogiri::HTML(URI.open("ton_url.fr"))
page = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))


name = page.xpath('//a[contains(@href, "/markets/")]')
 name.each do |values|
    puts values.text
 end

