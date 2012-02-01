require 'minitest/autorun'

require_relative '../lib/vermic/pastebin'

# Tests PastebinWrapper module 
#
describe PastebinWrapper do

  it "shouldn't post empty code" do
    PastebinWrapper::paste_code('').must_match(/Bad API request.*/)
  end

  it "should return url when no params" do
    PastebinWrapper::paste_code('some code').must_match(/http:\/\/pastebin.com\/\w+/)
  end

  it "shouldn't paste empty file" do
    options = {
      file_name: File.expand_path('spec/files/empty_file')
    }
    PastebinWrapper::paste_file(options).must_match(/Bad API request.*/)
  end
end
