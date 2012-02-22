#!/usr/bin/env ruby
URL = "http://whatthecommit.com/"

require'Net/http'
getCommit = Net::HTTP.get(URI.parse(URL)).match(/<p>(.*?)<\/p>/m)[1].strip
gitr = /[acCzsneiovq]/
svnr =  /[qN]/

ARGV.each do |value|
  if ARGV.empty?
    $stderr.puts "required argument"
    exit 1
  elsif value.match(gitr)
    puts `git commit -#{value}m "#{getCommit}"`
  else
    $stderr.puts "wrong argument"
    exit 1
  end
end
puts getCommit

#Must check optparse & ostruct