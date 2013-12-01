describe Motion::Distance do
  before do
    @distance = Motion::Distance.new
  end

  describe "#get" do
    it "starts requesting location updates" do
    end
  end

  describe "#location_manager" do
    it "returns a CLLocationManager" do
      @distance.location_manager.class.should == CLLocationManager
    end
  end
end
