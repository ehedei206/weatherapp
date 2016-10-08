require 'barometer'

class Day

	attr_reader :condition, :low, :high, :day
	attr_writer :condition, :low, :high, :day


end
def weather (location)
	barometer = Barometer.new (location)
	weather = barometer.measure
	days = []


	weather.forecast.each do |day|
		item = Day.new
		item.condition=day.icon
		item.low=day.low
		item.high=day.high
		item.day=determine_day(day.starts_at.wday)

		if Time.now.strftime("%A").eql?item.day
			item.day="Today"
		elsif Time.now.strftime("%w").to_i==(day.starts_at.wday-1) || Time.now.strftime("%w").to_i==(day.starts_at.wday+6)
			item.day="Tomorrow"
		end
		days << item

	end
	
	
	days.each do |item|
		puts item.day + " is going to be " + item.condition + " with a low of " + item.low + " and a high of " + item.high
	end

end

def determine_day (day)
	dayname=""
	case day
		when day = 0
			dayname="Sunday"
		when day = 1
			dayname="Monday"
		when day = 2
			dayname="Tuesday"
		when day = 3
			dayname="Wednesday"
		when day = 4
			dayname="Thursday"
		when day = 5
			dayname="Friday"
		when day = 6
			dayname="Saturday"

	end	
end

puts "What is your location?"
loc=gets
weather (loc)
