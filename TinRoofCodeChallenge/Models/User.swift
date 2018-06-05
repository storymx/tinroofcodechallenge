//
//  User.swift
//  TinRoofCodeChallenge
//
//  Created by Gabriel Perez on 5/22/18.
//  Copyright © 2018 Gabriel Jaramillo. All rights reserved.
//

import Foundation

struct User {
    let userId: Int
    var posts: [UserPost]
    var complete: Int
    var incomplete: Int
}
