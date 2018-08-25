module OmniauthMacros
  def facebook_hash
    user_id = Array.new(9) { rand(10) }.join
    team_id = Array.new(9) { rand(10) }.join
    OmniAuth.config.mock_auth[:slack] = OmniAuth::AuthHash.new(
      "provider" => "slack",
      "uid" => user_id,
      "info" => {
        "email" => Faker::Internet.email,
        "name" => Faker::Name.name,
        "nickname" => Faker::Name.name
      },
      "extra" => {
        "identity" => {
          "user" => {
            "image_512" => "https://avatars.slack-edge.com/2018-08-24/422354927028_c7890cd69b3c0e839b3a_512.jpg"
          },
          "team" => {
            "id" => team_id,
            "name" => Faker::Name.name,
            "domain" => "randomdomain",
            "image_230" => "https://a.slack-edge.com/bfaba/img/avatars-teams/ava_0019-230.png"
          }
        }
      }
    )
  end
end
