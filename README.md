# motion-imager

motion-imager is a RubyMotion DSL in top of [JTSImageViewController](https://github.com/jaredsinclair/JTSImageViewController) by Jared Sinclair allowing you to easily create a "light-box" type view for users to view an image and interact with it.

## Installation

Add this line to your application's Gemfile:

    gem 'motion-imager'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install motion-imager

## Usage

Using a UIImage:

```ruby
MotionImager.new({
  image: UIImage.imageNamed('something'),
  presenting_from: WeakRef.new(self),
})
```

Using a URL:

```ruby
MotionImager.new({
  # OR an instance of NSURL
  url: 'https://www.google.com/images/srpr/logo11w.png',
  placeholder: 'my_placeholder_image',
  presenting_from: WeakRef.new(self),
})

```

Showing a lightbox with text. This view is only text, no image.

```ruby
MotionImager.new({
  presenting_from: WeakRef.new(self),
  transition: :original,
  mode: :alt_text,
  text: "This is a cool image",
})

```

Documentation for all available options:

```ruby
{
  # A local image reference.
  # Can also be a String that will be turned into a UIImage
  # REQUIRED id not specifying `url`
  image: UIImage.imageNamed('something'),

  # A url can be any displayable image on iOS.
  # Can also be an instance of NSURL
  # REQUIRED if not specifying `image`
  url: 'https://www.google.com/images/srpr/logo11w.png',
  
  # Placeholder image that will be displayed during the image download time.
  # Can also be an instance of UIImage
  # OPTIONAL
  placeholder: 'my_placeholder.png',

  # What view controller to show the lightbox from.
  # REQUIRED. Should almost ALWAYS be `WeakRef.new(self)`
  presenting_from: WeakRef.new(self),
  
  # Two image transitions are supported:
  #  :original - displays the image zooming from it's original position on the screen
  #  :off_screen - slides the image in from off screen.
  # OPTIONAL. Defaults to `:original`
  transition: :original,
  
  # Two modes are supported:
  #  :image - only dislays the image
  #  :alt_text - displays text instead of an image. Requires `text` to be set
  # OPTIONAL. Defaults to `:image`
  mode: :image,
  
  # Sets the text for the image when using mode: :alt_text.
  # OPTIONAL
  text: "Some Text",

  # Sets the animation and style of the background while in lightbox mode
  # Options supported are:
  #  none:, scaled:, blurred:, scaled_blurred:
  # OPTIONAL. Defaults to :scaled
  background: :scaled_blurred,
  
  # The frame of the originating view on the screen.
  # If set and in :original transition, the full-screen image
  # will zoom from this location on the screen.
  # OPTIONAL
  rect: my_thumbnail.frame,
  
  # The the superview of the rect you set above.
  # OPTIONAL
  view: view
}
```

## Roadmap

1. Add convenience constructors like: `MotionImager.url({})`, `MotionImager.image({})`, and `MotionImager.text({})`
2. Tests. :)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
