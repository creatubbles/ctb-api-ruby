module UserJson
  def user_json
    {
      "data"=> {
        "id"=>"xUt6Feou",
        "type"=>"users",
        "attributes"=> user_json_attributes,
        "relationships"=>{
          "school"=>{ "data"=>nil },
          "custom_style"=>{ "data"=>{ "id"=>"525", "type"=>"custom_styles" } }
        }
      }
    }
  end

  def user_json_attributes
    {
      "username"=>"teacher098260598",
      "display_name"=>"teacher098260598",
      "list_name"=>"teacher098260598 (@teacher098260598)",
      "name"=>"teacher098260598",
      "role"=>"instructor",
      "avatar_url"=>"https://d3fll5fltyv3n9.cloudfront.net/users/72057/creations/33535/matrix_view_retina/1485185089creation.jpg",
      "age"=>"",
      "gender"=>"unknown",
      "last_bubbled_at"=>"2017-01-23T19:04:24.045Z",
      "last_commented_at"=>nil,
      "activities_count"=>2,
      "comments_count"=>0,
      "followed_users_count"=>0,
      "creators_count"=>6,
      "galleries_count"=>0,
      "managers_count"=>0,
      "short_url"=>"https://staging.ctbl.es/teacher098260598",
      "what_do_you_teach"=>nil,
      "interests"=>nil,
      "country_code"=>"PL",
      "country_flag_url"=>"https://d2r48com4t2oyq.cloudfront.net/assets/country-4x3/pl-c4d5935a0981cf8a0ac04a9f873cc2f9e2f15a8cf8ba0682e6f56f1000db6556.svg",
      "created_at"=>"2017-01-23T12:44:50.021Z",
      "updated_at"=>"2017-01-25T13:08:01.177Z",
      "connected_users_count"=>5,
      "is_young_creator"=>false,
      "country_name"=>"Poland",
      "signed_up_as_instructor"=>true,
      "home_schooling"=>true,
      "bubbles_count"=>2,
      "added_bubbles_count"=>1,
      "creations_count"=>1
    }
  end
end
