//
//  UbungenTableViewController.swift
//  GymTracker
//
//  Created by Florian M. on 14/05/16.
//  Copyright © 2016 Florian M. All rights reserved.
//

import UIKit

class UbungenTableViewController: UITableViewController {
    
    @IBOutlet weak var CancelToTagTableView: UIBarButtonItem!
    
    var ubungen = [Ubung]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load Sample Übungen
        
        loadSampleUbungen()
    }
    
    func loadSampleUbungen() {
        let ubung1 = Ubung(name: "Kniebeugen", big: true, idealGewicht: 90)!
        let ubung2 = Ubung(name: "Kreuzheben", big: true, idealGewicht: 90)!
        ubungen += [ubung1, ubung2]
    }

   
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ubungen.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      
        let cellIdentifer = "UbungenTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifer, forIndexPath: indexPath) as! UbungenTableViewCell
        
        
        
        let ubung = ubungen[indexPath.row]

        // Configure the cell...
        
        cell.nameLabel.text = ubung.name
        
    

        return cell
    }
 
    
    // MARK: - Navigation
    
    @IBAction func cancelToUbungenTableView(segue:UIStoryboardSegue) {
    }
    @IBAction func saveToUbungenTableView(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? UbungenViewController, ubung = sourceViewController.ubung {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing ubung. ??????????????????????????
                ubungen[selectedIndexPath.row] = ubung
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            }
            else {
            
            let newIndexPath = NSIndexPath(forRow: ubungen.count, inSection: 0)
            ubungen.append(ubung)
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
        }
            
        
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 


    // Override to support editing the table view.
 override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {

    }
    
 
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let deleteClosure = { (action: UITableViewRowAction!, indexPath: NSIndexPath!) -> Void in
            
            tableView.editing = true
            
            self.ubungen.removeAtIndex(indexPath.row)
        
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
        
        let editClosure = { (action: UITableViewRowAction!, indexPath: NSIndexPath!) -> Void in
            
            
            self.performSegueWithIdentifier("ShowDetail", sender: indexPath)
        }
        
        let deleteAction = UITableViewRowAction(style: .Default, title: "Delete", handler: deleteClosure)
        
        let editAction = UITableViewRowAction(style: .Normal, title: "Edit", handler: editClosure)
        
        return [deleteAction, editAction]

        
        
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        
        if cell!.selected
        {
            cell!.selected = false
            if cell!.accessoryType == UITableViewCellAccessoryType.None
            {
                cell!.accessoryType = UITableViewCellAccessoryType.Checkmark
            }
            else
            {
                cell!.accessoryType = UITableViewCellAccessoryType.None
            }
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ShowDetail" {
            let ubungDetailViewController = segue.destinationViewController as! UbungenViewController
            if let selectedUbungCell = sender as? NSIndexPath {
                let selectedUbung = ubungen[selectedUbungCell.row]
                ubungDetailViewController.ubung = selectedUbung
            }
        }
        else if segue.identifier == "AddItem" {
            
        }
    }
   
    
    

}
