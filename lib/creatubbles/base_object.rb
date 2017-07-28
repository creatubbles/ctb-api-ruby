require 'active_support/core_ext/module/attribute_accessors'

class Creatubbles::BaseObject

  def self.inherited(subclass)
    subclass.mattr_reader :attributes, :relationships
    subclass.class_variable_set(:@@attributes, [])
    subclass.class_variable_set(:@@relationships, [])
  end

  def self.define_type_name(type_name)
    @type_name = type_name
    Creatubbles.register_type_object_class(type_name, self)
  end

  def self.type_name
    @type_name
  end

  def self.define_attributes(atts)
    atts.each do |att|
      raise "Duplicated attribute: #{attr}" if attributes.include?(att.to_sym)
      attributes << att.to_sym
      class_eval <<-EOM, __FILE__, __LINE__ + 1
        def #{att}
          @data['attributes']['#{att}']
        end
      EOM
    end
  end

  def self.define_relationships(relations)
    relations.each do |k, v|
      raise "Duplicated relationship: #{k}" if relationships.include?(k.to_sym)
      relationships << k.to_sym
      class_eval <<-EOM, __FILE__, __LINE__ + 1
        def #{k}
          relationship = @data['relationships']['#{k}']
          return nil unless relationship.is_a?(Hash)
          case (relationship_data = relationship['data']).class.name
          when 'Hash'
            relationship_data['id']
          when 'Array'
            relationship_data.map { |relation| relation['id'] }
          end
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

  def init_objects response
    Creatubbles.instantiate_objects_from_response(response, @connection)
  end
end
