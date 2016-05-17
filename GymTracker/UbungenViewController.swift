//
//  UbungenViewController.swift
//  GymTracker
//
//  Created by Florian M. on 14/05/16.
//  Copyright © 2016 Florian M. All rights reserved.
//

import UIKit




class UbungenViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {

    
   // MARK: - Poperties
    
    @IBOutlet weak var ubungName: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var idealLabel: UILabel!
    @IBOutlet weak var gewichtLabel: UILabel!
    @IBOutlet weak var ubungBig: UISwitch!
    @IBOutlet weak var idealSlider: UISlider!
    @IBOutlet weak var gewichtSlider: UISlider!
    

    @IBOutlet weak var cancelToUbungen: UIBarButtonItem!
    
    var ubung: Ubung?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - Actions
    
    @IBAction func idealGewichtValChange(sender: AnyObject) {
        
        let idealSliderInt: Int = Int(idealSlider.value)
        
        idealLabel.text = "\(idealSliderInt) kg"
    }
   


    // MARK: - Navigation
     
    @IBAction func cancelToUbungen(segue:UIStoryboardSegue) {
    }
    
    @IBAction func saveUbung(segue:UIStoryboardSegue) {
    }
     
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            let name = ubungName.text ?? ""
            let big = ubungBig.on
            let idealGewicht = Int(idealSlider.value)
        
     // Set the meal to be passed to MealTableViewController after the unwind segue.
            ubung = Ubung(name: name, big: big, idealGewicht: idealGewicht)
        }
 
     }



 

}
