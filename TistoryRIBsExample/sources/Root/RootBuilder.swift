//
//  RootBuilder.swift
//  TistoryRIBsExample
//
//  Created by kein.sung on 2020/12/09.
//

import RIBs

protocol RootDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

class AppComponent: Component<EmptyDependency>, RootDependency {

    init() {
        super.init(dependency: EmptyComponent())
    }
}

final class RootComponent: Component<RootDependency>, MainTabBarDependency {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol RootBuildable: Buildable {
    func build() -> LaunchRouting
}

final class RootBuilder: Builder<RootDependency>, RootBuildable {

    override init(dependency: RootDependency) {
        super.init(dependency: dependency)
    }

    func build() -> LaunchRouting {
        let component = RootComponent(dependency: dependency)
        let viewController = RootViewController()
        let interactor = RootInteractor(presenter: viewController)
        let mainTabBarBuilder = MainTabBarBuilder(dependency: component)
        return RootRouter(interactor: interactor,
                          viewController: viewController,
                          mainTabBarBuilder: mainTabBarBuilder)
    }
}
