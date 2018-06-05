//
//  Post.swift
//  TinRoofCodeChallenge
//
//  Created by Gabriel Perez on 5/22/18.
//  Copyright © 2018 Gabriel Jaramillo. All rights reserved.
//

import Foundation
struct Post:Decodable{
    let userId: Int?
    let id: Int?
    let title: String?
    let completed: Bool?
}
