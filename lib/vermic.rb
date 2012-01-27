require "vermic/version"
require 'optparse'

module Vermic
  options = {}

  OptionParser.new do |opts|
    opts.banner = "This is command line utility which pastes your code on pastebin"

    opts.on("-v", "--version", "shows the current version") do |v|
      puts Vermic::VERSION
    end
  end.parse!
end
