//
//  HomeViewController.swift
//  TistoryRIBsExample
//
//  Created by kein.sung on 2020/12/09.
//

import RIBs
import RxSwift
import UIKit

protocol HomePresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class HomeViewController: BaseViewController, HomePresentable, HomeViewControllable {

    weak var listener: HomePresentableListener?
}
