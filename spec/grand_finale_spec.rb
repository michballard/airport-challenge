require 'airport'
require 'plane'

describe 'Grand Finale test' do

	let(:test_airport) { Airport.new(capacity: 6) }
	let(:plane) { Plane.new }

	def fill_airport(airport_to_fill)
		allow(airport_to_fill).to receive(:weather).and_return(1,3)
		airport_to_fill.capacity.times { airport_to_fill.accept(plane) }
	end

		it 'all planes can land and all can take off' do
			fill_airport(test_airport)
			expect(test_airport).to be_full
			test_airport.planes.each do |plane|
				expect(plane.status).to eq Plane::Landed
			end

			flying_planes = []			
			while test_airport.plane_count > 0
				test_airport.planes.each do |plane|
					allow(test_airport).to receive(:weather).and_return(1,5)
					test_airport.release(plane)
					plane.take_off!
					flying_planes << plane
				end
			end

			expect(test_airport).to be_empty
			flying_planes.each do |plane|
				expect(plane.status).to eq Plane::Flying
			end
		end
end