require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  describe '#release_bike' do
    it "releases working bike" do 
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike). to eq bike
      #bike = subject.release_bike
     # expect(bike).to be_working
    end 

    it "raises an error when there are no bikes available" do
      expect {subject.release_bike}.to raise_error "No bikes available"
    end
  end

  it "returns docked bike" do 
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end

end