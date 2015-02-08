//
//  ViewController.swift
//  ToDoList
//
//  Created by Laura Barton on 1/25/15.
//  Copyright (c) 2015 Laura Barton. All rights reserved.
//

import UIKit

// Declares a class, ViewController, that holds a View
class ViewController: UIViewController
{
    // This will be the new item to be used in TableViewController
    var newItem : String = "";
    
    // The 'Done' button
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    // The box the user types something into
    @IBOutlet weak var textField: UITextField!
    
    
    // This function occurs right when the view controller is about to close and go back to the tableview controller - this is where we want to save the new item
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        // If we didn't click Done, don't do this
        if(sender as? NSObject != self.doneButton)
        {
            return;
        }
        
        // Check for text in the text field
        if(textField.text.utf16Count > 0)
        {
            // Save the text
            newItem = textField.text;
        }
    }
    
    
    // This function just dismisses the keyboard if the user taps the background of the app
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent)
    {
        self.view.endEditing(true);
    }
}

