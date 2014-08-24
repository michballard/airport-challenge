require './lib/plane'
require './lib/weather'

class Airport

	DEFAULT_CAPACITY = 100

	include Weather

	attr_reader :planes

	def initialize(options = {}, plane_input = [])
		self.capacity = options.fetch(:capacity, capacity)
		@planes = plane_input
		@weather = generate_random_weather
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def plane_count
		planes.count
	end

	def full?
		plane_count == @capacity
	end

	def empty?
		plane_count == 0
	end

	def accept(plane)
		raise "Full airport - Plane cannot land" if full?
		raise "Stormy weather - Plane cannot land" if stormy?
		planes << plane
	end

	def release(plane)
		raise "Empty airport - No plane to take off" if empty?
		raise "Stormy weather - Plane cannot take off" if stormy?
		planes.delete(plane)
	end

end