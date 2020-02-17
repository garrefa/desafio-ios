//
//  Coordinator.swift
//  Check
//
//  Created by Bruno Wide on 17/12/18.
//  Copyright © 2018 BrunoWide. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    var childrenCoordinators: [Coordinator] { get set }
    
    func addChild(coordinator: Coordinator)
    func releaseChild(coordinator: Coordinator)
    
    func start()
}

extension Coordinator {
    func addChild(coordinator: Coordinator) {
        childrenCoordinators.append(coordinator)
    }
    
    func releaseChild(coordinator: Coordinator) {
        childrenCoordinators.removeAll { coordinator === $0 }
    }
}

extension Coordinator {
    func setupAppearance(_ presenter: UINavigationController) {
        presenter.navigationBar.setBackgroundImage(UIImage(), for: .default)
        presenter.navigationBar.shadowImage = UIImage()
        presenter.navigationBar.isTranslucent = true
    }
}

protocol CoordinatorDelegate: class {
    func shouldReleaseCoordinator(_ coordinator: Coordinator)
}
