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
    init_objects @connection.get("users/#{id}/creators")
  end

  def creations
    init_objects @connection.get("users/#{id}/creations")
  end

  def contents
    init_objects @connection.get("users/#{id}/contents")
  end

  def bubbled_contents
    init_objects @connection.get("users/#{id}/bubbled_contents")
  end
end
