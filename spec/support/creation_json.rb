module CreationJson
  def creation_json
    {
      "data"=>{
        "id"=>"XIeQuGLw",
        "type"=>"creations",
        "attributes"=> creation_json_attributes,
        "relationships"=>{
          "user"=>{ "data"=>{ "id"=>"xUt6Feou", "type"=>"users" } },
          "creators"=>{
            "data"=>[
              { "id"=>"xUt6Feou", "type"=>"users" }
            ]
          },
          "partner_application"=>{ "data"=>nil }
        }
      },
      "included"=>[
        {
          "id"=>"xUt6Feou",
          "type"=>"users",
          "attributes"=> user_json_attributes,
          "relationships"=>{
            "school"=>{ "data"=>nil },
            "custom_style"=> { "data"=>{ "id"=>"3584", "type"=>"custom_styles"} }
          }
        }
      ],
      "meta"=>{ "abilities"=>[], "user_bubbled_creations"=>[], "followed_users"=>[] }
    }
  end

  def creation_json_attributes
    {
      'name' => 'A boat',
      "translated_names"=>[
        { "code"=>"en", "name"=>"A boat", "original"=>true }
      ],
      "image"=>{
        "links"=>{
          "original"=>"https://api.creatubbles.com/v2/creation/XIeQuGLw/original/boat.jpg",
          "full_view"=>"https://api.creatubbles.com/v2/creation/XIeQuGLw/full_view/boat.jpg",
          "gallery_mobile"=>"https://api.creatubbles.com/v2/creation/XIeQuGLw/gallery_mobile/boat.jpg",
          "list_view_retina"=>"https://api.creatubbles.com/v2/creation/XIeQuGLw/list_view_retina/boat.jpg",
          "share"=>"https://api.creatubbles.com/v2/creation/XIeQuGLw/share/boat.jpg",
          "list_view"=>"https://api.creatubbles.com/v2/creation/XIeQuGLw/list_view/boat.jpg",
          "matrix_view_retina"=>"https://api.creatubbles.com/v2/creation/XIeQuGLw/matrix_view_retina/boat.jpg",
          "matrix_view"=>"https://api.creatubbles.com/v2/creation/XIeQuGLw/matrix_view/boat.jpg",
          "explore_mobile"=>"https://api.creatubbles.com/v2/creation/XIeQuGLw/explore_mobile/boat.jpg"
        }
      },
      "image_status"=>3,
      "approved"=>true,
      "approval_status"=>"approved",
      "created_at_age"=>"at 14y",
      "created_at_age_per_creator"=>{"xUt6Feou"=>nil},
      "reflection_text"=> 'My reflection',
      "reflection_video_url"=>nil,
      "play_iframe_url"=>nil,
      "obj_file_url"=>nil,
      "bubbles_count"=>1,
      "comments_count"=>0,
      "views_count"=>5,
      "last_bubbled_at"=>"2017-01-25T14:07:54.202+01:00",
      "last_commented_at"=>nil,
      "last_submitted_at"=>nil,
      'short_url' => "https://ctbl.es/XIeQuGLw",
      "content_type"=>"video/quicktime",
      "tags" => [ 'School', 'Animals' ],
      "created_at"=>"2017-01-23T16:24:08.112+01:00",
      "updated_at"=>"2017-01-25T14:07:54.252+01:00"
      }
  end
end
