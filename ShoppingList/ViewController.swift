//
//  ViewController.swift
//  ShoppingList
//
//  Created by M on 2/6/16.
//  Copyright © 2016 August Moon. All rights reserved.
//

import UIKit

var myItemList = [String]()
var myQuantityList = [String]()

class ViewController: UIViewController {
    @IBOutlet weak var descriptionText: UITextField!
    @IBOutlet weak var quantityText: UITextField!
    
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet weak var textView: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.text = "No items"
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    class Validation {
        static func isStringNumerical(string : String) -> Bool {
            // Only allow numbers. Look for anything not a number.
            let range = string.rangeOfCharacterFromSet(NSCharacterSet.decimalDigitCharacterSet().invertedSet)
            return (range == nil)
        }
    }
    
    
    @IBAction func addItemButton(sender: UIButton) {
        if (descriptionText.text?.characters.count > 0 &&
            quantityText.text?.characters.count > 0 &&
            (Validation.isStringNumerical(quantityText.text!) == true)){
                myItemList.append(descriptionText.text!)
                myQuantityList.append(quantityText.text!)
                descriptionText.text = ""
                quantityText.text = ""
                var text = ""
                var quantity = ""
                for index in 0..<myItemList.count {
                    quantity += myQuantityList[index]
                    text += "\(myQuantityList[index] + "x " + myItemList[index])\n"
                    }
                textView.text = text
        } else {
            let title = "Invalid Input"
            let alertController =
            UIAlertController(title: title,
                message: "You have entered an invalid input. Please try again.",
                preferredStyle: .Alert)
            
            // Create the action.
            let cancelAction =
            UIAlertAction(title: "OK",
                style: .Cancel,
                handler: nil)
            alertController.addAction(cancelAction)
            presentViewController(alertController,
                animated: true,
                completion: nil)
        }
    }
    
   
    @IBAction func doneEditing(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    @IBAction func backgroundTouch(sender: UIControl) {
        for tf in textFields {
            tf.resignFirstResponder()
        }
        textView.resignFirstResponder()
    }
    

    @IBAction func newListClear(sender: AnyObject) {
        for tf in textFields {
            tf.text = ""
        }
        textView.text = ""
        myItemList.removeAll()
        myQuantityList.removeAll()
        viewDidLoad()
    }
    
    @IBAction func pressNewItemButton(sender: UIButton) {
        for tf in textFields {
            tf.text = ""
        }
    }
}

