//
//  Presenter.swift
//  PruebaFuncional
//
//  Created by Maximiliano Ovando Ramirez on 16/11/22.
//

import Foundation

import UIKit
 
class GraphPresenter {
    var view: GraphViewController?
    var interactor: GraphInteractor?
    var routing: GraphRouting?
 
    init() {
        
    }
    
    public func setupFirebase(){
        interactor?.setupFirebase()
    }
    
    public func updateBackground(color: UIColor){
        view?.updateBackground(color: color)
    }
    
    public func  getInformation(){
        interactor?.getInformation()
    }
    
    public func updateInformation(response: InformationAPI?){
        view?.updateInformation(response: response)
    }

}
