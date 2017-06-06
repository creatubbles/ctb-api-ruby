require "creatubbles/base_collection"

class Creatubbles::Creations < Creatubbles::BaseCollection

  define_type_name 'creations'

  def index params
    init_objects @connection.get("creations?handle_params(params)")
  end

  def recent
    init_objects @connection.get("creations")
  end

  def from_gallery gallery_id
    init_objects @connection.get("galleries/#{gallery_id}/creations")
  end

  def by_user user_id
    init_objects @connection.get("users/#{user_id}/creations")
  end

  def by_partner_application partner_application_id
    init_objects @connection.get("by_partner_application/#{partner_application_id}/creations")
  end

  def recommended_for_creation creation_id
    init_objects @connection.get("creations/#{creation_id}/recommended_creations")
  end

  def recommended_for_user user_id
    init_objects @connection.get("users/#{user_id}/recommended_creations")
  end

  def create(name: nil, description: nil)
    init_objects @connection.post('creations', :params => { 'name' => name, 'reflection_text' => description })
  end

  def find_by_ids(ids)
    init_objects @connection.get("creations?filter[ids]=#{ids.join(',')}")
  end
end
