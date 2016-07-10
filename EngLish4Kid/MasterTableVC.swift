//
//  MasterTableVC.swift
//  EngLish4Kid
//
//  Created by Quan on 7/10/16.
//  Copyright © 2016 MyStudio. All rights reserved.
//

import UIKit

class MasterTableVC: UITableViewController {
    
    var dictData = ["Animals" : "animals.png", "Fruits" : "fruits.png"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dictData.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        var arrayKeys = Array(dictData.keys)
        
        cell.textLabel?.text = arrayKeys[indexPath.row]
        cell.imageView?.image = UIImage(named: dictData[arrayKeys[indexPath.row]]!)
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetailView" {
            
            let detailVC = segue.destinationViewController as! DetailVC
            let selectedRowIndex = self.tableView.indexPathForSelectedRow!
            let selectedCell = self.tableView.cellForRowAtIndexPath(selectedRowIndex)
            
            detailVC.stringTitle = selectedCell?.textLabel?.text
            
        }
    }

    

}
