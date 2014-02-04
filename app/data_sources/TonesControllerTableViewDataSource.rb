module TonesControllerTableViewDataSource

  def tableView(tableView, numberOfRowsInSection:section)
    Tone.count + 1
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    if indexPath.row == 0
      cell = tableView.dequeueReusableCellWithIdentifier("NewToneCell") || begin
        UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:"NewToneCell")
      end

      cell.textLabel.text = "Create a new tone"
    else
      @reuseIdentifier ||= "ToneCell"

      cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
        UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:@reuseIdentifier)
      end

      cell.textLabel.text = Tone.all[indexPath.row - 1].title
      cell.detailTextLabel.text = Tone.all[indexPath.row - 1].content
      cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton
    end

    cell
  end

  def tableView(tableView, canEditRowAtIndexPath:indexPath)
    indexPath.row != 0
  end

  def tableView(tableView, commitEditingStyle:editingStyle, forRowAtIndexPath:indexPath)
    Tone.all[indexPath.row - 1].destroy
    cdq.save
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation:UITableViewRowAnimationBottom)
  end

end
