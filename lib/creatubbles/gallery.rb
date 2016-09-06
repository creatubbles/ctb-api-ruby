require "creatubbles/base_object"

class Creatubbles::Gallery < Creatubbles::BaseObject

  define_type_name 'galleries'
  define_attributes %w[
    name
    description
    open_for_all
    banner
    preview_image_urls
    creations_count
    bubbles_count
    comments_count
    last_bubbled_at
    last_commented_at
    short_url
    created_at
    updated_at
  ]

  def add_creation(creation)
    @connection.post("gallery_submissions", :params => { 'gallery_id' => id, 'creation_id' => creation.id })
  end

end
