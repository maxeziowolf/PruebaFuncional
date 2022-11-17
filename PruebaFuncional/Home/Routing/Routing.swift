//
//  Routing.swift
//  PruebaFuncional
//
//  Created by Maximiliano Ovando Ramirez on 16/11/22.
//

import UIKit
 
class HomeRouting {
    
    let vc: HomeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
    let presenter = HomePresenter()
    let interactor = HomeInteractor()
    var navigationController: UINavigationController?
    
    init() {
        vc.presenter = presenter
        presenter.view = vc
        presenter.interactor = interactor
        presenter.routing = self
        interactor.presenter = presenter
        navigationController = UINavigationController(rootViewController: vc)
        navigationController?.navigationBar.isHidden = true
    }
    
    func pushGraphview(){
        
        let route = GraphRouting()
        
        navigationController?.navigationBar.isHidden = false
        navigationController?.pushViewController(route.vc, animated: true)
        
    }
    
}
