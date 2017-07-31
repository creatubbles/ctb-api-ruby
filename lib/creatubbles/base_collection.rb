class Creatubbles::BaseCollection

  def self.define_type_name(type_name)
    @type_name = type_name
    Creatubbles.register_type_collection_class(type_name, self)
  end

  def self.type_name
    @type_name
  end

  def initialize(connection)
    @connection = connection
  end

  def find(id,opts={nil_404:false})
    res = @connection.get("#{self.class.type_name}/#{id}")
    Creatubbles.instantiate_object_from_response(res, @connection)
  rescue => e
    if opts[:nil_404] && is_record_not_found_404?(e)
      return nil
    else
      raise e
    end
  end

  def init_objects(response)
    Creatubbles.instantiate_objects_from_response(response, @connection)
  end

  def handle_params(params_hash={}, allowed_params=['query','filter'])
    params_hash.stringify_keys!.slice!(allowed_params).to_param
  end

  private

  def is_record_not_found_404?(e)
    return false unless e.is_a?(OAuth2::Error)
    body = e&.response&.body
    return false unless body
    resp = JSON.parse(e.response.body) rescue nil
    return false unless resp
    resp['errors'] && resp['errors'].any? { |err| err['status'].to_i == 404  }
  end

end
