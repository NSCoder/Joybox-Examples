class AnimationLayer < Joybox::Core::Layer

  scene

  def on_enter
    layout_bear_sprite
    setup_user_interaction
  end

  def layout_bear_sprite
    sprite_batch = SpriteBatch.new file_name: 'sprites/animation_bear.png'
    self << sprite_batch

    SpriteFrameCache.frames.add file_name: 'sprites/animation_bear.plist'

    walking_frames = SpriteFrameCache.frames.where prefix: "bear", suffix: ".png", from: 1
    walking_animation = Animation.new frames: walking_frames, delay: 0.1
    @walking_action = Repeat.forever action: walking_animation.action

    @bear_sprite = Sprite.new frame_name: 'bear1.png', position: [Screen.half_width, Screen.half_height]
    @bear_sprite.run_action @walking_action
    sprite_batch << @bear_sprite
  end

  def setup_user_interaction

    on_touches_ended do |touches, event|
      touch = touches.any_object
      touch_location = touch.location

      bear_velocity = Screen.width / 3.0
      move_difference = jbpSub(touch_location, @bear_sprite.position)
      distance_to_move = jbpLenght(move_difference)
      move_duration = distance_to_move / bear_velocity

      @bear_sprite.flip x:false, y:false if move_difference.x < 0
      @bear_sprite.flip x:true, y:false if move_difference.x > 0

      @bear_sprite.stop_action(@move_action) unless @move_action.nil?
      @move_action = Move.to duration:move_duration, position:touch_location
      @bear_sprite.run_action @move_action
    end
  end

end