//
//  News.swift
//  Navigation
//
//  Created by NADEZDA IVANOVA on 15.03.2022.
//

import Foundation


struct News: Decodable {

    
    struct Article: Decodable {
        let author, description, image, likes, views : String

      

        enum CodingKeys: String, CodingKey {
            case author, description, image, likes, views
        }
    }

    let articles: [Article]
}
