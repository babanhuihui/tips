//
//  ViewController.swift
//  tips
//
//  Created by Shuhui Qu on 3/10/15.
//  Copyright (c) 2015 Shuhui Qu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var peopleHeadLabel: UILabel!
    @IBOutlet weak var avgBillLabel: UILabel!
    
    var people = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        let percentSetting = defaults.integerForKey("tipPercent")
        
        tipControl.selectedSegmentIndex = percentSetting
        
        self.people = defaults.integerForKey("numPeople")
        
        self.onEditingChanged(self)
        
        println("view will appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        println("view did disappear")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func onEditingChanged(sender: AnyObject) {
//        println("User Editing bill")
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount  = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
//        tipLabel.text = "$\(tip)"
//        totalLabel.text = "$\(total)"
        tipLabel.text = String(format:"$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        peopleHeadLabel.text = String(self.people) + "👦"
        var temp = Double(self.people)
        avgBillLabel.text = String(format: "$%.2f", total/temp)

    }

    @IBAction func changeEmoji(sender: AnyObject) {
        
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

