//
//  ViewController.swift
//  TaskList
//
//  Created by Laura Barton on 1/25/15.
//  Copyright (c) 2015 Laura Barton. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var table: UITableView!

    var list : Array<String> = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        table.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell");
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTapAddButton(sender: AnyObject) {
        list.append(textField.text);
        
        NSLog("list: %@", list);
        
        table.reloadData();
        
        textField.text = "";
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count;
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : UITableViewCell = table.dequeueReusableCellWithIdentifier("cell") as UITableViewCell;
        
        cell.textLabel?.text = list[indexPath.row];
        
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        list.removeAtIndex(indexPath.row);
        
        table.reloadData();
    }
}

