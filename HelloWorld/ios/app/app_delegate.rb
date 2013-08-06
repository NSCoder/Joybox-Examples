class AppDelegate

  def application(application, didFinishLaunchingWithOptions: launchOptions)
    @director = Joybox::Configuration.setup

    @navigation_controller = UINavigationController.alloc.initWithRootViewController(@director)
    @navigation_controller.navigationBarHidden = true

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.setRootViewController(@navigation_controller)
    @window.makeKeyAndVisible

    @director << HelloWorldLayer.scene
    true
  end
  
end