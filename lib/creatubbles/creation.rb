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
    tags
    updated_at
  ]

  define_relationships %w[user creators]

  def update_tags(tags)
    @connection.put("creations/#{id}", :body => { 'data' => { 'type' => 'creations', 'attributes': {'tags' => tags }}})
  end

  def add_tags(tags)
    tags_data = tags.map { |tag| {type: 'tags', id: tag} }
    @connection.post("creations/#{id}/tags", body: { data: tags_data })
  end

  def remove_tags(tags)
    tags_data = tags.map { |tag| {type: 'tags', id: tag} }
    @connection.delete("creations/#{id}/tags", body: { data: tags_data })
  end

  def upload(file)
    extension = File.extname(file)[1..-1]
    res = @connection.post("creations/#{id}/uploads", :params => { 'extension' => extension })
    upload = Creatubbles.instantiate_object_from_response(res, @connection)
    upload.upload(file)
    upload.ping
    upload
  end

end
