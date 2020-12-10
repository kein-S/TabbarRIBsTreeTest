//
//  Reactive+extension.swift
//  TistoryRIBsExample
//
//  Created by kein.sung on 2020/12/09.
//

import Foundation
import RxSwift
import RxCocoa

extension Reactive where Base: UIButton {
    
    /// Reactive wrapper for `TouchUpInside` control event.
    /// debounce 0.3 sec at main thread
    public var singleTap: Observable<Void> {
        return controlEvent(.touchUpInside).skipDoubleTap
    }
}

extension ObservableType {
    
    var skipDoubleTap: Observable<Element> {
        return throttle(RxTimeInterval.milliseconds(300), scheduler: MainScheduler.instance)
    }
}
