require_relative "vermic/version"
require_relative "vermic/pastebin"
require 'optparse'

# This module parses command line options
# for vermic command line utility.
module Vermic
  options = {}

  OptionParser.new do |opts|
    opts.banner = "This is command line utility which pastes your code on pastebin"

    opts.on("-v", "--version", "shows the current version") do |v|
      puts Vermic::VERSION
      exit
    end

    opts.on("-n", "--name N", "sets the name of the paste") do |n|
      options[:paste_name] = name
    end

    opts.on("-f", "--format F", "sets the format of the paste") do |f|
      options[:paste_format] = f
    end

    opts.on("-p", "--private", "makes the paste private(public is default)") do |p|
      options[:paste_private] = 1
    end

    opts.on("-e", "--expire", "sets the expire date of the paste") do |e|
      options[:paste_expire_date] = e
    end

  end.parse!

  puts PastebinWrapper::paste_file(ARGV[0])
end
