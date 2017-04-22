require 'net/http'
require 'CGI'
require 'open-uri'
require 'rexml/document'

access_key = '6Z7QHG8S'
print "Enter a title: "
title = gets.chomp
url = "http://isbndb.com/api/books.xml?access_key=" + access_key + "&index1=title&value1=" + CGI::escape(title)
xml = REXML::Document.new(open(url).read)
puts "ISBN: " + xml.elements["ISBNdb/BookList/BookData"].attributes["isbn"]
