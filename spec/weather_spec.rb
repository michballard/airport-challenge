require './lib/weather'
require './lib/airport'
require './lib/plane'

describe Weather do

	let(:airport) { Airport.new }
	let(:plane)   { Plane.new   }

	context 'weather conditions' do 
		it "knows when it's sunny" do 
			allow(airport).to receive(:weather).and_return(1,3)
			expect(airport).to be_sunny
		end

		it "knows when it's stormy" do 
			allow(airport).to receive(:weather).and_return(4,5)
			expect(airport).to be_stormy
		end

		it "cannot land a plane when it's stormy" do 
			allow(airport).to receive(:weather).and_return(4,5)
			expect{airport.accept(plane)}.to raise_error "Stormy weather - Plane cannot land"		
		end

		it "cannot take off a plane when it's stormy" do
			allow(airport).to receive(:weather).and_return(1,3)
			airport.accept(plane)
			allow(airport).to receive(:weather).and_return(4,5)
			expect{airport.release(plane)}.to raise_error "Stormy weather - Plane cannot take off"		
		end
	end
end