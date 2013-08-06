class GameScene < Joybox::Core::Scene

  def on_enter
    self << BackgroundLayer.new
    self << ActionsLayer.new
  end

end