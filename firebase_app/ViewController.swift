//
//  ViewController.swift
//  firebase_app
//
//  Created by 水野 隆夫 on 2018/05/22.
//  Copyright © 2018年 pad1053. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func database() {
    
    var ref: DatabaseReference! = Database.database().reference()
    self.ref.child("users").child("user1").setValue(["name": "Alice"])
    
    refHandle1 = ref.observe(.value, with: { (snapshot) in
      let postDict = snapshot.value as? [String: Any] ?? [:]
    })
    refHandle2 = ref.child("user").observe(.value, with: { (snapshot) in
      let user = snapshot.value as? [String: Any] ?? [:]
    })
    
    ref.child("user").observeSingleEvent(.value, with: { (snapshot) in
      let user = snapshot.value as? [String: Any] ?? [:]
    })

  }
  
  func keepSynced() {
    lazy var realtimeRef: DatabaseReference = {
      let ref = Database.database().reference(withPath: "favorites")
      ref.keepSynced(true)
      return ref
    }()
  }

}

