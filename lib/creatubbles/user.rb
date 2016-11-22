require "creatubbles/base_object"

class Creatubbles::User < Creatubbles::BaseObject

  define_type_name 'users'
  define_attributes %w[
    name
    email
    display_name
    creations_count
    bubbles_count
    comments_count
    last_bubbled_at
    last_commented_at
    short_url
    created_at
    updated_at
  ]

  def creators
    res = @connection.get("users/#{id}/creators")
    Creatubbles.instantiate_objects_from_response(res, @connection)
  end
end
