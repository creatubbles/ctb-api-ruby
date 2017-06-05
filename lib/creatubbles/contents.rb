require "creatubbles/base_collection"

class Creatubbles::Contents < Creatubbles::BaseCollection

  define_type_name 'contents'

  def recent
    init_objects @connection.get('contents/recent')
  end

  def trending
    init_objects @connection.get('contents/trending')
  end

  def connected
    init_objects @connection.get('contents/connected')
  end

  def followed
    init_objects @connection.get('contents/followed')
  end

  private

  def init_objects response
    Creatubbles.instantiate_objects_from_response(response, @connection)
  end

end
