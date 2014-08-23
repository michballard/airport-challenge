require './lib/airport'
require './lib/plane'
require './lib/weather'

describe Airport do

	let(:airport) { Airport.new(:capacity => 200) }
	let(:airport2) { Airport.new }
	let(:plane) { Plane.new }

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

	def fill_airport
		allow(airport).to receive(:weather).and_return(1, 2, 3)
		airport.capacity.times { airport.accept(Plane.new) }
	end

	context 'initialising an airport' do
		it 'is an airport' do 
			expect(airport).to be_an Airport
		end 

		it 'contains no planes when it is created' do
			expect(airport.plane_count).to eq 0
		end

		it 'should allow setting capacity on initialising' do
			expect(airport.capacity).to eq 200
		end

		it 'should set a default capacity if no specific capacity is given' do
			expect(airport2.capacity).to eq 100
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
			expect(airport).not_to be_full
			fill_airport
			expect(airport).to be_full
		end

		it 'cannot land a plane if airport is full' do
			fill_airport
			expect{airport.accept(plane)}.to raise_error(RuntimeError)
		end

		it 'cannot take off a plane if airport is empty' do 
			expect{airport.release(plane)}.to raise_error(RuntimeError)
		end
	end

	context 'grand finale test' do


	end

end