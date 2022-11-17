//
//  Interactor.swift
//  PruebaFuncional
//
//  Created by Maximiliano Ovando Ramirez on 16/11/22.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage


class GraphInteractor {
 
    var presenter: GraphPresenter?
    var ref: DatabaseReference?
    let storage = Storage.storage()
    
    init() {
        
    }
    
    func setupFirebase() {
        ref = Database.database().reference()
        
        ref?.child("screenColors").observe(DataEventType.value, with: {[weak self] snapshot in
           
            let background = GraphBackground()
            background.backgroundsFromSnapshot(snapshot: snapshot)
            
            self?.presenter?.updateBackground(color: UIColor(hex: background.graphScreenColor ?? "#FFFFFF") ?? .white)
            
        })
    }
    
    public func  getInformation(){
        Api.getInformation(){[weak self] reponse in
            self?.presenter?.updateInformation(response: reponse)
        }
    }
    
}
