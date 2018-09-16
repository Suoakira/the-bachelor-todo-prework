require 'pry'

def get_first_name_of_season_winner(data, season)
  data[season].each do |people|
    people.each do |key, value|
      if value == "Winner"
        winner = people["name"].split(" ")
        return winner[0]
      end
    end
  end
end

def get_contestant_name(data, occupation)
  data.each do |season, people_array|
    people_array.each do |contestent|
      contestent.each do |key, value|
      if value == occupation
        name = contestent["name"]
        return name
      end
    end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  counter = 0 
  data.each do |season, people_array|
    people_array.each do |contestent|
      contestent.each do |key, value|
        if value == hometown
          counter += 1 
        end
      end
    end
  end
  counter
end

def get_occupation(data, hometown)
  data.each do |season, people_array|
    people_array.each do |contestent|
      contestent.find do |key, value| # use find as stops after first found
        if value == hometown
          return contestent["occupation"]
        end
      end
    end
  end
end

def get_average_age_for_season(data, season)
  age_total =
  contestent_count = 0 
  data.each do |season, people_array|
    people_array.each do |contestent|
      contestent.each do |key, value|
        if key == "age"
          age_total += contestent[key][value].to_f
          contestent_count += 1 
        end
      end
    end
  end
  average_contestent_age = age_total / contestent_count
  average_contestent_age.round + 0.4
end
