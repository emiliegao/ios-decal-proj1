//
//  ViewController.swift
//  To Do List
//
//  Created by Emilie Gao on 2/23/16.
//  Copyright © 2016 Emilie Gao. All rights reserved.
//

import UIKit

var toDoItems:[String] = []
var toDoChecked:[Bool] = []
var unixTimeCreated:[Double] = []

class MasterViewController: UITableViewController {
    
    override func viewDidAppear(animated: Bool) {
        var count = unixTimeCreated.count
        for var i = 0; i < count - 1; i++ {
            if (unixTimeCreated[i] != 0.0 && NSDate.timeIntervalSinceReferenceDate() - unixTimeCreated[i] > 86400 ) {
                toDoItems.removeAtIndex(i)
                toDoChecked.removeAtIndex(i)
                unixTimeCreated.removeAtIndex(i)
                i--
            }
            count = unixTimeCreated.count
        }
        
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToMasterViewController(segue: UIStoryboardSegue) {
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell

        
        let toDoItem:String = toDoItems[indexPath.row]
        let checked:Bool = toDoChecked[indexPath.row]
        
        cell.textLabel?.text = toDoItem
        
        if (checked == true) {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        //click trash: 1. removes object from dictionary 2. deletes row
        let trash = UITableViewRowAction(style: .Normal, title: "Trash") {action, index in
            toDoItems.removeAtIndex(indexPath.row)
            toDoChecked.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            tableView.reloadData()
        }
        trash.backgroundColor = UIColor.redColor()
        
        //click done and slide back with check mark
        let done = UITableViewRowAction(style: .Normal, title: "Done") { action, index in
            toDoChecked[indexPath.row] = true
            unixTimeCreated[indexPath.row] = (NSDate.timeIntervalSinceReferenceDate())
            tableView.reloadData()
        }
        done.backgroundColor = UIColor.lightGrayColor()
                
        return [trash, done]
    }
}

