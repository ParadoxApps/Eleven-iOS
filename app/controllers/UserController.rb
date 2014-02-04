class UserController < UIViewController
  attr_accessor :user

  def init
    super
    self.title = "Profile"
    self.tabBarItem = UITabBarItem.alloc.initWithTitle("Profile", image:UIImage.imageNamed("Profile"), tag:1)
    self.user = User.first || User.create
    cdq.save
    self
  end

  def viewDidLoad
   self.navigationController.navigationBar.translucent = false

   self.navigationItem.rightBarButtonItem = saveButton

    self.view.backgroundColor = UIColor.whiteColor
    @userView = UserView.alloc.initWithFrame(self.view.frame, andUser:self.user)
    self.view.addSubview(@userView)
  end

  def saveButton
    @saveButton ||= UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemSave, target:self, action:'save')
  end

  def save
    @userView.subviews.each { |v| v.resignFirstResponder }
    self.user.name = @userView.nameField.text
    self.user.bio = @userView.bioField.text
    cdq.save
    UIAlertView.alloc.initWithTitle("Profile Updated", message:nil, delegate:nil, cancelButtonTitle:"OK", otherButtonTitles:nil).show
  end

end
