//
//  Routing.swift
//  PruebaFuncional
//
//  Created by Maximiliano Ovando Ramirez on 16/11/22.
//

import UIKit
 
class GraphRouting {
    
    let vc: GraphViewController =  GraphViewController(nibName: "GraphViewController", bundle: nil)
    let presenter = GraphPresenter()
    let interactor = GraphInteractor()
    
    init() {
        vc.presenter = presenter
        presenter.view = vc
        presenter.interactor = interactor
        presenter.routing = self
        interactor.presenter = presenter
    }
    
}

