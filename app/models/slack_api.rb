class SlackApi < ApplicationRecord
  def self.validate_user(user_id)
    user = User.find_by(slack_user_id: user_id, provider: "slack")
    return "Seems that you don't have account on Ponczki - Learn more at https://ponczki.com/how-to-start" if user.nil?
    user
  end

  def self.validate_team(team_id)
    team = Team.find_by(slack_team_id: team_id)
    return "Your team doesn't exsits in our database - please visit https://ponczki.com/how-to-start" if team.nil?
    team
  end

  def self.process_params(message_text, user, team)
    first_word = message_text.split(" ")[0]
    case first_word
    when "setup"
      team.update(settled_up: true)
      "Yay! Everything works fine, your team is setted up. Now you can use all Ponczki features!"
    when "help"
      "Help doesn't work at this time but we are working on it!"
    when /^[<@]/
      finder = User.find_by(slack_user_id: first_word.split("@")[1].split("|")[0])
      SlackApi.new_blooper(user, finder, team)
    else
      "If you want <@#{user.slack_user_id}> to bring doughnuts use this command /ponczki @your_nickname :)"
    end
  end

  def self.new_blooper(user, finder, team)
    return "You have to register at Ponczki!" if finder.nil?
    return "You both have to be members of the same team!" if finder.team != user.team
    Blooper.new_bloop(user, finder, team)
    "<@#{finder.slack_user_id}> - you have got a point. <@#{user.slack_user_id}> is buying doughnuts!"
  end

  def self.response_with_text(text, response_url)
    RestClient.post response_url, { text: text }.to_json,
                    content_type: "application/json"
  end

  def response_with_json(hash); end
end
