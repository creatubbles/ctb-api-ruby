require "creatubbles/base_collection"

class Creatubbles::Contents < Creatubbles::BaseCollection

  define_type_name 'contents'

  def index  params_hash = {"query": nil}
    params_hash.stringify_keys!.slice!("query")
    init_objects @connection.get("contents?#{params_hash.to_param}")
  end

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

end
