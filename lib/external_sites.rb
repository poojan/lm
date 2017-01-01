require 'open-uri'

module ExternalSites
  def self.fetch(url)
    Nokogiri::HTML(open(url)) do |config|
      config.options = Nokogiri::XML::ParseOptions::NOBLANKS
    end
  end

  def self.extract_tags_data(url)
    doc = self.fetch(url)

    tags = ['h1', 'h2', 'h3', 'a']
    tags.reduce([]) do |json, tag|
      doc.search(tag).each do |el|
        unless el.text.strip == ''
          json.push({ tag: tag, body: el.text.strip })
        end
      end
      json
    end
  end

end
