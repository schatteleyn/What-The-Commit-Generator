#!/usr/bin/env ruby
URL = "http://whatthecommit.com/"

require'Net/http'
getCommit = Net::HTTP.get(URI.parse(URL)).match(/<p>(.*?)<\/p>/m)[1].strip

ARGV.each do |value|
  puts `git commit -#{value} "#{getCommit}"`
end
puts getCommit
