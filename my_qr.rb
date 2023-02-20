require "rqrcode"
counter = false
while counter == false

p "What kind of QR code would you like to generate?"
puts "1. Open a URL"
puts "2. Join a wifi network"
puts "3. Send a text message"
puts "4. Exit program"
ans = gets.chomp

if ans == "1"
  puts "Enter the URL: "
  urlstring = gets.chomp
# Use the RQRCode::QRCode class to encode some text
qrcode = RQRCode::QRCode.new("#{urlstring}")

# Use the .as_png method to create a 500 pixels by 500 pixels image
png = qrcode.as_png({ :size => 500 })

puts "What is the filename?"
filestring = gets.chomp

# Write the image data to a file
IO.binwrite("#{filestring}.png", png.to_s)
end

if ans == "2"
  puts "Enter the network name: "
  networkstring = gets.chomp
  puts "Enter the password:"
  pwstring = gets.chomp  
  
# Use the RQRCode::QRCode class to encode some text
qrcode = RQRCode::QRCode.new("WIFI:T:WPA;S:#{networkstring};P:#{pwstring};;
")

# Use the .as_png method to create a 500 pixels by 500 pixels image
png = qrcode.as_png({ :size => 500 })
  
 
  puts "What is the filename?"
  filestring = gets.chomp

# Write the image data to a file
IO.binwrite("#{filestring}.png", png.to_s)
end

if ans == "3"
  puts "What is the phone number you want the code to send a text message to? "
  phonestring = gets.chomp
  puts "What do you want to populate the message with?"
  msgstring = gets.chomp  
  
# Use the RQRCode::QRCode class to encode some text
qrcode = RQRCode::QRCode.new("SMSTO:#{phonestring}:#{msgstring}")

# Use the .as_png method to create a 500 pixels by 500 pixels image
png = qrcode.as_png({ :size => 500 })
  
 
  puts "What is the filename?"
  filestring = gets.chomp

# Write the image data to a file
IO.binwrite("#{filestring}.png", png.to_s)
end

if ans == "4"
  counter = true
end
end
