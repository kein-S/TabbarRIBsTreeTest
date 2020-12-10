//
//  BaseViewController.swift
//  TistoryRIBsExample
//
//  Created by kein.sung on 2020/12/09.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    static func create() -> Self {
        let name = String(describing: self)
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: name) as! Self
        return viewController
    }

}
