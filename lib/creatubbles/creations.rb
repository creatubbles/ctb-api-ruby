require "creatubbles/base_collection"

class Creatubbles::Creations < Creatubbles::BaseCollection

  define_type_name 'creations'

  # TODO update API endpoint
  def recent
    res = @connection.get("creations")
    Creatubbles.instantiate_objects_from_response(res, @connection)
  end

  def create(name: nil, description: nil)
    res = @connection.post('creations', :params => { 'name' => name, 'reflection_text' => description })
    Creatubbles.instantiate_object_from_response(res, @connection)
  end
  
  def find_by_ids(ids)
    res = @connection.get("creations?filter[ids]=#{ids.join(',')}")
    Creatubbles.instantiate_objects_from_response(res, @connection)
  end
end
