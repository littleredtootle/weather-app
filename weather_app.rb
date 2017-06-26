require 'barometer'
#Barometer.config = { 1 => [:yahoo, 2 => :wunderground] }

# '#' shows requirements of code and various code I've tinkered with to get the
#working code shown. Temperatures shown in Centigrade rather than Farenheit.
#Assistance from Challenge Solution for the last part!! :)

puts "What is your location?"
location = gets


#1. Create a method that accepts the location as a parameter then uses your
#weather gem of choice to determine the weather int he user's location.

#barometer = Barometer.new("#{location}").measure
#weather = barometer.measure

weather = Barometer.new("#{location}").measure
tomorrow = Time.now.strftime('%d').to_i + 1

puts weather.current.temperature

if weather.current.temperature.to_i >= 18
 then todaysWeather = "warm"
else
  todaysWeather = "chilly"
end

# use yahoo and weather bug, if they both fail, use wunderground
#Barometer.config = { 1 => [:yahoo, {weather_bug: {keys: {code: CODE_KEY} }}], 2 => :wunderground }

#barometer = Barometer.new('#{location}')
#weather = barometer.measure

#puts weather.current.temperature

#2. Method should ultimately determine the weather as a string: sunny, cloudy,
#snowy, rainy etc.

#3. Puts the outcome fo the method to display the weather back to the user.

puts "The weather is #{todaysWeather} where you are today!"


weather.forecast.each do |forecast|
  day = forecast.starts_at.day

if day == tomorrow
  dayName = 'Tomorrow'
else
  dayName = forecast.starts_at.strftime('%A')
end

puts dayName + ' is going to be ' + forecast.icon + ' with a low of ' + forecast.low.c.to_s + ' and a high of ' + forecast.high.c.to_s
end
