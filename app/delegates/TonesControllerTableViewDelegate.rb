module TonesControllerTableViewDelegate

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated:true)

    if indexPath.row == 0
      alert = UIAlertView.alloc.initWithTitle("Tone Title", message:"Enter a title for your tone", delegate:self, cancelButtonTitle:"Cancel", otherButtonTitles:"Continue", nil)
      alert.alertViewStyle = UIAlertViewStylePlainTextInput
      alert.show
    else
      self.navigationController.pushViewController(ToneDetailController.alloc.initWithTone(Tone.all[indexPath.row - 1]), animated:true)
    end
  end

  def tableView(tableView, accessoryButtonTappedForRowWithIndexPath:indexPath)
    alert = UIAlertView.alloc.initWithTitle("Edit Tone Title", message:"Enter a title for your tone", delegate:self, cancelButtonTitle:"Cancel", otherButtonTitles:"Continue", nil)
    alert.tag = indexPath.row - 1
    alert.alertViewStyle = UIAlertViewStylePlainTextInput
    alert.textFieldAtIndex(0).text = Tone.all[indexPath.row - 1].title
    alert.show
  end

end
