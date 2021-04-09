//
//  Coordinator.swift
//  
//
//  Created by Mike on 30/03/2021.
//

import UIKit

public protocol Coordinator: AnyObject {
    var child: [Coordinator] { get set }
    var parent: Coordinator? { get set }
    var root: UIViewController { get }
}
