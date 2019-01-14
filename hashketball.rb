require 'pry'
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def all_players
  game_hash[:home][:players].merge(game_hash[:away][:players])
end

def teams
  game_hash.values
end

def get_team(team)
  teams.find {|x| x.fetch(:team_name) == team}
end

def num_points_scored(player)
  player = all_players.fetch(player)
  player[:points]
end

def shoe_size(player)
  player = all_players.fetch(player)
  player[:shoe]
end

def team_colors(team)
  team = get_team(team)
  team[:colors]
end

def team_names
  teams.collect {|x| x[:team_name]}
end

def player_numbers(team)
  team = get_team(team)
  team[:players].collect {|player, info| info[:number]}
end

def player_stats(player)
  all_players.fetch(player)
end

def big_shoe_rebounds
  #binding.pry
  biggest_shoe = all_players.first
  for player in all_players
    if player[1][:shoe] > biggest_shoe[1][:shoe]
      biggest_shoe = player
    end
  end
  biggest_shoe[1][:rebounds]
end

def most_points_scored
  most_points = all_players.first
  for player in all_players
    if player[1][:points] > most_points[1][:points]
      most_points = player
    end
  end
  most_points[0]
end

def winning_team
  home_points = 0
  away_points = 0
  game_hash[:home][:players].each {|player|
    home_points += player[1][:points]
  }
  game_hash[:away][:players].each {|player|
    away_points += player[1][:points]
  }
  home_points > away_points ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end

def player_with_longest_name
  longest_name = all_players.first[0]
  for player in all_players
    if player[0].length > longest_name.length
      longest_name = player[0]
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  longest_name_steals = player_stats(player_with_longest_name)[:steals]
  all_players.none? {|player| player[1][:steals] > longest_name_steals}
end