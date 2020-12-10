//
//  MainTabBarInteractor.swift
//  TistoryRIBsExample
//
//  Created by kein.sung on 2020/12/09.
//

import RIBs
import ReactorKit

protocol MainTabBarRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func showTab(tab: Tab)
    func attachPostRIB()
    func detachPostRIB()
}

protocol MainTabBarPresentable: Presentable {
    var listener: MainTabBarPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol MainTabBarListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

enum Tab: String {
    case home
    case feed
    case news
    case blog
}

final class MainTabBarInteractor: PresentableInteractor<MainTabBarPresentable>, MainTabBarInteractable, MainTabBarPresentableListener, Reactor {
     
    enum Action {
        case tapHome
        case tapFeed
        case tapPost
        case tapNews
        case tapBlog
    }
    
    enum Mutation {
        case showHome
        case showFeed
        case openPost
        case showNews
        case showBlog
    }
    
    struct State {
        var currentTab: Tab = .home
    }
    
    var initialState: State = State()

    weak var router: MainTabBarRouting?
    weak var listener: MainTabBarListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: MainTabBarPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        action.onNext(.tapHome)
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .tapHome:
            return Observable.just(.showHome)
        case .tapFeed:
            return Observable.just(.showFeed)
        case .tapPost:
            return Observable.just(.openPost)
        case .tapNews:
            return Observable.just(.showNews)
        case .tapBlog:
            return Observable.just(.showBlog)
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .showHome:
            newState.currentTab = .home
            router?.showTab(tab: .home)
        case .showFeed:
            newState.currentTab = .feed
            router?.showTab(tab: .feed)
        case .openPost:
            router?.attachPostRIB()
        case .showNews:
            newState.currentTab = .news
            router?.showTab(tab: .news)
        case .showBlog:
            newState.currentTab = .blog
            router?.showTab(tab: .blog)
        }
        return newState
    }
}

extension MainTabBarInteractor {
    func detachPostRIB() {
        router?.detachPostRIB()
    }
}
