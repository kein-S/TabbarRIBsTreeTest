//
//  PostInteractor.swift
//  TistoryRIBsExample
//
//  Created by kein.sung on 2020/12/09.
//

import RIBs
import RxSwift

protocol PostRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol PostPresentable: Presentable {
    var listener: PostPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol PostListener: class {
    func detachPostRIB()
}

final class PostInteractor: PresentableInteractor<PostPresentable>, PostInteractable, PostPresentableListener {
    
    weak var router: PostRouting?
    weak var listener: PostListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: PostPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        debugPrint("\(String(describing: self)) did become Active")
    }

    override func willResignActive() {
        super.willResignActive()
        debugPrint("\(String(describing: self)) will Resign Active")
    }
    
    func postViewControllerDismissed() {
        listener?.detachPostRIB()
    }
}

