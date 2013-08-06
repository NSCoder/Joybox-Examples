class GameLayer < Joybox::Core::Layer

  def on_enter
    @world = World.new gravity: [0.0, -9.8]

    schedule_update do |dt|
      @world.step delta: dt
    end

    @player_gorilla = Sprite.new file_name: 'sprites/gorilla.png', position: [108, 147]
    self << @player_gorilla

    body = @world.new_body position: [389, 154] do
      polygon_fixture box: [16, 16], friction: 0.3, density: 1.0
    end

    @enemy_gorilla = PhysicsSprite.new file_name: 'sprites/gorilla.png', body: body
    self << @enemy_gorilla

    init_controls
  end

  def init_controls
    on_mouse_down do |event, button|
      @starting_touch_location = event.location
    end

    on_mouse_up do |event, button|
      end_touch_location = event.location
      banana = new_banana_sprite
      self << banana
      banana.body.apply_force force: (end_touch_location - @starting_touch_location)
    end
  end

  def new_banana_sprite
    banana_body = @world.new_body position: @player_gorilla.position, type: Body::Dynamic do
        polygon_fixture box: [16, 16], friction: 0.3, density: 1.0
    end 

    banana_sprite = PhysicsSprite.new file_name: 'sprites/banana.png', body: banana_body

    @world.when_collide banana_sprite do |collision_sprite, is_touching|
      banana_sprite.file_name = 'sprites/banana_hit.png'
      @enemy_gorilla.file_name = 'sprites/gorilla_hit.png'
    end

    banana_sprite
  end
end