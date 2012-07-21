class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    return true if RUBYMOTION_ENV == 'test'
    nav = UINavigationController.alloc.initWithRootViewController(LocationsController.alloc.init)
    nav.wantsFullScreenLayout = true
    nav.toolbarHidden = true
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = nav
    @window.makeKeyAndVisible
    return true
  end
end
