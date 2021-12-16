require 'docking_station'

describe DockingStation do
  
  it { is_expected.to respond_to :release_bike }
    
   it 'releases working bikes' do
     bike = Bike.new
     subject.dock(bike)
     bike = subject.release_bike
     expect(bike).to be_working
   end
  
  it { is_expected.to respond_to(:dock).with(1).argument }
 
  describe ' #release_bike a' do

    it ' releases a bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
    end
      
  end
  

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe '#dock' do
    it 'raises an error message when full' do
      DockingStation::DEFAULT_CAPACITY.times do
        subject.dock Bike.new
      end

      expect { subject.dock Bike.new }.to raise_error "Docking station full"
    end
  end

end