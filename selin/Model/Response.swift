//
//  JsonParse.swift
//  selin
//
//  Created by Selin Ersev on 23.07.2018.
//  Copyright © 2018 Selin Ersev. All rights reserved.
//

import UIKit
struct JSON: Codable {
    let feed: Feed
}
struct Feed: Codable {
    let entry: [EntryRow]
}
struct EntryRow: Codable{
    let author: Author?
    let rating: Label?
    let title: Label?
    let content: Label?
    let name: Label?
    let image: [Label]?
    let link: Link?
    let category: Category?
    
    enum CodingKeys: String, CodingKey {
        case rating = "im:rating"
        case title = "title"
        case content = "content"
        case author = "author"
        case name = "im:name"
        case image = "im:image"
        case link = "link"
        case category = "category"
    }
}

struct Category: Codable {
    let attributes: CategoryAttributes?
}
struct CategoryAttributes: Codable {
    let label: String?
    let term: String?
}
struct Author: Codable {
    let name: Label?
}

struct Link: Codable {
    let attributes: Attributes
}

struct Label: Codable{
    let label: String
}
struct Href: Codable {
    let href: String
}
struct Attributes: Codable{
    let href : String
}
