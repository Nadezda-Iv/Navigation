//
//  Setupable.swift
//  Navigation
//
//  Created by NADEZDA IVANOVA on 17.03.2022.
//

import Foundation

protocol PostViewModelProtocol {}

protocol Setupable {
    func setup(with postviewModel: PostViewModelProtocol)
}

protocol ChangeLikesDelegate: AnyObject {
    func likesChanged()
}
