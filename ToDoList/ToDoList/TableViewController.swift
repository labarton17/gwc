//
//  TableViewController.swift
//  ToDoList
//
//  Created by Laura Barton on 2/8/15.
//  Copyright (c) 2015 Laura Barton. All rights reserved.
//

import UIKit

// This is a class, TableViewController, that operates as a custom UITableViewController
class TableViewController : UITableViewController
{
    // List of strings that go in the list
    var listItems : Array<NSString> = [];
    
    
    // This function tells the table how many rows to show
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // We want 1 row for each item in the list
        return listItems.count;
    }
    
    
    // This function tells the table what to show in each row
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        // Get a new cell (the same kind we told the tableview to know in viewDidLoad)
        var cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("ToDoCell") as UITableViewCell;
        
        // Set the text for the item at this index
        // Note: a basic UITableViewCell comes with a label called textLabel
        cell.textLabel?.text = listItems[indexPath.row];
        
        // Return the cell
        return cell;
    }
    
    
    // This function tells the App what to do when the user taps on a row in the table
    // In this case, we remove the item from the list
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        // Remove the item that's at this index
        listItems.removeAtIndex(indexPath.row);
        
        // Update the table
        tableView.reloadData();
    }
    
    
    // This function gets called when the Cancel button is pushed in the Add Item view
    @IBAction func cancel(segue: UIStoryboardSegue)
    {
        
    }
    
    
    // This function gets called when the Done button is pushed
    @IBAction func saveItem(segue: UIStoryboardSegue)
    {
        // When we tap 'Done', we want to save the new item to the list
        
        // sourceViewController tells us which view controller we are coming from. Since this is always ViewController, we can cast it to that
        var viewController : ViewController = segue.sourceViewController as ViewController;
        
        // Make sure there's something actually saved
        if(viewController.newItem.utf16Count > 0)
        {
            // Add the new text to the list of items
            listItems.append(viewController.newItem);
            
            // Reload the table
            self.tableView.reloadData();
        }
    }
}
