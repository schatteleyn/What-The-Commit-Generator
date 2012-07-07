#!/usr/bin/env ruby

require 'Net/http'
require 'optparse'
require 'pp'

URL = "http://whatthecommit.com/"

getCommit = Net::HTTP.get(URI.parse(URL)).match(/<p>(.*?)<\/p>/m)[1].strip

options = {}
opts = OptionParser.new do |opts|

    opts.banner = "Usage: wtc.rb [option][argument]"
    
    opts.on( '-h', '--help', 'Display this screen') do
      puts opts
      exit
    end
    
    opts.on("-g", "--git OPT", [:a, :c, :C, :z, :s, :n, :e, :i, :o, :v, :q], "Commit with git") do |g|
      puts `git commit -"#{g}"m "#{getCommit}"`
    end
    
    opts.on("-s", "--svn OPT", [:q, :N], "Commit with svn") do |s|
      puts `svn commit -"#{s}"m "#{getCommit}"`
    end

   # ARGV.each do |value|
   #   if ARGV.empty?
   #     $stderr.puts "required argument"
   #     exit 1
   #   elsif value.match(gitr)
   #     puts `git commit -#{value}m "#{getCommit}"`
   #   else
   #     $stderr.puts "wrong argument"
   #     exit 1
   #   end
   # end
   # puts getCommit

end

optparse.parse!

pp "Options:", options
pp "ARGV:", ARGV
puts getCommit