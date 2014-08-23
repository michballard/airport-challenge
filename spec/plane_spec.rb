require './lib/plane.rb'

describe Plane do

	let(:plane) { Plane.new }

	def taking_off_and_landing
		plane.take_off!
		plane.land!
	end

	it 'is a plane' do 
		expect(plane).to be_a Plane
	end

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
		taking_off_and_landing
		expect(plane.status).to eq Plane::Landed
	end

	it 'changes its status to not flying after landing' do
		plane.take_off!
		expect(plane.status).to eq Plane::Flying
		plane.land!
		expect(plane.status).to eq Plane::Landed
	end

end