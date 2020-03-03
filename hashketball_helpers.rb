# helper
def build_team(team_name, colors, player_data)
  team = {
    :team_name  => team_name, #=> String
    :colors     => colors,
    :players    => []
  }
  # strip headers for now as symbols will be hardcoded
  headers = player_data.shift
  # stick with a while for now as I don't want to get into 'with_index'
  index = 0
  while index < player_data.count do
    row = player_data[index]
    player = {
      :player_name  => row[0],
      :number => row[1].to_i,
      :shoe => row[2].to_i,
      :points => row[3].to_i,
      :rebounds => row[4].to_i,
      :assists  => row[5].to_i,
      :steals => row[6].to_i,
      :blocks => row[7].to_i,
      :slam_dunks => row[8].to_i
    }
    team[:players] << player
    index += 1
  end

  team
end
