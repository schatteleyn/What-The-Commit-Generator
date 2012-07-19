#!/usr/bin/env ruby

require 'Net/http'
require 'optparse'
require 'pp'

URL = "http://whatthecommit.com/"

getCommit = Net::HTTP.get(URI.parse(URL)).match(/<p>(.*?)<\/p>/m)[1].strip

optparse = OptionParser.new do |opts|

    opts.banner = "Usage: ruby wtc.rb [option][argument]"
    
    opts.on( '-h', '--help', 'Display this screen') do
      puts opts
      puts 'The "m" argument is automatically set. You can use the following arguments: '
      puts 'git: a, c, C, z, s, n, e, i, o, v, a'
      puts 'svn: q, n'
      exit
    end
    
    opts.on("-g", "--git OPT", [:a, :c, :C, :z, :s, :n, :e, :i, :o, :v, :q], "Commit with git") do |g|
      puts `git commit -"#{g}"m "#{getCommit}"`
    end
    
    opts.on("-s", "--svn OPT", [:q, :N], "Commit with svn") do |s|
      puts `svn commit -"#{s}"m "#{getCommit}"`
    end

end

optparse.parse!
puts "Add -h for help"
puts "Commit message: #{getCommit}"
