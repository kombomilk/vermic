require 'net/http'
require 'uri'

module PastebinWrapper
  POST_URL = "http://pastebin.com/api/api_post.php"
  API_DEV_KEY = "7fe7c0c1814042eb9f0288d93d954fe9"  

  def PastebinWrapper.paste_code(code, params = {})
    params = {paste_name: "Vermicelli code",
    paste_format: "c",
    paste_private: "0",
    paste_expire_date: "10M"}.merge(params)
    result = Net::HTTP.post_form(URI.parse(POST_URL), 
            {'api_dev_key' => API_DEV_KEY,
             'api_option' => 'paste',
             'api_paste_code' => code,
    'api_paste_name' => params[:paste_name],
    'api_paste_format' => params[:paste_format],
    'api_paste_private' => params[:paste_private],
    'api_expire_date' => params[:expire_date]})
    result.body
  end

end
