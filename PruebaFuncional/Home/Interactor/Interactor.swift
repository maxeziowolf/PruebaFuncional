//
//  Interactor.swift
//  PruebaFuncional
//
//  Created by Maximiliano Ovando Ramirez on 16/11/22.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage


class HomeInteractor {
 
    var presenter: HomePresenter?
    var ref: DatabaseReference?
    let storage = Storage.storage()
    
    init() {
        
    }
    
    func setupFirebase() {
        ref = Database.database().reference()
        
        ref?.child("screenColors").observe(DataEventType.value, with: {[weak self] snapshot in
           
            let background = MainBackground()
            background.backgroundsFromSnapshot(snapshot: snapshot)
            
            self?.presenter?.updateBackground(color: UIColor(hex: background.mainScreenColor ?? "#FFFFFF") ?? .white)
            
        })
    }
    
    func uploadImage(name: String, photo: Data){
        
        let storageRef = storage.reference()
        
        let riversRef = storageRef.child("images/\(name)-\(Date().getCurrentDateString()).jpg")

        riversRef.putData(photo, metadata: nil){[weak self] (metadata, error) in
            
            guard let metadata = metadata else {
                self?.presenter?.notifyUploadImage(isUpload: false)
                return

            }

            self?.presenter?.notifyUploadImage(isUpload: true)
        }
    }
    
}
