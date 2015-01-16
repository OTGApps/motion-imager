class RootScreen < PM::TableScreen
  title "BANECAT!"

  def table_data
    [{
      cells:[{
        title: "BaneCat!",
        action: :banecat
      }, {
        title: "Show and then dismiss",
        subtitle: "...after 2 seconds",
        action: :banecat_dismiss
      }]
    }]
  end

  def banecat
    $mi = MotionImager.new({
      image: UIImage.imageNamed('banecat.jpg'),
      presenting_from: WeakRef.new(self),
    })
    $mi.show
  end

  def banecat_dismiss
    @mi = MotionImager.new({
      image: UIImage.imageNamed('banecat.jpg'),
      presenting_from: WeakRef.new(self),
    })
    @mi.show

    timer = NSTimer.scheduledTimerWithTimeInterval(2, target:self, selector: :dismiss, userInfo:nil, repeats:false)
  end

  def dismiss
    @mi.dismiss
    @mi = nil
  end

end
