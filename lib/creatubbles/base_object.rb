class Creatubbles::BaseObject

  def self.define_type_name(type_name)
    @type_name = type_name
    Creatubbles.register_type_object_class(type_name, self)
  end

  def self.type_name
    @type_name
  end

  def self.define_attributes(atts)
    atts.each do |att|
      class_eval <<-EOM, __FILE__, __LINE__ + 1
        def #{att}
          @data['attributes']['#{att}']
        end
      EOM
    end
  end

  def initialize(connection, data)
    @connection = connection
    @data = data
  end

  def id
    @data['id']
  end

  def inspect
    @data.inspect
  end

  def reload
    @data = @connection.get("#{self.class.type_name}/#{id}").parsed['data']
    self
  end
end
