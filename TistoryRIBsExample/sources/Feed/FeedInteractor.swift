//
//  FeedInteractor.swift
//  TistoryRIBsExample
//
//  Created by kein.sung on 2020/12/09.
//

import RIBs
import RxSwift

protocol FeedRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol FeedPresentable: Presentable {
    var listener: FeedPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol FeedListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class FeedInteractor: PresentableInteractor<FeedPresentable>, FeedInteractable, FeedPresentableListener {

    weak var router: FeedRouting?
    weak var listener: FeedListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: FeedPresentable) {
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
}
