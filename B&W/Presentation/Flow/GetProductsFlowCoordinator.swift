//
//  GetProductsFlowCoordinator.swift
//  B&W
//
//  Created by Dalia on 18/09/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import UIKit

protocol GetProductsFlowCoordinatorDependencies {
    func makeProductsListViewController(actions: ProductsListViewModelActions) -> ProductsListViewController
    func makeProductDetailsViewController(product: Product) -> ProductDetailsViewController
    func makeOccasionsViewController() -> OccasionsViewController
}

final class GetProductsFlowCoordinator {

    private weak var tabBarController: UITabBarController?
    private weak var navigationController: UINavigationController?
    private let dependencies: GetProductsFlowCoordinatorDependencies

    private weak var productsListVC: ProductsListViewController?

    init(tabBarController: UITabBarController,
         navigationController: UINavigationController,
         dependencies: GetProductsFlowCoordinatorDependencies) {
        self.tabBarController = tabBarController
        self.navigationController = navigationController
        self.dependencies = dependencies
    }

    func start() {
        let actions = ProductsListViewModelActions(showProductDetails: showProductDetails)
        let shopVC = dependencies.makeProductsListViewController(actions: actions)

        let occasionsVC = dependencies.makeOccasionsViewController()

        tabBarController?.viewControllers = [shopVC, occasionsVC]
        productsListVC = shopVC
    }

    private func showProductDetails(product: Product) {
        let vc = dependencies.makeProductDetailsViewController(product: product)
        navigationController?.pushViewController(vc, animated: true)
    }
}
