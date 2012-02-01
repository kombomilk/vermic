require 'optparse'
require_relative "vermic/version"
require_relative "vermic/pastebin"
require_relative "vermic/validator"

# This module parses command line options
# for vermic command line utility.
#
module Vermic
  options = Hash.new

  OptionParser.new do |opts|
    opts.banner = "This is command line utility which pastes your code on pastebin"

    opts.on("-v", "--version", "shows the current version") do |v|
      puts Vermic::VERSION
      exit
    end

    opts.on("-n", "--name N", "sets the name of the paste") do |n|
      options[:paste_name] = name
    end

    opts.on("-f", "--format F", "sets the format of the paste") do |format|
      options[:paste_format] = format
    end

    opts.on("-p", "--private", "makes the paste private(public is default)") do |private|
      options[:paste_private] = 1
    end

    opts.on("-e", "--expire E", "sets the expire date of the paste") do |expire_date|
      options[:paste_expire_date] = expire_date
    end

  end.parse!

  options[:file_name] = ARGV[0] if ARGV[0] != nil

  Validator::validate_options(options)

  if Validator::any_errors?
    Validator::print_errors
  else
    puts PastebinWrapper::paste_file(options)
  end
end
