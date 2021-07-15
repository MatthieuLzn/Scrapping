require 'nokogiri'
require 'open-uri'



def get_townhall_mail
    page = Nokogiri::HTML(URI.open('http://annuaire-des-mairies.com/val-d-oise.html'))
    url = page.xpath('//a[@class = "lientxt"]/@href')
    mail_list = []
    url.each do |i|
        mail_page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/#{i}"))
        mail = mail_page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
        mail_list << mail.text
    end
    return mail_list
end






