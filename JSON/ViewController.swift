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
            var allDictionaries:[[String:AnyObject]] = []
            for (key,value)in responeDictionary {
                let dictionary = [key:value]
                allDictionaries.append(dictionary)
            }
            allDictionaries.remove(at: 2)
            
            for item in allDictionaries {
                for (key,value) in item {
                    print("\(key) - \(value)")
                }
            }
            
            if let users = responeDictionary["users"] as? [[String:Any]] {
                for user in users {
//                    if let name = user["name"] as? String, let age = user["age"] as? Int {
//                        array[name] = age
//                    }
                    for (key,value) in user {
                        print("\(key) - \(value)")
                    }
                }
            }
        }
//        for (key,value) in array {
//            print("\(key) - \(value)")
//        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

