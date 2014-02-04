module TonesControllerAlertViewDelegate

  def alertView(alertView, didDismissWithButtonIndex:buttonIndex)
    if alertView.buttonTitleAtIndex(buttonIndex) == "Continue"
      if alertView.title == "Tone Title"
        Tone.create({title: alertView.textFieldAtIndex(0).text, content: "", created_at: Time.now, updated_at: Time.now, user: User.first})
        cdq.save
        self.tableView.insertRowsAtIndexPaths([NSIndexPath.indexPathForRow(Tone.count, inSection:0)], withRowAnimation:UITableViewRowAnimationTop)
      elsif alertView.title == "Edit Tone Title"
        Tone.all[alertView.tag].title = alertView.textFieldAtIndex(0).text
        Tone.all[alertView.tag].updated_at = Time.now
        cdq.save
        self.tableView.reloadRowsAtIndexPaths([NSIndexPath.indexPathForRow(alertView.tag + 1, inSection:0)], withRowAnimation:UITableViewRowAnimationFade)
      end
    end
  end

end
