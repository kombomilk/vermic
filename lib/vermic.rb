require_relative "vermic/version"
require_relative "vermic/pastebin"
require 'optparse'

module Vermic
  options = {}

  OptionParser.new do |opts|
    opts.banner = "This is command line utility which pastes your code on pastebin"

    opts.on("-v", "--version", "shows the current version") do |v|
      puts Vermic::VERSION
      exit
    end

  end.parse!

  puts PastebinWrapper::paste_file(ARGV[0])
end
