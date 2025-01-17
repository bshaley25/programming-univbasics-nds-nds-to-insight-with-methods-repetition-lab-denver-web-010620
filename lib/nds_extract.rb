$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

p directors_totals(directors_database)

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end
  total
end

def list_of_directors(source)
  # Write this implementation
  index = 0 
  result = []
  while index < source.length do
    result[index] = source[index][:name]
    index += 1 
  end
  result
end

def total_gross(source)
    # Write this implementation
    #
    # Should use methods:
    # 1. directors_totals: returns a Hash of { dir_name => gross }
    # 2. list_of_directors: names provides an Array of directors names (use
    #
    # Visit each key (i.e. director name), look up the value in the hash
    # returned by directors_totals, and add it to a running total. When done,
    # return the total
    total = 0 
    directors = list_of_directors(source)
    directors_gross = directors_totals(source)
    index = 0
    while index < directors_gross.length
        name = directors[index]
        total += directors_gross[name]
        index += 1
    end
    total
end



