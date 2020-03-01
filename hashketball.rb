require 'pry'
require 'pp'

##=+= =+=##  ##=+= =+=## ##=+= =+=##  ##=+= =+=##  HASHKETBALL ##=+= =+=##  ##=+= =+=##  ##=+= =+=## ##=+= =+=##

def game_hash 
  hashketball = {
    home: {
      team_name: "Brooklyn Nets", 
      colors: ["Black", "White"], 
      players: [
        {player_name: "Alan Anderson", number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
        {player_name: "Reggie Evans", number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
        {player_name: "Brook Lopez", number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
        {player_name: "Mason Plumlee", number: 1, shoe: 19, points: 26, rebounds: 11, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
        {player_name: "Jason Terry", number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
        ]}, 
    
    away: {
      team_name: "Charlotte Hornets", 
      colors: ["Turquoise", "Purple"], 
      players: [
        {player_name: "Jeff Adrien", number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},        
        {player_name: "Bismack Biyombo", number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 22, blocks: 15, slam_dunks: 10},
        {player_name: "DeSagna Diop", number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
        {player_name: "Ben Gordon", number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
        {player_name: "Kemba Walker", number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 7, blocks: 5, slam_dunks: 12}]
  }}
end

##=+= =+=##  ##=+= =+=## ##=+= =+=##  ##=+= =+=##  METHODS  ##=+= =+=##  ##=+= =+=##  ##=+= =+=## ##=+= =+=##

def num_points_scored (name)
  # name #=> => "Jeff Adrien"
  
  game_hash.each do |team, team_info| 
    # team #=> home/away #team_info #=> all the team stats
    
    team_info.each do |team, stats|
      #team #=> [[:team_name, :colors, :players], [:team_name, :colors, :players]]
     
      if team == :players
         # team = :players
         
         stats.each do |guy| 
      
           if guy[:player_name] == name
             return guy[:points]
           end
         end  
      end
    end
  end
end

def shoe_size (name)
   game_hash.each do |team, team_info| 
    # team #=> home/away #team_info #=> all the team stats
    
    team_info.each do |team, stats|
      #team #=> [[:team_name, :colors, :players], [:team_name, :colors, :players]]
     
      if team == :players
         # team = :players
         
         stats.each do |guy| 
      
           if guy[:player_name] == name
             return guy[:shoe]
           end
         end  
      end
    end
  end
end

def team_colors(title)
  game_hash.each do |place, team| 
    # place #=> home/away 
    #team #=> all the team stats
    if team[:team_name] == title
      return team[:colors]
    end
  end
end

# def team_names
#   names = []
# names << game_hash[:home][:team_name]
# names << game_hash[:away][:team_name]
# names
# end

def team_names
  game_hash.map do |place, team|
    team[:team_name]
  end
end

def player_numbers(team_n)
  array = []
  game_hash.each do |place, team|
    if team[:team_name] == team_n
    # place ## home/away 
    # team ## team1 info, team2 info
      team.each do |key, value|
       # key ##[:team_name, :colors, :players]
       # value ## key info
        if key == :players
        value.each do |num|
          array << num[:number]
        end
       end
      end
    end 
  end
  array
end

def player_stats(p_name)
  stats = {}
  game_hash.each do |place, team|
    team.each do |key, value|
    if key == :players
      value.each do |player|
        # binding.pry
      if player[:player_name] == p_name
        # binding.pry
          stats = {
            number: player[:number], 
            shoe: player[:shoe], 
            points: player[:points],
            rebounds: player[:rebounds], 
            assists: player[:assists], 
            steals: player[:steals], 
            blocks: player[:blocks], 
            slam_dunks: player[:slam_dunks]}
         end
        end
      end
    end
  end
  stats
end


def big_shoe_rebounds 
  big = 0
  rebound = 0 
  game_hash.each do |place, team|
    team[:players].each do |player|
      if player[:shoe] > big 
        big = player[:shoe]
        rebound = player[:rebounds]
      end
    end
  end
  return rebound
end




# rspec spec/hashketball_spec.rb -e game_hash
# rspec spec/hashketball_spec.rb -e num_points_scored



