# Creatubbles Ruby API Bindings
# API spec at https://partners.creatubbles.com/api

module Creatubbles
  DEFAULT_API_URL = "https://api.creatubbles.com/v2/"

  @type_collection_classes = {}

  def self.register_type_collection_class(type_name, collection_class)
    @type_collection_classes[type_name] = collection_class
  end

  def self.type_collection_classes
    @type_collection_classes
  end

  @type_object_classes = {}

  def self.register_type_object_class(type_name, object_class)
    @type_object_classes[type_name] = object_class
  end

  def self.type_object_classes
    @type_object_classes
  end

  def self.object_class(type_name)
    @type_object_classes[type_name] || raise("unknown type: #{type_name}")
  end

  def self.instantiate_object_from_response(response, connection)
    object_data = response.parsed['data']
    object_class(object_data['type']).new(connection, object_data)
  end

  def self.instantiate_objects_from_response(response, connection)
    list_data = response.parsed['data']
    list_data.map do |object_data|
      object_class(object_data['type']).new(connection, object_data)
    end
  end

end

require "creatubbles/content"
require "creatubbles/contents"
require "creatubbles/creation"
require "creatubbles/creations"
require "creatubbles/upload"
require "creatubbles/gallery"
require "creatubbles/galleries"
require "creatubbles/user"
require "creatubbles/users"
require "creatubbles/partner_application"
require "creatubbles/partner_applications"

require "creatubbles/client"
