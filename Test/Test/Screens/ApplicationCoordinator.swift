//
//  ApplicationCoordinator.swift
//  Check
//
//  Created by Bruno Wide on 17/12/18.
//  Copyright © 2018 BrunoWide. All rights reserved.
//

import Foundation
import UIKit
import APIKit

final class ApplicationCoordinator: Coordinator {
    
    // MARK: - Properties
    
    var childrenCoordinators: [Coordinator]
    
    private let window: UIWindow
    private let splitViewController: UISplitViewController
    
    private var masterViewController: MasterViewController
    private var detailViewController: DetailViewController
    
    private var masterViewModel: MasterViewModel
    
    init(window: UIWindow) {
        self.window = window
        self.splitViewController = UISplitViewController()
        
        self.masterViewController = MasterViewController()
        self.masterViewModel = MasterViewModel()
        self.detailViewController = DetailViewController()
        
        self.childrenCoordinators = []
    }
    
    func start() {
        masterViewController.viewModel = masterViewModel
        masterViewController.didSelectItem = { [weak self] item in
            self?.showDetail(with: item)
        }

        setupWindow()
    }
    
    // MARK: - Private
    private func showDetail(with item: Repository) {
        detailViewController.viewModel = DetailViewModel(repository: item)
        splitViewController.showDetailViewController(detailViewController, sender: nil)
    }
    
    private func setupWindow() {
        let rootNavigation = UINavigationController(rootViewController: masterViewController)
        
        splitViewController.viewControllers = [rootNavigation]
        
        window.rootViewController = splitViewController
        window.makeKeyAndVisible()
    }
}
