class Tile < Joybox::Core::Sprite
  TYPES = %w(
    boy gem_blue gem_green gem_orange girl_cat girl_horn
    girl_pink girl_princess heart key ladybug star
  )

  attr_reader :type, :frozen

  def initialize(opts={})
    @type = opts[:type]
    @position = opts[:position]

    super frame_name: 'hidden.png', position: @position
  end

  def touched?(touch_location)
    return if @frozen

    rect = CGRect.new(boundingBox.origin, boundingBox.size)
    CGRectContainsPoint(rect, touch_location)
  end

  def flip
    if is_showing?("hidden.png")
      show "#{@type}.png"
    else
      show "hidden.png"
    end

    run_action Sequence.with(actions: [
      Scale.to(scale: 1.5, duration: 0.2),
      Scale.to(scale: 1.0, duration: 0.2)
    ])
  end

  def freeze
    @frozen = true
  end

  def show(frame_name)
    setDisplayFrame SpriteFrameCache.frames[frame_name]
  end

  def is_showing?(frame_name)
    isFrameDisplayed SpriteFrameCache.frames[frame_name]
  end

end