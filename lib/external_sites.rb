require 'open-uri'

module ExternalSites
  def self.fetch(url)
    Nokogiri::HTML(open(url)) do |config|
      config.options = Nokogiri::XML::ParseOptions::NOBLANKS
    end
  end

  def self.extract_tags_data(url)
    doc = self.fetch(url)

    doc.css('h1, h2, h3, a').map do |el|
      href = el.attribute('href').value rescue nil

      {
        tag: el.name,
        body: el.text,
        href: href
      }
    end
  end

end
