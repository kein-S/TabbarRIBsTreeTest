//
//  MainTabBarRouter.swift
//  TistoryRIBsExample
//
//  Created by kein.sung on 2020/12/09.
//

import RIBs

protocol MainTabBarInteractable: Interactable, HomeListener, FeedListener, PostListener {
    var router: MainTabBarRouting? { get set }
    var listener: MainTabBarListener? { get set }
}

protocol MainTabBarViewControllable: ContainerViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class MainTabBarRouter: ViewableRouter<MainTabBarInteractable, MainTabBarViewControllable>, MainTabBarRouting {

    let homeBuildable: HomeBuildable
    let feedBuildable: FeedBuildable
    
    let postBuildable: PostBuildable
    
    let childRIBs: [Routing] = []
    
    init(interactor: MainTabBarInteractable,
                  viewController: MainTabBarViewControllable,
                  homeBuilder: HomeBuildable,
                  feedBuilder: FeedBuildable,
                  postBuilder: PostBuildable) {
        self.homeBuildable = homeBuilder
        self.feedBuildable = feedBuilder
        self.postBuildable = postBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}

extension MainTabBarRouter {
    func showTab(tab: Tab) {
        switch tab {
        case .home:
            showHome()
        case .feed:
            showFeed()
        default:
            break
        }
    }
    
    func attachPostRIB() {
        let rib = postBuildable.build(withListener: interactor)
        viewController.present(rib: rib, presentationStyle: .pageSheet)
        attachChild(rib)
    }
    
    private func showHome() {
        
        children.forEach { (router) in
            router.interactable.deactivate()
        }
        let addedRIB = children.first(where: { $0 is HomeRouting }) as? ViewableRouting
        let rib: ViewableRouting = addedRIB ?? homeBuildable.build(withListener: interactor)
        if addedRIB == nil {
            attachChild(rib)
        }
        viewController.replace(rib: rib)
        rib.interactable.activate()
        
    }
    
    private func showFeed() {
        children.forEach { (router) in
            router.interactable.deactivate()
        }
        let addedRIB = children.first(where: { $0 is FeedRouting }) as? ViewableRouting
        let rib: ViewableRouting = addedRIB ?? feedBuildable.build(withListener: interactor)
        if addedRIB == nil {
            attachChild(rib)
        }
        viewController.replace(rib: rib)
        rib.interactable.activate()
    }
    
    func detachPostRIB() {
       
        if let rib = children.first(where: { $0 is PostRouting }) as? ViewableRouting {
            rib.viewControllable.dismiss()
            detachChild(rib)
        }
    }
    
}
