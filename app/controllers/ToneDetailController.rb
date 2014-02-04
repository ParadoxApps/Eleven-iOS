class ToneDetailController < UIViewController
  attr_accessor :tone

  def initWithTone(tone)
    self.init
    self.tone = tone
    self.title = tone.title
    self
  end

  def viewDidLoad
    self.navigationItem.rightBarButtonItem = editButton
    @toneView = ToneView.alloc.initWithFrame(self.view.frame, andTone:self.tone)
    self.view.addSubview(@toneView)
  end

  def edit
    self.navigationItem.setRightBarButtonItem(saveButton, animated:true)
    @toneView.contentView.editable = true
    @toneView.contentView.becomeFirstResponder
  end

  def save
    self.navigationItem.setRightBarButtonItem(editButton, animated:true)
    @toneView.contentView.resignFirstResponder
    @toneView.contentView.editable = false
    self.tone.content = @toneView.contentView.text
    self.tone.updated_at = Time.now
    cdq.save
    self.navigationController.viewControllers[0].tableView.reloadData
  end

  def editButton
    @editButton ||= UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemEdit, target:self, action:'edit')
  end

  def saveButton
    @saveButton ||= UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemSave, target:self, action:'save')
  end

end
