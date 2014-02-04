class TonesController < UITableViewController
  include TonesControllerTableViewDataSource
  include TonesControllerTableViewDelegate
  include TonesControllerAlertViewDelegate

  def init
    super
    self.title = "Tones"
    self.tabBarItem = UITabBarItem.alloc.initWithTitle("Tones", image:UIImage.imageNamed("Newspaper"), tag:0)
    self
  end

end
