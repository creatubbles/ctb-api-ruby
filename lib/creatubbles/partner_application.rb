require "creatubbles/base_object"

class Creatubbles::PartnerApplication < Creatubbles::BaseObject

  define_type_name 'partner_applications'
  define_attributes %w[
    name
    slug
    short_url
    header_bg
    body_bg
    owner_name
    description
    cta_logged_in_label
    cta_logged_out_label
    reqeust_cta_for_youngsters
    cta_for_youngsters_label
    cta_href
    categories
    age
    languages
    support
    developers
    platforms
    show_other_apps
    display_creations_nr
    about_card_text
    meta_title
    meta_description
    meta_keywords
    meta_og_title
    meta_og_description
    meta_og_type
    meta_og_image
    avatar_url
    created_at
    updated_at
  ]

  # TODO update API endpoint
  def creations
    res = @connection.get("creations?partner_application_id=#{slug}")
    Creatubbles.instantiate_objects_from_response(res, @connection)
  end
end
