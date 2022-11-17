//
//  Presenter.swift
//  PruebaFuncional
//
//  Created by Maximiliano Ovando Ramirez on 16/11/22.
//

import UIKit
 
class HomePresenter {
    var view: HomeViewController?
    var interactor: HomeInteractor?
    var routing: HomeRouting?
 
    init() {
        
    }
    
    public func setupFirebase(){
        interactor?.setupFirebase()
    }
    
    public func updateBackground(color: UIColor){
        view?.updateBackground(color: color)
    }
    
    public func sendImage(name: String, data: Data){
        interactor?.uploadImage(name: name, photo: data)
    }
    
    func notifyUploadImage(isUpload: Bool){
        view?.notifyUploadImage(isUpload: isUpload)
    }
    
    func routeToGraphview(){
        routing?.pushGraphview()
    }

}
