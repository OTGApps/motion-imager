describe "Application 'motion-imager'" do
  before do
    @app = UIApplication.sharedApplication
  end

  it "has window(s)" do
    @app.windows.size.should > 0
  end
end
