//
//  AppCoordinator.swift
//  xkcd
//
//  Created by Galileo Guzman on 15/03/22.
//


import UIKit
import Foundation

class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    
    private let navigationController = UINavigationController()

    // MARK: - Public API
    
    var rootViewController: UIViewController {
        return navigationController
    }

    // MARK: - Overrides
    
    override func start() {
        // Set Navigation Controller Delegate
        navigationController.delegate = self
        
        // Show Cantineros
        showHomeController()
    }
    
    // MARK: -
    
    override func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        childCoordinators.forEach { (childCoordinator) in
            childCoordinator.navigationController(navigationController, willShow: viewController, animated: animated)
        }
    }
    
    override func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        childCoordinators.forEach { (childCoordinator) in
            childCoordinator.navigationController(navigationController, didShow: viewController, animated: animated)
        }
    }

    // MARK: - Helper Methods
    func showHomeController() {
        // Getting view controller (the screen to show)
        let comicsVC = ComicsViewController.instantiate()
        
        // Dependencies for the view controller
        let dataRepository = ComicsRepository()
        let comicsViewmodel = ComicsViewModel(dataRepository: dataRepository)
        comicsVC.viewModel = comicsViewmodel
        
        // Install Handlers
        comicsVC.didSelectComic = {[weak self] (comic) in
            self?.showComic(comic)
        }
        
        // Using navigation controller for showing the vc
        navigationController.pushViewController(comicsVC, animated: true)
    }
    
    private func showComic(_ comic: ComicPresentable) {
        // Initialize Detail ViewController
        let detailVC = ComicDetailViewController.instantiate()
        
        // Configure Detail View Controller
        let viewModel = ComicDetailViewModel(presentable: comic)
        detailVC.viewModel = viewModel
        
        // Navigation handlers
        
        // Push Cantinero Detail View Controller Onto Navigation Stack
        navigationController.pushViewController(detailVC, animated: true)
    }
    
    
}
