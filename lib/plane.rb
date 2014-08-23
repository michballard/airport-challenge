class Plane

	plane_status_types = [Flying = "flying", Landed = "landed"]

	attr_accessor :plane_status

	def initialize
		self.plane_status = Landed
	end

	def status
		self.plane_status
	end

	def take_off!
		self.plane_status = Flying
		self
	end

	def land!
		self.plane_status = Landed
		self
	end

end