//
//  RefreshTableView.swift
//  Blip
//
//  Created by Nikolay Derkach on 3/24/17.
//  Copyright © 2017 BlipMe. All rights reserved.
//

import Foundation
import PullToRefresh

class RefreshTableView: UIView {

}

class RefreshAnimator: RefreshViewAnimator {
    private let refreshView: RefreshTableView

    init(refreshView: RefreshTableView) {
        self.refreshView = refreshView
    }

    func animate(_ state: State) {
        switch state {
        default:
            break
        }
    }
}

class AwesomePullToRefresh: PullToRefresh {
    public convenience init(backgroundColor: UIColor) {
        let refreshView = Bundle.main.loadNibNamed("CustomView", owner: nil, options: nil)!.first as! RefreshTableView
        refreshView.backgroundColor = backgroundColor
        let animator = RefreshAnimator(refreshView: refreshView)
        self.init(refreshView: refreshView, animator: animator, height: refreshView.frame.size.height, position: .top)
    }
}
