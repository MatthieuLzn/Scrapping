require 'nokogiri'
require 'open-uri'

#Recuperer tout les noms des députés:
def deputy_name
    page = Nokogiri::HTML(URI.open('https://www2.assemblee-nationale.fr/deputes/liste/alphabetique'))
    name = page.xpath('//a[contains(@href, "/deputes/fiche/OMC")]')
    name_list = []
    name.each do |i|
        name_list << i.text
    end
    return name_list
end

#Recuperer l'email
def get_mail(url)
    page = Nokogiri::HTML(URI.open(url))
    mail = page.xpath('/html/body/div[1]/div[2]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li[2]/a')
    return mail.text
end


#Extraire les url
def extract_url_mail
    page = Nokogiri::HTML(URI.open('https://www2.assemblee-nationale.fr/deputes/liste/alphabetique'))
    url = []
    url_page = page.xpath('///a[contains(@href, "/deputes/fiche/OMC")]/@href')
    url_page.each do |i|
        mail_page = "https://www2.assemblee-nationale.fr#{i}"
        url << mail_page
    end
    return url
end

def perform
    url = extract_url_mail

    mail_list = []
    url.each do |url|
        mail = get_mail(url)
        puts mail
        mail_list << mail
        
    end

    puts mail_list
end

perform