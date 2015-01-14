class MotionImager

  def initialize(args={})
    show(args)
  end

  def show(args={})
    controller(args).showFromViewController(args[:presenting_from],
      transition: transitions[args[:transition]] || JTSImageViewControllerTransition_FromOriginalPosition
    )
  end

  def controller(args = {})
    JTSImageViewController.alloc.initWithImageInfo(image_info(args),
                 mode: modes[args[:mode]] || JTSImageViewControllerMode_Image,
      backgroundStyle: backgrounds[args[:background]] || JTSImageViewControllerBackgroundStyle_Scaled
    )
  end

  def image_info(args = {})
    JTSImageInfo.new.tap do |i|
      if args[:image]
        args[:image] = UIImage.imageNamed(args[:image]) if args[:image].is_a?(String)
        i.image = args[:image]
      elsif args[:url]
        args[:url] = NSURL.URLWithString(args[:url]) if args[:url].is_a?(String)
        if args[:placeholder]
          args[:placeholder] = UIImage.imageNamed(args[:placeholder]) if args[:placeholder].is_a?(String)
          i.placeholderImage = args[:placeholder]
        end
        i.imageURL = args[:url]
      end
      i.altText = args[:text] if args[:text]
      i.referenceRect = args[:rect] if args[:rect]
      i.referenceView = args[:view] if args[:view]
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

