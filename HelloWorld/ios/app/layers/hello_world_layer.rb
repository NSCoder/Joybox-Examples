class HelloWorldLayer < Joybox::Core::Layer

  scene

  def on_enter
    title = Label.new text: 'Hello World', font_size: 64, position: Screen.center
    self << title
  end

end