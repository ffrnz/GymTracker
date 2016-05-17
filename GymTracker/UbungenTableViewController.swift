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
            let newIndexPath = NSIndexPath(forRow: ubungen.count, inSection: 0)
            ubungen.append(ubung)
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            
        }
            
        
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
