//
//  SettingsViewController.swift
//  tips
//
//  Created by Shuhui Qu on 3/11/15.
//  Copyright (c) 2015 Shuhui Qu. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var initialPercentage: UISegmentedControl!
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var peopleStepper: UIStepper!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        peopleStepper.wraps = true
        peopleStepper.autorepeat = true
        peopleStepper.maximumValue = 20
//        peopleLabel.text =  Int(peopleStepper.value).description
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let percentIndex = defaults.integerForKey("tipPercent")
        peopleStepper.value = Double(defaults.integerForKey("numPeople"))
        let numPeople = defaults.integerForKey("numPeople")
        
        initialPercentage.selectedSegmentIndex = percentIndex
        peopleLabel.text = Int(peopleStepper.value).description

    }
    
    @IBAction func defaultPercentageChange(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let index = initialPercentage.selectedSegmentIndex
        
        defaults.setInteger(index, forKey: "tipPercent")
        defaults.synchronize()

    }

    @IBAction func defaultPeopleChange(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        println(peopleStepper.value)
        peopleLabel.text = Int(peopleStepper.value).description
        let index = Int(peopleStepper.value)
        defaults.setInteger(index, forKey: "numPeople")
        defaults.synchronize()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
