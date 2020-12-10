//
//  MainTabBarViewController.swift
//  TistoryRIBsExample
//
//  Created by kein.sung on 2020/12/09.
//

import RIBs
import ReactorKit
import UIKit

protocol MainTabBarPresentableListener: class {
    typealias Interactor = MainTabBarInteractor
    var action: ActionSubject<Interactor.Action> { get }
    var currentState: Interactor.State { get }
    var state: Observable<Interactor.State> { get }
}

final class MainTabBarViewController: BaseViewController, MainTabBarPresentable, MainTabBarViewControllable {
    
    weak var listener: MainTabBarPresentableListener?
    
    fileprivate var disposeBag = DisposeBag()
    
    var contentView: UIView {
        return self.mainContentView
    }
    
    @IBOutlet fileprivate weak var mainContentView: UIView!
    @IBOutlet fileprivate weak var btnHome: UIButton!
    @IBOutlet fileprivate weak var btnFeed: UIButton!
    @IBOutlet fileprivate weak var btnPost: UIButton!
    @IBOutlet fileprivate weak var btnNews: UIButton!
    @IBOutlet fileprivate weak var btnBlog: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bind()
    }
    
    private func bind() {
        guard let reactor = self.listener else { return }
        
        self.btnHome.rx.singleTap
            .map { MainTabBarInteractor.Action.tapHome }
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        self.btnFeed.rx.singleTap
            .map { MainTabBarInteractor.Action.tapFeed }
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        self.btnPost.rx.singleTap
            .map { MainTabBarInteractor.Action.tapPost }
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        self.btnNews.rx.singleTap
            .map { MainTabBarInteractor.Action.tapNews }
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        self.btnBlog.rx.singleTap
            .map { MainTabBarInteractor.Action.tapBlog }
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
    }
}
