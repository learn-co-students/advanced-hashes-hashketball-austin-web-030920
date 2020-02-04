
def shoe_size(player_name)

    result = nil
    data = game_hash

    data.each do |key, location|
        location[:players].each do |inner_key|
           if inner_key[:player_name] == player_name
            result = inner_key[:shoe]
           end
        end
    end
   p result
end

def team_colors(team_name)
    result = nil
    data = game_hash

    data.each do |key, location|
        result = location[:colors] if location[:team_name] == team_name
    end
    p result
end

def team_names
    data = game_hash
    result = []

    data.each do |key, location|
        result << location[:team_name]
    end
    
    p result
end

def player_numbers(team_name)

    result = []
    data = game_hash

    data.each do |key, location|
        if location[:team_name] == team_name
            location[:players].each do |inner_key|
                result << inner_key[:number]
            end
        end
    end
    p result
end

def player_stats(player_name)
    data = game_hash
    result = nil

    data.each do |key, location|
        location[:players].each do |inner_key|
           if inner_key[:player_name] == player_name
                new_hash = {
                    :number => inner_key[:number],
                    :shoe => inner_key[:shoe],
                    :points => inner_key[:points],
                    :rebounds => inner_key[:rebounds],
                    :steals => inner_key[:steals],
                    :assists => inner_key[:assists],
                    :blocks => inner_key[:blocks],
                    :slam_dunks => inner_key[:slam_dunks]
                 }    

                result = new_hash
            end
        end
    end
   p result
end

def big_shoe_rebounds
    data = game_hash
    result = nil
    shoe = 0

    data.each do |key, location|
        location[:players].each do |inner_key|
            if inner_key[:shoe] > shoe
                shoe = inner_key[:shoe]
            end
        end
    end
    
    data.each do |key, location|
        location[:players].each do |inner_key|
           result = inner_key[:rebounds] if inner_key[:shoe] == shoe
        end
    end
    p result
end

def most_points_scored
    data = game_hash
    result = nil
    top_steals = 0

    data.each do |key, location|
        location[:players].each do |inner_key|
            top_steals = inner_key[:points] if inner_key[:points] > top_steals
        end
    end

    data.each do |key, location|
        location[:players].each do |inner_key|
            result = inner_key[:player_name] if inner_key[:points] == top_steals
        end
    end
    p result
end

def winning_team
    data = game_hash
    home_total = 0
    away_total = 0

    data[:home][:players].each do |stats|
        home_total += stats[:points]
    end

    data[:away][:players].each do |stats|
        away_total += stats[:points]
    end

    p "Tie" if home_total ==  away_total
    home_total > away_total ? data[:home][:team_name] : data[:away][:team_name]

end

def player_with_longest_name
    data = game_hash
    longest_name = "a"

    data.each do |key, location|
        location[:players].each do |stats|
            longest_name = stats[:player_name] if stats[:player_name].size > longest_name.size
        end
    end
    p longest_name
end

def long_name_steals_a_ton?
    data = game_hash
    player_with_longest_name == most_steals
end

def most_steals
    data = game_hash
    result = nil
    top_steals = 0

    data.each do |key, location|
        location[:players].each do |inner_key|
            top_steals = inner_key[:steals] if inner_key[:steals] > top_steals
        end
    end

    data.each do |key, location|
        location[:players].each do |inner_key|
            result = inner_key[:player_name] if inner_key[:steals] == top_steals
        end
    end
    p result
end