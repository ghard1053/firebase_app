//
//  DataProvider.swift
//  firebase_app
//
//  Created by 水野 隆夫 on 2018/05/23.
//  Copyright © 2018年 pad1053. All rights reserved.
//

import Foundation
import Firebase

class DataProvider {
  static let shared = DataProvider()
  
  private init() {}
  
  lazy var ref: DatabaseReference = {
    return Database.database().reference()
  }()
  
  func getUser(key: String) -> Single<UserEntity> {
    return ref.child("users").child(key).get()
  }
  func getLink(key: String) -> Single<LinkEntity> {
    return ref.child("links").child(key).get()
  }
  func getComments() -> Single<CommentEntity> {
    return ref.child("comments").get()
  }
}
