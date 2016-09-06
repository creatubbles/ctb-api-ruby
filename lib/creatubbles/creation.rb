require "creatubbles/base_object"

class Creatubbles::Creation < Creatubbles::BaseObject

  define_type_name 'creations'
  define_attributes %w[
    name
    translated_names
    approved
    approval_status
    created_at_age
    created_at_age_per_creator
    reflection_text
    reflection_video_url
    image
    image_status
    bubbles_count
    comments_count
    views_count
    last_bubbled_at
    last_commented_at
    last_submitted_at
    short_url
    obj_file_url
    play_iframe_url
    created_at
    updated_at
  ]

  def upload(file)
    extension = File.extname(file)[1..-1]
    res = @connection.post("creations/#{@data['id']}/uploads", :params => { 'extension' => extension })
    upload = res.parsed['data']['attributes']
    upload_url = URI.parse(upload['url'])
    Net::HTTP.start(upload_url.host) do |http|
      http.send_request("PUT", upload_url.request_uri, IO.read(file), "content-type" => upload['content_type'])
    end
    @connection.put(upload['ping_url'])
  end

end
