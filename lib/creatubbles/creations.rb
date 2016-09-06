require "creatubbles/base_collection"

class Creatubbles::Creations < Creatubbles::BaseCollection

  define_type_name 'creations'

  def create(name: nil, description: nil)
    res = @connection.post('creations', :params => { 'name' => name, 'reflection_text' => description })
    Creatubbles.instantiate_object_from_response(res, @connection)
  end
end
