json.array!(@all_media) do |media|
  json.extract! media, :id, :user_id, :link_url
  json.url media_tag_url(media, format: :json)
end