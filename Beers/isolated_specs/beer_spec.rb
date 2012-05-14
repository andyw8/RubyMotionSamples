class CLLocationCoordinate2D; end
class NSURL; end

require_relative '../app/beer'

describe Beer do
    it "saves the co-ordinates" do
      NSURL.stub_chain(:alloc, :initWithString)
      lat, long = stub, stub
      CLLocationCoordinate2D.any_instance.should_receive(:latitude=).with(lat)
      CLLocationCoordinate2D.any_instance.should_receive(:longitude=).with(long)
      beer = Beer.new(lat, long, stub, stub)
    end

    it "saves the name" do
      NSURL.stub_chain(:alloc, :initWithString)
      CLLocationCoordinate2D.any_instance.stub(:latitude=)
      CLLocationCoordinate2D.any_instance.stub(:longitude=)
      beer = Beer.new(stub, stub, 'foo', stub)
      beer.title.should == 'foo'
    end

    it "saves the url" do
      CLLocationCoordinate2D.any_instance.stub(:latitude=)
      CLLocationCoordinate2D.any_instance.stub(:longitude=)
      ns_url_alloc = mock
      NSURL.stub(:alloc => ns_url_alloc)
      ns_url = mock
      ns_url_alloc.should_receive(:initWithString).with('http://example.com').and_return(ns_url)
      beer = Beer.new(stub, stub, stub, 'http://example.com')
    end

    it "provides the co-ordinates" do
      NSURL.stub_chain(:alloc, :initWithString)
      coordinate = mock.as_null_object
      CLLocationCoordinate2D.stub(:new => coordinate)
      Beer.new(stub, stub, stub, stub).coordinate.should == coordinate
    end
end
