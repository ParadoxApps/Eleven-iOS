class UserView < UIView

  def initWithFrame(frame, andUser:user)
    self.initWithFrame(frame)
    @user = user
    self.displayForm
    self
  end

  def displayForm
    self.addSubview(nameLabel)
    self.addSubview(nameField)
    self.addSubview(bioLabel)
    self.addSubview(bioField)
  end

  def nameLabel
    @nameLabel ||= UILabel.new.tap do |l|
      l.frame = CGRectMake(20, 20, self.frame.size.width - 40, 30)
      l.text = "Username"
      l.font = UIFont.systemFontOfSize(13)
    end
  end

  def nameField
    @nameField ||= UITextField.new.tap do |f|
      f.frame = CGRectMake(20, 50, self.frame.size.width - 40, 30)
      f.placeholder = "Enigma"
      f.text = @user.name
    end
  end

  def bioLabel
    @bioLabel ||= UILabel.new.tap do |l|
      l.frame = CGRectMake(20, 100, self.frame.size.width - 40, 30)
      l.text = "Your bio"
      l.font = UIFont.systemFontOfSize(13)
    end
  end

  def bioField
    @bioField ||= UITextView.new.tap do |f|
      f.frame = CGRectMake(0, 130, self.frame.size.width, 100)
      f.font = UIFont.systemFontOfSize(15)
      f.text = @user.bio || "Tone junkie..."
      f.textContainerInset = UIEdgeInsetsMake(0, 20, 0, 20)
      f.textContainer.lineFragmentPadding = 0.0
    end
  end

end
