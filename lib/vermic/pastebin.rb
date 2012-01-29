require 'net/http'
require 'uri'

module PastebinWrapper
  POST_URL = "http://pastebin.com/api/api_post.php"
  API_DEV_KEY = "7fe7c0c1814042eb9f0288d93d954fe9"  

  API_OPTION = 'paste'
  PASTE_NAME = 'Vermicelli code'
  PASTE_FORMAT = 'c'
  PASTE_PRIVATE = 0
  PASTE_EXPIRE_DATE = '10M'

  def self.paste_code(code, params = {})
    initialize_parameters(code)
    @@params.merge(params)
    paste
  end

  def self.paste_file(filename, params = {})
    code = ""
    File.foreach(filename) do |line|
      code += line
    end
    initialize_parameters(code)
    @@params.merge(params)
    paste
  end

  private
  def self.paste
    Net::HTTP.post_form(URI.parse(POST_URL),
                                 {'api_dev_key' => API_DEV_KEY,
                                  'api_option' => API_OPTION,
                                  'api_paste_code' => @@params[:paste_code],
                                  'api_paste_format' => @@params[:paste_format],
                                  'api_paste_private' => @@params[:paste_private],
                                  'api_paste_expire_date' => @@params[:paste_expire_date]}).body
  end

  def self.initialize_parameters(code)
    @@params = {paste_name: PASTE_NAME,
              paste_format: PASTE_FORMAT,
              paste_private: PASTE_PRIVATE,
              paste_expire_date: PASTE_EXPIRE_DATE,
              paste_code: code}
  end
end
