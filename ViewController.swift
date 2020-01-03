//
//  ViewController.swift
//  fireBaseSwift_Pratibha
//
//  Created by Felix-ITS 004 on 19/08/19.
//  Copyright © 2019 hrishi. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController {
    var ref: DatabaseReference!
    var courseDic = NSMutableDictionary()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        FirebaseApp.configure()
    }

    @IBOutlet var courseNameText: UITextField!
    
    
    
    @IBOutlet var durationText: UITextField!
    
    
    @IBOutlet var YearText: UITextField!
    
    @IBOutlet var others: UITextField!
    
    @IBAction func button(_ sender: UIButton) {
        ref = Database.database().reference()
        courseDic.setValue(courseNameText.text, forKey: "courseName")
       courseDic.setValue(durationText.text, forKey: "duration")
        courseDic.setValue(YearText.text, forKey: "Year")
        ref.child("Courses").childByAutoId().setValue(courseDic) { (error, reference) in
            if (error != nil)
                {
                    print("failed to insert:\(error?.localizedDescription)")
            }
        
            else{
                print("insert: Success")
            }
        
    }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

