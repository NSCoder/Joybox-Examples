class BackgroundLayer < Joybox::Core::Layer

  def on_enter
    background_sprite = Sprite.new file_name: 'sprites/background.png', position: Screen.center
    self << background_sprite
  end

end