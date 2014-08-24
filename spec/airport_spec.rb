require './lib/airport'
require './lib/plane'
require './lib/weather'

describe Airport do

	let(:plane)    	   { Plane.new                }
	let(:airport)      { Airport.new 			  }
	let(:test_airport) { Airport.new(capacity: 6) }

	def landing_a_plane
		allow(airport).to receive(:weather).and_return(1, 2, 3)
		airport.accept(plane)
		plane.land!
	end

	def taking_off_a_plane
		allow(airport).to receive(:weather).and_return(1, 2, 3)
		airport.release(plane)
		plane.take_off!
	end

	def fill_airport(airport_to_fill)
		allow(airport_to_fill).to receive(:weather).and_return(1, 2, 3)
		airport_to_fill.capacity.times { airport_to_fill.accept(Plane.new.land!) }
	end

	context 'initialising an airport' do
		it 'contains no planes when it is created' do
			expect(airport.plane_count).to eq 0
		end

		it 'should set a default capacity if no specific capacity is given' do
			expect(airport.capacity).to eq 100
		end

		it 'should allow setting capacity on initialising' do
			expect(test_airport.capacity).to eq 6
		end
	end

	context 'taking off and landing' do
		it 'can allow a plane to land' do 
			expect(airport.plane_count).to eq 0
			landing_a_plane
			expect(airport.plane_count).to eq 1
		end

		it 'can allow a plane to take off' do 
			landing_a_plane
			taking_off_a_plane
			expect(airport.plane_count).to eq 0
		end
	end

	context 'traffic control' do
		it 'knows when it is full' do
			expect(airport).to be_empty
			fill_airport(airport)
			expect(airport).to be_full
		end

		it 'cannot land a plane if airport is full' do
			fill_airport(airport)
			expect{airport.accept(plane)}.to raise_error "Full airport - Plane cannot land"
		end

		it 'cannot take off a plane if airport is empty' do 
			expect{airport.release(plane)}.to raise_error "Empty airport - No plane to take off"
		end
	end

	context 'the grand finale test' do
		it 'all planes can land and all can take off' do
			fill_airport(test_airport)
			expect(test_airport).to be_full
			test_airport.planes.each do |plane|
				expect(plane.status).to eq Plane::Landed
			end

			flying_planes = []			
			while test_airport.plane_count > 0
				test_airport.planes.each do |plane|
					allow(airport).to receive(:weather).and_return(1, 2, 3, 4, 5)
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
end