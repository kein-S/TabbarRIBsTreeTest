//
//  RIBs+extension.swift
//  TistoryRIBsExample
//
//  Created by kein.sung on 2020/12/09.
//

import Foundation
import UIKit
import RIBs
import Hero

extension ViewControllable {
    
    func present(rib: ViewableRouting, animated: Bool = true, presentationStyle: UIModalPresentationStyle? = nil) {
        let vc = rib.viewControllable.uiviewController
        if let presentationStyle = presentationStyle {
            vc.modalPresentationStyle = presentationStyle
        }
        uiviewController.present(vc, animated: true, completion: nil)
    }
    
    func dismiss() {
        uiviewController.hero.isEnabled = true
        uiviewController.hero.dismissViewController()
    }
    
}

protocol ContainerViewControllable: ViewControllable {
    var contentView: UIView { get }
    func replace(rib: ViewableRouting)
}

extension ContainerViewControllable {
    
    func replace(rib: ViewableRouting) {
        contentView.subviews.forEach { $0.removeFromSuperview() }
        let vc = rib.viewControllable.uiviewController
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
    }
    
}
