require "creatubbles/base_collection"

class Creatubbles::Contents < Creatubbles::BaseCollection

  define_type_name 'contents'

  def index params = {}
    init_objects @connection.get("contents?#{handle_params(params)}")
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

  def by_user user_id
    init_objects @connection.get("users/#{user_id}/contents")
  end

  def bubbled_by_user user_id
    init_objects @connection.get("users/#{user_id}/bubbled_contents")
  end

end
