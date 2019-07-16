//
//  ViewController.swift
//  Swift_JSONSWIFTY
//
//  Created by Apple on 22/06/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         let file=Bundle.main.path(forResource: "SwiftyJSONTests", ofType: "json")!
     //   print("JSONAPIPath:\(file)")
        var dataform = try! Data(contentsOf: URL(fileURLWithPath: file))
        var jsondata=try! JSON(data: dataform)
        print("Jsondata:\(jsondata[0]["user"]["entities"].count)")
    jsonParser()
        
    }
    func jsonParser() {
        let url = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, res, err) in
            
            if let d = data {
                if let value = String(data: d, encoding: String.Encoding.ascii) {
                    
                    if let jsonData = value.data(using: String.Encoding.utf8) {
                        do {
                            let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: Any]
                            
                            if let arr = json["rows"] as? [[String: Any]] {
                                debugPrint(arr)
                            }
                            
                        } catch {
                            NSLog("ERROR \(error.localizedDescription)")
                        }
                    }
                }
                
            }
            }.resume()
    }

}

