//
//  DailyStatsViewController.swift
//  To Do List
//
//  Created by Emilie Gao on 3/1/16.
//  Copyright © 2016 Emilie Gao. All rights reserved.
//

import UIKit

class DailyStatsViewController: UITableViewController {
    var numCompleted = 0
    var complete:[String] = []

    override func viewDidAppear(animated: Bool) {
        for var i = 0; i < toDoChecked.count; i++ {
            if (toDoChecked[i] == true) {
                numCompleted++
                complete.append(toDoItems[i])
            }
        }
        print(complete)
        self.tableView.reloadData()
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        return numCompleted + 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell

        if (indexPath.row == 0) {
            cell.textLabel?.text = "Items Completed:" + String(numCompleted)
        } else {
            cell.textLabel?.text = complete[indexPath.row - 1]
        }
        return cell
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
