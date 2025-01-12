def game_hash()
  
  game_hash = {
    :home => {:team_name => "Brooklyn Nets", :colors => ["Black","White"], 
    :players => [
      {:players_name => "Alan Anderson", :number => 0, :shoe => 16,:points =>22,:rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
    {:players_name => "Reggie Evans", :number => 30, :shoe => 14,:points =>12,:rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
    {:players_name => "Brook Lopez", :number => 11, :shoe => 17,:points =>17,:rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
    {:players_name => "Mason Plumlee", :number => 1, :shoe => 19,:points =>26,:rebounds => 11, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
    {:players_name => "Jason Terry", :number => 31, :shoe => 15,:points =>19,:rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}
    ]
    },
  :away => {:team_name => "Charlotte Hornets", :colors => ["Turquoise","Purple"], 
    :players => 
    [{:players_name => "Jeff Adrien", :number => 4, :shoe => 18,:points =>10,:rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
    {:players_name => "Bismack Biyombo", :number => 0, :shoe => 16,:points =>12,:rebounds => 4, :assists => 7, :steals => 22, :blocks => 15, :slam_dunks => 10},
    {:players_name => "DeSagna Diop", :number => 2, :shoe => 14,:points =>24,:rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
    {:players_name => "Ben Gordon", :number => 8, :shoe => 15,:points =>33,:rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
    {:players_name => "Kemba Walker", :number => 33, :shoe => 15,:points =>6,:rebounds => 12, :assists => 12, :steals => 7, :blocks => 5, :slam_dunks => 12}
    ]
    }
  }
  
  game_hash
end

def num_points_scored(player)
  
 game_hash = game_hash()

  game_hash.each do |key, value|
    value.each do |key2, value2|
        
        if key2 == :players
          value2.each do |key3, value3|
            if key3[:players_name] == player
              return key3[:points]
            end
          end
        end
    end

  end
end


def shoe_size(player)
  
  game_hash = game_hash()
  
  game_hash.each do |key, value|
    value.each do |key2, value2|
        
        if key2 == :players
          value2.each do |key3, value3|
            if key3[:players_name] == player
              return key3[:shoe]
            end
          end
        end
    end

  end
end

def team_colors(teamname)
  
game_hash = game_hash()
  
  game_hash.each do |key, value|
  
   if value[:team_name] == teamname
    return value[:colors]
   
   end
  end
end

def team_names()
  
game_hash = game_hash()
  
 
teamnamesArr = []
  
  game_hash.each do |key, value|
  
   teamnamesArr.push(value[:team_name])
   
   end
  
  return teamnamesArr
end

def player_numbers(teamname)
  game_hash = game_hash()
numbersArr = []

game_hash.each do |key, value|
    
   if value[:team_name] == teamname
      value[:players].each do |key2, value2|
        numbersArr.push(key2[:number]) 
    end
    
   end
  end
  return numbersArr
end
def player_stats(playername)

game_hash = game_hash()
statsArray = []
statsHash = {}

game_hash.each do |key, value|
    value.each do |key2, value2|
        
        if key2 == :players
          value2.each do |key3, value3|
            if key3[:players_name] == playername
            
                key3.each do |key4, value4|
                    statsHash[key4] = value4
                end
            end
          end
        end
    end
    

  end
  statsHash.reject! { |k| k == :players_name }
  statsHash
end

def big_shoe_rebounds()
  
game_hash = game_hash()
top_score = 0
top_scorer_number = 0

game_hash.each do |key, value|

  value.each do |key2, value2|
    if key2 == :players
        value2.each do |key3, value3|
            key3.reduce({}) {|memo, (k,v)|
                
                if k == :shoe
                    if memo == {}
                    memo = v
                    end
                    puts v
                      if top_score < v
                      top_score = v
                      top_scorer_number = key3[:rebounds]
                      end
                      
                    puts memo
                    memo = v
                end

                memo
            }
        end
    end
  end

end
return top_scorer_number
end


def most_points_scored()
  
game_hash = game_hash()
top_score = 0
top_scorer_number = 0

game_hash.each do |key, value|

  value.each do |key2, value2|
    if key2 == :players
        value2.each do |key3, value3|
            key3.reduce({}) {|memo, (k,v)|
                
                if k == :points
                    if memo == {}
                    memo = v
                    end
                    puts v
                      if top_score < v
                      top_score = v
                      top_scorer_number = key3[:players_name]
                      end
                      
                    puts memo
                    memo = v
                end

                memo
            }
        end
    end
  end

end
return top_scorer_number
end


def winning_team()
  
game_hash = game_hash()
bkScore = 0
chScore = 0

game_hash.each do |key, value|

  if value[:team_name] == "Brooklyn Nets"
      value.each do |key2, value2|
        if key2 == :players
          value2.each do |key3, value3|
            bkScore = key3[:points] + bkScore
          end
        end
      end
  end
  if value[:team_name] == "Charlotte Hornets"
      value.each do |key2, value2|
        if key2 == :players
          value2.each do |key3, value3|
            chScore = key3[:points] + chScore
          end
        end
      end
  end

end

  if bkScore > chScore
  return "Brooklyn Nets"
  else
  return "Charlotte Hornets"
  end
end



def player_with_longest_name()
  
game_hash = game_hash()
top_score = 0
top_scorer_number = 0

game_hash.each do |key, value|

  value.each do |key2, value2|
    if key2 == :players
        value2.each do |key3, value3|
            key3.reduce({}) {|memo, (k,v)|
                
                if k == :players_name
                    if memo == {}
                    memo = v
                    end
                    puts v.length
                      if top_score < v.length
                      top_score = v.length
                      top_scorer_number = key3[:players_name]
                      end
                      
                    puts memo
                    memo = v
                end

                memo
            }
        end
    end
  end

end
return top_scorer_number
end

def long_name_steals_a_ton?()
  
game_hash = game_hash()
top_score = 0
top_scorer_number = 0

game_hash.each do |key, value|

  value.each do |key2, value2|
    if key2 == :players
        value2.each do |key3, value3|
            key3.reduce({}) {|memo, (k,v)|
                
                if k == :steals
                    if memo == {}
                    memo = v
                    end
                    puts v
                      if top_score < v
                      top_score = v
                      top_scorer_number = key3[:players_name]
                      end
                      
                    puts memo
                    memo = v
                end

                memo
            }
        end
    end
  end

end

if player_with_longest_name() == top_scorer_number
return true
else
return false
end
end
