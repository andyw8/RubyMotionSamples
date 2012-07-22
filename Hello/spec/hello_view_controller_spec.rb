describe "HelloView" do
  tests HelloViewController

  it "shows a greeting" do
    view('message').text.should == 'Hello RubyMotion!'
  end

  it "counts taps" do
    tap('message')
    view('message').text.should == 'Touched 1 times!'
    tap('message')
    view('message').text.should == 'Touched 2 times!'
  end
end
