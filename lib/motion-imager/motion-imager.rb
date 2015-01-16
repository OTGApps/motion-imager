class MotionImager
  attr_reader :jts_controller

  def initialize(args={})
    @args = args
  end

  def show
    @c = controller
    @c.showFromViewController(@args[:presenting_from],
      transition: transitions[@args[:transition]] || JTSImageViewControllerTransition_FromOriginalPosition
    )
  end

  def hide(animated = true)
    @c.dismiss(animated) if @c
  end
  alias :dismiss :hide

  def controller
    @jts_controller = JTSImageViewController.alloc.initWithImageInfo(image_info,
                 mode: modes[@args[:mode]] || JTSImageViewControllerMode_Image,
      backgroundStyle: backgrounds[@args[:background]] || JTSImageViewControllerBackgroundOption_Scaled
    )
  end

  def image_info
    JTSImageInfo.new.tap do |i|
      if @args[:image]
        @args[:image] = UIImage.imageNamed(@args[:image]) if @args[:image].is_a?(String)
        i.image = @args[:image]
      elsif @args[:url]
        @args[:url] = NSURL.URLWithString(@args[:url]) if @args[:url].is_a?(String)
        if @args[:placeholder]
          @args[:placeholder] = UIImage.imageNamed(@args[:placeholder]) if @args[:placeholder].is_a?(String)
          i.placeholderImage = @args[:placeholder]
        end
        i.imageURL = @args[:url]
      end
      i.altText = @args[:text] if @args[:text]
      i.referenceRect = @args[:rect] if @args[:rect]
      i.referenceView = @args[:view] if @args[:view]
    end
  end

  def transitions
    {
      original: JTSImageViewControllerTransition_FromOriginalPosition,
      off_screen: JTSImageViewControllerTransition_FromOffscreen
    }
  end

  def modes
    {
      image: JTSImageViewControllerMode_Image,
      alt_text: JTSImageViewControllerMode_AltText
    }
  end

  def backgrounds
    {
      none: JTSImageViewControllerBackgroundOption_None,
      scaled: JTSImageViewControllerBackgroundOption_Scaled,
      blurred: JTSImageViewControllerBackgroundOption_Blurred,
      scaled_blurred: JTSImageViewControllerBackgroundOption_Scaled | JTSImageViewControllerBackgroundOption_Blurred
    }
  end

end

