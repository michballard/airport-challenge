require './lib/plane.rb'

describe Plane do

	let(:plane)        { Plane.new           }
	let(:flying_plane) { Plane.new.take_off! }

	it 'a plane is landed when it is created' do
		expect(plane.status).to eq Plane::Landed
	end

	it 'can take off' do 
		plane.take_off!
		expect(plane.status).to eq Plane::Flying
	end

	it 'changes its status to flying after taking off' do
		expect(plane.status).to eq Plane::Landed
		plane.take_off!
		expect(plane.status).to eq Plane::Flying
	end

	it 'can land' do
		flying_plane.land!
		expect(plane.status).to eq Plane::Landed
	end

	it 'changes its status to landed after landing' do
		expect(flying_plane.status).to eq Plane::Flying
		flying_plane.land!
		expect(flying_plane.status).to eq Plane::Landed
	end

end