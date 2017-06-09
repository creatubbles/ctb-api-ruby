require "creatubbles/base_object"

class Creatubbles::Content < Creatubbles::BaseObject
  define_type_name 'contents'

  define_attributes %w[
    type
  ]

  define_relationships %w[creation gallery user partner_application]

  def sub_object
    send type
  end

end
