//
//  DetailVC.swift
//  EngLish4Kid
//
//  Created by Quan on 7/10/16.
//  Copyright © 2016 MyStudio. All rights reserved.
//

import UIKit

class DetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var stringTitle : String!
    var dictData : NSDictionary!
    var arrayKeys : NSArray!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        creatDatawithName(stringTitle)
        self.title = stringTitle
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayKeys.count
    }
    
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let key = arrayKeys[indexPath.row] as! String
        cell.textLabel?.text = key
        cell.imageView?.image = UIImage(named: "\(dictData[key]!)")
        return cell
        
    }
    
    func creatDatawithName(title : String) {
        var path : String = ""
        
        if title == "Fruits" {
            path = NSBundle.mainBundle().pathForResource("FruitsList", ofType: "plist")!
        }
        if title == "Animals" {
            path = NSBundle.mainBundle().pathForResource("AnimalsList", ofType: "plist")!
        }
        
        dictData = NSDictionary(contentsOfFile: path)!
        
        arrayKeys = dictData.allKeys
        
        arrayKeys = arrayKeys.sortedArrayUsingSelector("compare:")
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let ViewShowInfo = self.storyboard?.instantiateViewControllerWithIdentifier("ViewShowInfo")
        ViewShowInfo?.title = arrayKeys[indexPath.row] as! String
        self.navigationController?.pushViewController(ViewShowInfo!, animated: true)
    }
    

}
