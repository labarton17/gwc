//
//  ViewController.swift
//  ToDoList
//
//  Created by Laura Barton on 1/25/15.
//  Copyright (c) 2015 Laura Barton. All rights reserved.
//

import UIKit

// Declares a class, ViewController, that holds a View and can supply data for and show a table
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    // List of strings that go on the list
    var listItems : Array<NSString> = [];
    
    // The box the user types something into
    // IBOutlet means this variable is an 'interface builder outlet' and it references a UITextField in our storyboard. Notice the little circle on the left; it's filled in to mean that it is connected to an object.
    @IBOutlet weak var textField: UITextField!
    
    // The displayed list of items
    @IBOutlet weak var listTableView: UITableView!
    
    
    
    
    // The function that gets called when the view shows
    override func viewDidLoad()
    {
        // Calls UIViewController's version of viewDidLoad()
        super.viewDidLoad();
        
        // Tells the table view what kind of cells to use
        listTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell");
    }
    
    
    
    
    // This is a function that gets called if the device is running low on memory. It helps your app not to crash in the event that things are running too slowly.
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    // This is the function that gets called when the 'Add' button is tapped
    @IBAction func addItem(sender: AnyObject)
    {
        // Shows you what the text is in the text field
        NSLog("new item: %@", textField.text);
        
        // Add the new text to the list of items
        listItems.append(textField.text);
        
        // Clear the text field out
        textField.text = "";
        
        // Update the table
        listTableView.reloadData();
    }
    
    
    
    
    // This function tells the table how many rows to show
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // We want 1 row for each item in the list
        return listItems.count;
    }
    
    
    
    
    // This function tells the table what to show in each row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        // Get a new cell (the same kind we told the tableview to know in viewDidLoad)
        var cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell;
        
        // Set the text for the item at this index
        // Note: a basic UITableViewCell comes with a label called textLabel
        cell.textLabel?.text = listItems[indexPath.row];
        
        // Return the cell
        return cell;
    }
    
    
    
    
    // This function tells the App what to do when the user taps on a row in the table
    // In this case, we remove the item from the list
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        // Remove the item that's at this index
        listItems.removeAtIndex(indexPath.row);
        
        // Update the table
        listTableView.reloadData();
    }

}

