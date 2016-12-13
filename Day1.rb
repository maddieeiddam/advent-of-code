require 'pry'

contents=File.open("inputs/day1.txt", "r"){|file| file.read}
array = contents.split(", ")


facing = "north"
x = 0
y = 0

for direction in array

  if facing == "north"
    if direction.start_with? "R"
      facing = "east"
      direction[0] = ""
      x += direction.to_i
    else
      facing = "west"
      direction[0] = ""
      x -= direction.to_i
    end
  elsif facing == "east"
    if direction.start_with? "R"
      facing = "south"
      direction[0] = ""
      y -= direction.to_i
    else
      facing = "north"
      direction[0] = ""
      y += direction.to_i
    end
  elsif facing == "south"
    if direction.start_with? "R"
      facing = "west"
      direction[0] = ""
      x -= direction.to_i
    else
      facing = "east"
      direction[0] = ""
      x += direction.to_i
    end
  elsif facing == "west"
    if direction.start_with? "R"
      facing = "north"
      direction[0] = ""
      y += direction.to_i
    else
      facing = "south"
      direction[0] = ""
      y -= direction.to_i
    end
  end
end

puts x
puts y
