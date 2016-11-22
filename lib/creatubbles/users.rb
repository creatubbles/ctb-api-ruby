require "creatubbles/base_collection"

class Creatubbles::Users < Creatubbles::BaseCollection

  define_type_name 'users'

  def me
    res = @connection.get("users/me")
    Creatubbles.instantiate_object_from_response(res, @connection)
  end
end
