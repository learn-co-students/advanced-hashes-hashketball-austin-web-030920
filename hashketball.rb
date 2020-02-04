require "pry"

def game_hash
    hashketball = {
        home: {
            team_name: "Brooklyn Nets",
            colors: ["Black", "White"],
            players: [
                {player_name: "Alan Anderson",
                number: 0,
                shoe: 16,
                points: 22,
                rebounds: 12,
                assists: 12,
                steals: 3,
                blocks: 1,
                slam_dunks: 1
            }, 
                {player_name: "Reggie Evans",
                number: 30,
                shoe: 14,
                points: 12,
                rebounds: 12,
                assists: 12,
                steals: 12,
                blocks: 12,
                slam_dunks: 7
            },
                {player_name: "Brook Lopez",
                number: 11,
                shoe: 17,
                points: 17,
                rebounds: 19,
                assists: 10,
                steals: 3,
                blocks: 1,
                slam_dunks: 15
            },  
                {player_name: "Mason Plumlee",
                number: 1,
                shoe: 19,
                points: 26,
                rebounds: 11,
                assists: 6,
                steals: 3,
                blocks: 8,
                slam_dunks: 5
            },
                {player_name: "Jason Terry",
                number: 31,
                shoe: 15,
                points: 19,
                rebounds: 2,
                assists: 2,
                steals: 4,
                blocks: 11,
                slam_dunks: 1}
            
            ]
        },
        away: {
            team_name: "Charlotte Hornets",
            colors: ["Turquoise", "Purple"],
            players: [
                {player_name: "Jeff Adrien",
                number: 4,
                shoe: 18,
                points: 10,
                rebounds: 1,
                assists: 1,
                steals: 2,
                blocks: 7,
                slam_dunks: 2
            },
                {player_name: "Bismack Biyombo",
                number: 0,
                shoe: 16,
                points: 12,
                rebounds: 4,
                assists: 7,
                steals: 22,
                blocks: 15,
                slam_dunks: 10
            },
                {player_name: "DeSagna Diop",
                number: 2,
                shoe: 14,
                points: 24,
                rebounds: 12,
                assists: 12,
                steals: 4,
                blocks: 5,
                slam_dunks: 5
            },
                {player_name: "Ben Gordon",
                number: 8,
                shoe: 15,
                points: 33,
                rebounds: 3,
                assists: 2,
                steals: 1,
                blocks: 1,
                slam_dunks: 0
            },
                {player_name: "Kemba Walker",
                number: 33,
                shoe: 15,
                points: 6,
                rebounds: 12,
                assists: 12,
                steals: 7,
                blocks: 5,
                slam_dunks: 12}
            ]
        },
    }
end

#-----------------------------------HELPER-METHODS--------------------------------------------------
def access_top(whatever)
    most_whatever = 0
    game_hash.each do |key, team|
        team.each do |category, info|
            if category == :players
                info.each do |stats|
                    most_whatever = stats[whatever] if stats[whatever] > most_whatever
                end
            end
        end
    end
    most_whatever
end

def access_player_with_most(whatever)
    game_hash.each do |key, team|
        team.each do |category, info|
            if category == :players
                info.each do |stats|
                    return stats[:player_name] if stats[whatever] == access_top(whatever)
                end
            end
        end
    end 
end
#-----------------------------------------------------------------------------------------------------

def num_points_scored(player_name)
    game_hash.each do |key, team|
        team.each do |category, info|
            if category == :players
                info.each do |stats|
                    return stats[:points] if stats[:player_name] == player_name

                end
            end
        end
    end
end

def shoe_size(player_name)
    game_hash.each do |key, team|
        team.each do |category, info|
            if category == :players
                info.each do |stats|
                    return stats[:shoe] if stats[:player_name] == player_name 
                end
            end
        end
    end
end

def team_colors(team_name)
    game_hash.each do |key, team|
        return team[:colors] if team[:team_name] == team_name
    end
end

def team_names
    teams = []
    
    game_hash.each do |key, team|
        teams << team[:team_name]
    end

    p teams
end 

def player_numbers(team_name)
    numbers = []
    
    game_hash.each do |key, team|
        if team[:team_name] == team_name
            team.each do |category, info|
                if category == :players
                    info.each do |stats|
                        numbers << stats[:number]
                    end
                end
            end
        end
    end

    p numbers
end

def player_stats(player_name)
    results = "Please enter a valid player name."

    game_hash.each do |key, team|
        team.each do |category, info|
            if category == :players
                info.each do |stats|
                    if stats[:player_name] == player_name
                        results = {
                            :number => stats[:number],
                            :shoe => stats[:shoe],
                            :points => stats[:points],
                            :rebounds => stats[:rebounds],
                            :assists => stats[:assists],
                            :steals => stats[:steals],
                            :blocks => stats[:blocks],
                            :slam_dunks => stats[:slam_dunks]
                        }
                    end
                end
            end
        end
    end

    p results
end

def big_shoe_rebounds
    game_hash.each do |key, team|
        team.each do |category, info|
            if category == :players
                info.each do |stats|
                    return stats[:rebounds] if stats[:shoe] == access_top(:shoe)
                end
            end
        end
    end 
end

def most_points_scored   
    game_hash.each do |key, team|
        team.each do |category, info|
            if category == :players
                info.each do |stats|
                    return stats[:player_name] if stats[:points] == access_top(:points)
                end
            end
        end
    end
end

def winning_team
    home_score = 0
    away_score = 0

    game_hash.each do |key, team|
        if key == :home
            team.each do |category, info|
                if category == :players
                    info.each do |stats|
                        home_score += stats[:points]
                    end
                end
            end

        else
            team.each do |category, info|
                if category == :players
                    info.each do |stats|
                        away_score += stats[:points]
                    end
                end
            end
        end
    end

    home_score > away_score ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end

def player_with_longest_name
    longest_name = "a"

    game_hash.each do |key, team|
        team.each do |category, info|
            if category == :players
                info.each do |stats|
                    longest_name = stats[:player_name] if stats[:player_name].size > longest_name.size
                end
            end
        end
    end

    longest_name
end

def long_name_steals_a_ton?
    access_player_with_most(:steals) == player_with_longest_name
end


#----------BLOCK-TO-ACCESS-PLAYER-STATS------------
#     game_hash.each do |key, team|
#         team.each do |category, info|
#             if category == :players
#                 info.each do |stats|
#                 end
#             end
#         end
#     end
#----------------------------------------------------