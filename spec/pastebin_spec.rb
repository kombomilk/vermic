require 'minitest/spec'
require 'minitest/autorun'

require_relative '../lib/vermic/pastebin'

describe PastebinWrapper do

  it "shouldn't post empty code" do
    PastebinWrapper.paste_code('').must_match(/Bad API request.*/)
  end

  it "should return url when no params" do
    PastebinWrapper.paste_code('some code').must_match(/http:\/\/pastebin.com\/\w+/)
  end

  it "shouldn't paste empty file" do
    PastebinWrapper.paste_file(File.expand_path('spec/empty_file')).must_match(/Bad API request.*/)
  end
end
