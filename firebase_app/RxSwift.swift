//
//  RxSwift.swift
//  firebase_app
//
//  Created by 水野 隆夫 on 2018/05/23.
//  Copyright © 2018年 pad1053. All rights reserved.
//

import Foundation
import Firebase

extension DatabaseReference {
  func get<T: Entity>() -> Single<T> {
    return Single.create(subscribe: { (observer) in
      self.observerSingleEvent(of: .value, with: { (snapshot) in
        guard let json = snapshot.value else {
          observer(.error(ProviderError.valueNotExist))
          return
        }
        do {
          let data = try JSONSerialization.data(withJSONObject: json)
          let entity = try JSONDecoder().decode(T.self, from: data)
          observer(.success(entity))
        } catch(let error) {
          observer(.error(error))
        }
      })
      return Disposables.create()
    })
  }
}
