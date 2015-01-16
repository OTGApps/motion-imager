describe "MotionImager" do
  before do
    @mi = MotionImager.new({
      image: UIImage.imageNamed('banecat.jpg'),
      presenting_from: WeakRef.new(self),
    })
  end

  it "sucessfully created a MotionImager" do
    @mi.should != nil
    @mi.class.should == MotionImager
  end

  it "allows access to the Controller" do
    @mi.controller.class.should == JTSImageViewController
  end

end