require "pry"

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def find_player player_name
  home_fplayer = game_hash[:home][:players].filter {|player| player[:player_name] === player_name}
  away_fplayer = game_hash[:away][:players].filter {|player| player[:player_name] === player_name}

  if home_fplayer[0]
    home_fplayer[0]
  else
    away_fplayer[0]
  end
end

def num_points_scored player_name
  find_player(player_name)[:points]
end

def shoe_size player_name
  find_player(player_name)[:shoe]
end

def team_colors team_name
  if game_hash[:home][:team_name] === team_name
    game_hash[:home][:colors]
  else #away team
    game_hash[:away][:colors]
  end
end

def team_names
  [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers team_name
  # returns an Array of jersey numbers for that team
  if game_hash[:home][:team_name] === team_name
    game_hash[:home][:players].map {|player| player[:number]}
  else #away team
    game_hash[:away][:players].map {|player| player[:number]}
  end
end

def player_stats player_name
  find_player(player_name)
end

def find_player_max shoe_or_points
  all_nums = []
  all_nums << game_hash[:home][:players].map {|player| player[shoe_or_points]}
  all_nums << game_hash[:away][:players].map {|player| player[shoe_or_points]}
  home_found_player = game_hash[:home][:players].find {|player| player[shoe_or_points] === all_nums.join(",").split(",").max.to_i}
  away_found_player = game_hash[:away][:players].find {|player| player[shoe_or_points] === all_nums.join(",").split(",").max.to_i}
  home_found_player ? home_found_player : away_found_player
end

def big_shoe_rebounds
  find_player_max(:shoe)[:rebounds]
end

def most_points_scored
  find_player_max(:points)[:name]
end

def winning_team
  pp find_player_max(:points)
end