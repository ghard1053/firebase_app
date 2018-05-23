//
//  UseCase.swift
//  firebase_app
//
//  Created by 水野 隆夫 on 2018/05/23.
//  Copyright © 2018年 pad1053. All rights reserved.
//

import Foundation

struct UseCase {
  let commentsRepository: CommentRepository
  let usersRepository: UserRepository
  let linkRepository: LinkRepository
  
  func getComments() -> Single<[CommentModel]> {
    return commentsRepository.get().map { (comment) -> [CommentModel] in
      let link = self.getLink(linkId: comment.link)
      let author = self.getUser(userId: comment.author)
      return Single<(LinkModel, UserModel)>.zip(link, author) {
        ($0, $1)
      }.map(translator: CommentTranslator())
    }
  }
}
