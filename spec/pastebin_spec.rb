require 'minitest/spec'
require 'minitest/autorun'

require_relative '../lib/pastebin'

describe PastebinWrapper do

  it "shouldn't post empty code" do
    PastebinWrapper.paste_code('').must_match(/Bad API request.*/)
  end

  it "should return url with no params" do
    PastebinWrapper.paste_code('some code').must_match(/http:\/\/pastebin.com\/\w+/)
  end
end
