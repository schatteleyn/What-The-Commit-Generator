#!/usr/bin/env ruby
URL = "http://whatthecommit.com/"

require'Net/http'
getCommit = Net::HTTP.get(URI.parse(URL)).match(/<p>(.*?)<\/p>/m)[1].strip
gitr = /[acCzsneiovq]/
svnr =  /[qN]/

ARGV.each do |value|
  if value.match(gitr)
    puts `git commit -#{value}m "#{getCommit}"`
  end
end
puts getCommit
