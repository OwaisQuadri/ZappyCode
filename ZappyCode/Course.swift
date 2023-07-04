//
//  Course.swift
//  ZappyCode
//
//  Created by Quadri, Owais on 2023-07-04.
//

import Foundation

class Course: Codable {
    var title = ""
    var subtitle = ""
    var imgURLString = ""

    enum CodingKeys: String, CodingKey {
        case title
        case subtitle
        case imgURLString = "image"
    }
}
