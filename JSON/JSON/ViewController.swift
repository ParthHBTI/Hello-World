//
//  ViewController.swift
//  JSON
//
//  Created by mac on 29/04/16.
//  Copyright © 2016 KloudRac. All rights reserved.
//

import UIKit
import SwiftyJSON
class ViewController: UITableViewController {
 
    var noofRows = 0
    var NamesArray = [String]()
    var AgeArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        parseJSON()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func parseJSON(){
        let path: String = NSBundle.mainBundle().pathForResource("jsonfile", ofType: "json") as String!
        let jsonData = NSData(contentsOfFile: path) as NSData!
        let readableJSON = JSON(data:  jsonData , options:  NSJSONReadingOptions.MutableContainers , error: nil)
        var Name = readableJSON["People"]
         print("\(Name)")
        noofRows = readableJSON["People"].count
        
      
    }
  
     func numberOfRowsInSection(section: Int) -> Int{
        return noofRows
    }
     override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        if NamesArray.count != 0{
            cell.textLabel?.text  = "Array Is Empty"
        }
        else{
            print("Array is empty")
        }
        return cell
    }
}

