require 'pry'

contents=File.open("inputs/day1.txt", "r"){|file| file.read}
array = contents.split(", ")


facing = "north"
x = 0
y = 0

locations = []

for direction in array

  if facing == "north"
    if direction.start_with? "R"
      facing = "east"
      direction[0] = ""
      for i in 1..direction.to_i
        x += 1
        locations << x
        locations << y
      end
    else
      facing = "west"
      direction[0] = ""
      for i in 1..direction.to_i
        x -= 1
        locations << x
        locations << y
      end
    end
  elsif facing == "east"
    if direction.start_with? "R"
      facing = "south"
      direction[0] = ""
      for i in 1..direction.to_i
        y -= 1
        locations << x
        locations << y
      end
    else
      facing = "north"
      direction[0] = ""
      for i in 1..direction.to_i
        y += 1
        locations << x
        locations << y
      end
    end
  elsif facing == "south"
    if direction.start_with? "R"
      facing = "west"
      direction[0] = ""
      for i in 1..direction.to_i
        x -= 1
        locations << x
        locations << y
      end
    else
      facing = "east"
      direction[0] = ""
      for i in 1..direction.to_i
        x += 1
        locations << x
        locations << y
      end
    end
  elsif facing == "west"
    if direction.start_with? "R"
      facing = "north"
      direction[0] = ""
      for i in 1..direction.to_i
        y += 1
        locations << x
        locations << y
      end
    else
      facing = "south"
      direction[0] = ""
      for i in 1..direction.to_i
        y -= 1
        locations << x
        locations << y
      end
    end
  end
end

pairs = locations.each_slice(2).to_a

duplicate = []

for pair in pairs
  if duplicate.include? pair
    print pair
  else
    duplicate << pair
  end
end
