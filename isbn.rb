require 'net/http'
require 'CGI'
require 'open-uri'
require 'rexml/document'

def get_isbn(s)
    access_key = '6Z7QHG8S'
    while (s)
      s.chomp!
      url = "http://isbndb.com/api/books.xml?access_key=" + access_key + "&index1=title&value1=" + CGI::escape(s)
      xml = REXML::Document.new(open(url).read)
      if (xml.elements["ISBNdb/BookList/BookData"])
        return xml.elements["ISBNdb/BookList/BookData"].attributes["isbn"]
      end
    end
end

puts get_isbn("Harry Potter")
