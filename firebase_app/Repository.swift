//
//  Repository.swift
//  firebase_app
//
//  Created by 水野 隆夫 on 2018/05/23.
//  Copyright © 2018年 pad1053. All rights reserved.
//

import Foundation
import Firebase

struct UserRepository {
  let dataStore: UserDataStore
  
  func get(userId: String) -> Single<UserEntity> {
    return dataStore.get(key: userId)
  }
}

struct UserDataStore {
  let provider = DataProvider.shared
  
  func get(key: String) -> Single<UserEntity> {
    return provider.getUser(key: key)
  }
}
