//
//  RootRouter.swift
//  TistoryRIBsExample
//
//  Created by kein.sung on 2020/12/09.
//

import RIBs

protocol RootInteractable: Interactable, MainTabBarListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {
    
    fileprivate let mainTabBarBuildable: MainTabBarBuildable
    
    init(interactor: RootInteractable,
                  viewController: RootViewControllable,
                  mainTabBarBuilder: MainTabBarBuildable) {
        self.mainTabBarBuildable = mainTabBarBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}

extension RootRouter {
    func appStart() {
        //mainTabBar
        let mainTabBarRIB = mainTabBarBuildable.build(withListener: interactor)
        viewControllable.present(rib: mainTabBarRIB, presentationStyle: .fullScreen)
        attachChild(mainTabBarRIB)
    }
}
