//
//  PostViewController.swift
//  TistoryRIBsExample
//
//  Created by kein.sung on 2020/12/09.
//

import RIBs
import RxSwift
import UIKit

protocol PostPresentableListener: class {
    func postViewControllerDismissed()
}

final class PostViewController: BaseViewController, PostPresentable, PostViewControllable {

    weak var listener: PostPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentationController?.delegate = self
    }
}

extension PostViewController: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        listener?.postViewControllerDismissed()
    }
}
