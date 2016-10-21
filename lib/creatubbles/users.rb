require "creatubbles/base_collection"

class Creatubbles::Creators < Creatubbles::BaseCollection

  define_type_name 'users'

  def all_creators
    res = @connection.get("users/me/creators")
    Creatubbles.instantiate_objects_from_response(res, @connection)
  end
end
