require 'pry'


def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["black", "white"],
      :players => [
        {
         :player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        {
         :player_name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        {
         :player_name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        {
         :player_name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        {
         :player_name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }]
      },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["turquoise", "purple"],
      :players => [
        {
         :player_name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        {
         :player_name => "Bismak Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        {
         :player_name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        {
         :player_name => "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        {
         :player_name => "Brendan Haywood",
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }]
    }
  }
end


def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry


        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end

def num_points_scored(athlete)
  solution = nil
  game_hash.each do |location, team_data|
    game_hash[location][:players].each do |attribute|
      attribute.has_value?(athlete) ? solution = attribute.fetch(:points).to_i : nil
      end
    end
    solution
  end

def shoe_size(athlete)
  solution = nil
  game_hash.each do |location, team_data|
    game_hash[location][:players].each do |att|
      att.has_value?(athlete) ? solution = att.fetch(:shoe).to_i : nil
    end
  end
  solution
end

def team_colors(team)
  solution = nil
  game_hash.each do |location, team_data|
     if game_hash[location][:team_name] == team
      solution = game_hash[location][:colors].collect do |x|
        x.to_s
      end
    end
  end
solution.collect {|x| x.capitalize}
end

def team_names
  game_hash.collect do |location, team_data|
    game_hash[location][:team_name].to_s
  end
end

def player_numbers(team) #This is a really janky way to solve the problem.
  team_numbers = []
  game_hash.each do |location, team_data|
    if team  == "Brooklyn Nets"
      game_hash[:home][:players].each do |att|
        team_numbers << att.fetch(:number).to_i
      end

    elsif team == "Charlotte Hornets"
      game_hash[:away][:players].each do |att|
        team_numbers << att.fetch(:number).to_i
      end
    end
  end
  #if team == "Brooklyn Nets"
   # team_numbers[0..4]
  #elsif team == "Charlotte Hornets"
   # team_numbers[5..9]
  #end
  team_numbers.uniq #for some reason I am getting an array with duplicates of each number for a total of 10
end

def player_stats(player_name)
  p = nil
  solution = nil
  game_hash.each do |location, team_data|
      game_hash[location][:players].collect do |att|
        if att.has_value?(player_name)
          solution = att
        end
    end
  end
  solution.select {|k,v| k != :player_name}
end



def big_shoe_rebounds
  mystery = nil
  biggest_shoe = []
  game_hash.each do |location, team_data|
    game_hash[location][:players].each do |att|
      att.each do |k,v|
        if k == :shoe
         biggest_shoe << v
        end
      end
    end
  end
  game_hash.each do |location, team_data|
    game_hash[location][:players].each do |att|
        if att[:shoe] == biggest_shoe.max
          mystery = att[:rebounds]
      end
    end
  end
  mystery
end
