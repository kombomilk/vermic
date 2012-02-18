require 'optparse'
require 'clipboard'
require_relative "vermic/version"
require_relative "vermic/pastebin"
require_relative "vermic/validator"

# This module parses command line options
# for vermic command line utility.
#
module Vermic
  options = Hash.new

  parser = OptionParser.new do |opts|
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

  end

  begin parser.parse!
  rescue OptionParser::InvalidOption 
    puts "Invalid option, see --help for list of options"
    exit

  rescue OptionParser::MissingArgument => e
    puts e
    exit
  end

  options[:file_name] = ARGV[0]

  Validator::validate_options(options)

  if Validator::any_errors?
    Validator::print_errors
  else
    result = PastebinWrapper::paste_file(options)
    puts result
    if result =~ /^https?:\/\//
      Clipboard::copy(result)   
      puts "This URL has been copied to your clipboard"
    end
  end
end
