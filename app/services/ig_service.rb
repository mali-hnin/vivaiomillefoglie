class IgService

  def get_ig_feed
    response = HTTP.get("https://graph.instagram.com/me/media?fields=id,media_url,permalink,thumbnail_url,timestamp&access_token=#{ENV["IG_API_KEY"]}").to_s
    parsed_response = JSON.parse(response)

    parsed_response["data"]
  end
end
