require 'rspec'
require_relative 'ruby'

# Create the code in the ruby.rb file that makes the following Bike specs pass.
# There is no need to modify this file. All coding should happen in the ruby.rb file.

describe Bike do
  let (:bike) { Bike.new('Trek') }
  it 'has to be real' do
    expect{ bike }.to_not raise_error
  end
  it 'has a model' do
    expect(bike.model).to eq('Trek')
    expect(bike.model).to be_a(String)
  end
  it 'has two wheels' do
    expect(bike.wheels).to eq(2)
    expect(bike.wheels).to be_a(Integer)
  end
  it 'can become a tricycle' do
    bike.wheels = 3
    expect(bike.wheels).to eq(3)
  end
  it 'has a default speed of zero' do
    expect(bike.current_speed).to eq(0)
    expect(bike.current_speed).to be_a(Integer)
  end
  it 'can increase speed by a given amount' do
    expect(bike.pedal_faster(10)).to eq(10)
    expect(bike.pedal_faster(17)).to eq(27)
    expect(bike.current_speed).to be_a(Integer)
  end
  it 'can decrease speed by a given amount' do
    bike.pedal_faster(20)
    expect(bike.brake(7)).to eq(13)
    expect(bike.current_speed).to be_a(Integer)
  end
  it 'cannot go negative speeds' do
    bike.pedal_faster(20)
    expect(bike.brake(25)).to eq(0)
    expect(bike.current_speed).to be_a(Integer)
  end
  it 'can log all of its current data' do
    expect(bike.bike_info).to eq('The Trek bike has 2 wheels and is going 0 mph.')
    bike.pedal_faster(20)
    expect(bike.bike_info).to eq('The Trek bike has 2 wheels and is going 20 mph.')
    expect(bike.bike_info).to be_a(String)
  end
end