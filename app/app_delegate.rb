class AppDelegate
    include CDQ

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    cdq.setup
    
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @tabController = UITabBarController.new

    @tonesNavController = UINavigationController.alloc.initWithRootViewController(TonesController.new)
    @userNavController = UINavigationController.alloc.initWithRootViewController(UserController.new)

    @tabController.viewControllers = [@tonesNavController, @userNavController]

    @window.rootViewController = @tabController
    @window.makeKeyAndVisible
    true
  end
end
