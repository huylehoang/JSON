//
//  ViewController.swift
//  JSON
//
//  Created by LeeX on 7/11/17.
//  Copyright © 2017 LeeX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        var array:[String:Int] = [:]
        let path = Bundle.main.path(forResource: "jsonFile", ofType: "json") as String!
        let resourceData = NSData(contentsOfFile: path!) as NSData!
        if let responeDictionary = try! JSONSerialization.jsonObject(with: resourceData as! Data, options: JSONSerialization.ReadingOptions(rawValue: 0)) as? [String: AnyObject] {
            
            if let categories = responeDictionary["categories"] as? [[String:Any]] {
                for category in categories {
                    print("type - \(category["type"]!)")
                    print("feed - \(category["feed"]!)")
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

