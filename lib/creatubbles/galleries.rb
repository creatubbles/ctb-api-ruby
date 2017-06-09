require "creatubbles/base_collection"

class Creatubbles::Galleries < Creatubbles::BaseCollection

  define_type_name 'galleries'

  def featured
    init_objects @connection.get('featured_galleries')
  end

  def owned_by_user user_id
    init_objects @connection.get("users/#{user_id}/galleries")
  end

  def mine
    init_objects @connection.get("users/me/galleries")
  end

  def mine_favorite
    init_objects @connection.get("users/me/favorite_galleries")
  end

  def containing_creation creation_id
    init_objects @connection.get("creations/#{creation_id}/galleries")
  end

end
