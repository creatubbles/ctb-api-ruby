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

  def find(id)
    res = @connection.get("#{self.class.type_name}/#{id}")
    Creatubbles.instantiate_object_from_response(res, @connection)
  end

  def init_objects(response)
    Creatubbles.instantiate_objects_from_response(response, @connection)
  end

  def handle_params(params_hash={}, allowed_params=['query','filter'])
    params_hash.stringify_keys!.slice!(allowed_params).to_param
  end

end
