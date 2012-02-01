require 'minitest/autorun'

require_relative '../lib/vermic/validator'

# Tests Validator
#
describe "Validator" do

 it "should fail if empty name" do
  options = {paste_name: "", paste_format: "c", paste_expire_date: "1M"}
  Validator::validate_options(options)
  Validator::any_errors?.must_equal(true)
 end

 it "should fail if empty format" do
  options = {paste_name: "Some code", paste_format: "", paste_expire_date: "1H"}
  Validator::validate_options(options)
  Validator::any_errors?.must_equal(true)
 end

 it "should fail if empty expire date" do
   options = {paste_name: "Some code", paste_format: "yaml", paste_expire_date: ""}
   Validator::validate_options(options)
   Validator::any_errors?.must_equal(true)
 end

 it "should fail if wrong format" do
   options = {paste_name: "Some code", paste_format: "cee", paste_expire_date: "1D"}
   Validator::validate_options(options)
   Validator::any_errors?.must_equal(true)
   options[:paste_name] = "z801"
   Validator::validate_options(options)
   Validator::any_errors?.must_equal(true)
 end

 it "should fail if wrong expire date" do
   options = {paste_name: "Some code", paste_format: "vim", paste_expire_date: "10m"}
   Validator::validate_options(options)
   Validator::any_errors?.must_equal(true)
   options[:paste_expire_date] = "n"
   Validator::validate_options(options)
   Validator::any_errors?.must_equal(true)
 end

 it "should fail if file is not given" do
   options = {paste_name: "Some code", paste_format: "yaml", paste_expire_date: "10M", file_name: nil}
   Validator::validate_options(options)
   Validator::any_errors?.must_equal(true)
 end
end
