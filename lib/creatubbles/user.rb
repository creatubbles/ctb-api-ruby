require "creatubbles/base_object"

class Creatubbles::User < Creatubbles::BaseObject

  define_type_name 'users'
  define_attributes %w[
    username
    display_name
    list_name
    name
    role
    age
    gender
    country_code
    country_name
    avatar_url
    short_url
    added_bubbles_count
    activities_count
    bubbles_count
    comments_count
    creations_count
    creators_count
    galleries_count
    managers_count
    last_bubbled_at
    last_commented_at
    signed_up_as_instructor
    what_do_you_teach
    interests
    home_schooling
    created_at
    updated_at
  ]

  define_relationships %w[school custom_style]

  def creators
    res = @connection.get("users/#{id}/creators")
    Creatubbles.instantiate_objects_from_response(res, @connection)
  end

  def creations
    res = @connection.get("users/#{id}/creations")
    Creatubbles.instantiate_objects_from_response(res, @connection)
  end
end
