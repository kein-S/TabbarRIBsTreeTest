//
//  MainTabBarBuilder.swift
//  TistoryRIBsExample
//
//  Created by kein.sung on 2020/12/09.
//

import RIBs

protocol MainTabBarDependency: Dependency {

}

final class MainTabBarComponent: Component<MainTabBarDependency>, HomeDependency, FeedDependency, PostDependency {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol MainTabBarBuildable: Buildable {
    func build(withListener listener: MainTabBarListener) -> MainTabBarRouting
}

final class MainTabBarBuilder: Builder<MainTabBarDependency>, MainTabBarBuildable {

    override init(dependency: MainTabBarDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: MainTabBarListener) -> MainTabBarRouting {
        let component = MainTabBarComponent(dependency: dependency)
        let viewController = MainTabBarViewController.create()
        let interactor = MainTabBarInteractor(presenter: viewController)
        interactor.listener = listener
        let homeBuilder = HomeBuilder(dependency: component)
        let feedBuilder = FeedBuilder(dependency: component)
        let postBuilder = PostBuilder(dependency: component)
        return MainTabBarRouter(interactor: interactor,
                                viewController: viewController,
                                homeBuilder: homeBuilder,
                                feedBuilder: feedBuilder,
                                postBuilder: postBuilder)
    }
}
