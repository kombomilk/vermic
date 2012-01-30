require 'net/http'
require 'uri'

# This module works with pastebin.com API.
#
module PastebinWrapper
  POST_URL = "http://pastebin.com/api/api_post.php"
  API_DEV_KEY = "7fe7c0c1814042eb9f0288d93d954fe9"  

  API_OPTION = 'paste'
  PASTE_NAME = 'Vermicelli code'
  PASTE_FORMAT = 'c'
  PASTE_PRIVATE = 0
  PASTE_EXPIRE_DATE = '10M'

  # Pastes plain code to the pastebin.com with
  # the given parameters
  #
  def self.paste_code(code, params = {})
    initialize_parameters(code)
    @@params.merge(params)
    paste
  end

  # Pastes file to the pastebin.com site with the
  # given parameters
  #
  def self.paste_file(filename, params = {})
    code = ""
    File.foreach(filename) do |line|
      code += line
    end
    initialize_parameters(code)
    @@params.merge(params)
    paste
  end

  # Private helper methods for the Pastebin module
  private

  # Pastes the code to the pastebin.com site
  # with the given parameters and returns either
  # the link to the pasted code in case of a 
  # successful paste or error message which starts
  # by "Bad API request..."
  #
  def self.paste
    Net::HTTP.post_form(URI.parse(POST_URL),
                                 {'api_dev_key' => API_DEV_KEY,
                                  'api_option' => API_OPTION,
                                  'api_paste_code' => @@params[:paste_code],
                                  'api_paste_name' => @@params[:paste_name],
                                  'api_paste_format' => @@params[:paste_format],
                                  'api_paste_private' => @@params[:paste_private],
                                  'api_paste_expire_date' => @@params[:paste_expire_date]}).body
  end

  # Initializes paste parameters with the default
  # values except for the paste code which is 
  # passed as a method parameter
  #
  def self.initialize_parameters(code)
    @@params = {paste_name: PASTE_NAME,
              paste_format: PASTE_FORMAT,
              paste_private: PASTE_PRIVATE,
              paste_expire_date: PASTE_EXPIRE_DATE,
              paste_code: code}
  end
end
