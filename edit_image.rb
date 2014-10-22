# This program was designed to let users edit an image through Ruby. They can tint, inverse, or create a random noise on a any image. Feel free to use the jpegs in the directory, or use wget to bring in one of your own. 

# Tells the program what gems it needs to use
require './image_array.rb'

# Set 'loop variables'
option_loop = true
color_loop = true
input_loop = true
percent_loop = true

system "clear"

# Starts the actual program with  a description
puts "Welcome to the Image Editer! This program was designed to edit images using Ruby. You can either use the images already in the directory, or use wget to bring in your own."
sleep 5
system "clear"

# Prompts the user for the name of a picture file
while input_loop == true 
	puts "What is the name of the image you would like to edit (file_name.jpg)? The program will continue to display this message until a valid input is given."
	puts "Images already in the directory are 'dolphins.jpg' and 'turtle.jpg'."
	fileName = gets.to_s.chomp
	present = File.exist?(fileName)
	path = File.extname(fileName)
	system "clear"
	if present == true and path == ".jpg"
		input_loop = false
		img = ImageArray.new(fileName)
	end
end
	
# Prompts the user to choose a transformation
while option_loop == true
	puts "What kind of transformation would you like to do to your image? Enter '1' for adding a tint. Enter '2' for making the image negative. Enter '3' for creating a random noise on the picture." 
	puts "The program will continue to display this message if something other than '1','2', or '3' is inputed."
	option = gets.to_f
	system "clear"

	# Perform the tint transformation
	if option == 1
	option_loop = false
		while color_loop == true
			puts "What component of the picture would you like to edit? (red,blue,green) If something other than one of the colors is inputed, this question will repeat."
			colorOption = gets.chomp.downcase
			system "clear"
			if colorOption == "red"
				while percent_loop == true
					puts "What percentage of the " + colorOption.to_s + " component would you like to keep?"
					puts "This message will continue to display until a number inbetween 0 and 100 is inputed."
					percentOption = gets.to_f
					system "clear"
					if percentOption >= 0 and percentOption <= 100
						percent_loop = false
						img.each do |row|
							row.each do |pixel|
								pixelred = pixel.red * (percentOption / 100)
								pixel.red = pixelred
							end
						end
						color_loop = false
					end
				end
			end
			if colorOption == "blue"
				while percent_loop == true
					puts "What percentage of the " + colorOption.to_s + " component would you like to keep?" 
					puts "This message will continue to display until a number inbetween 0 and 100 is inputed."
					percentOption = gets.to_f
					system "clear"
					if percentOption >= 0 and percentOption <= 100
						percent_loop = false
						img.each do |row|
							row.each do |pixel|
								pixelblue = pixel.blue * (percentOption / 100)	
								pixel.blue = pixelblue
							end
						end
						color_loop = false
					end
				end
			end
			if colorOption == "green"
				while percent_loop == true
					puts "What percentage of the " + colorOption.to_s + " component would you like to keep?"
					puts "This message will continue to display until a number inbetween 0 and 100 is inputed."
					percentOption = gets.to_f
					system "clear"
					if percentOption >= 0 and percentOption <= 100
						percent_loop = false
						img.each do |row|
							row.each do |pixel|
								pixelgreen = pixel.green * (percentOption / 100)
								pixel.green = pixelgreen
							end
						end
						color_loop = false
					end	
				end
			end
		end
	end

	# Inverse the image
	if option == 2
	option_loop = false
		img.each do |row|
			row.each do |pixel|
				red_inverse = img.max_intensity - pixel.red
				blue_inverse = img.max_intensity - pixel.blue
				green_inverse = img.max_intensity - pixel.green
				pixel.red = red_inverse
				pixel.blue = blue_inverse
				pixel.green = green_inverse
			end
		end
	end

	#Perform the random noise on the image
	if option == 3
	option_loop = false
		img.each do |row|
			row.each do |pixel|
				rand_red = pixel.red + rand(pixel.red)
				rand_blue = pixel.blue + rand(pixel.blue)
				rand_green = pixel.green + rand(pixel.green)
				pixel.red = rand_red
				pixel.blue = rand_blue
				pixel.green = rand_green
			end
		end
	end
end
# Output the edited image
puts "The edited image has been outputed into your directory as the file name, but a letter signifying the selected transformation has been added to the name."
if option == 1
	img.write('t' + fileName)
	puts "You have selected a tint (t)."
end 
if option == 2 
	img.write('i' + fileName)
	puts "You have selected an inverse (i)."
end
if option == 3
	img.write('n' + fileName)
	puts "You have selected a random noise (n)."
end

# PLEASE DO NOT COPY MY PROGRAM. I SPENT A LOT OF TIME ON IT AND WOULD NOT LIKE TO BE PLAGIARIZED.
