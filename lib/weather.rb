module Weather

	attr_reader :weather
	
	def generate_random_weather
		rand(1..5)
	end

	def sunny?
		weather <= 3
	end

	def stormy?
		weather >= 4
	end

end