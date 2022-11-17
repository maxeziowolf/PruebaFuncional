//
//  Entity.swift
//  PruebaFuncional
//
//  Created by Maximiliano Ovando Ramirez on 16/11/22.
//

import FirebaseDatabase

class MainBackground{
    
    var mainScreenColor: String?
    
    init() {}
    
    public func backgroundsFromSnapshot(snapshot: DataSnapshot){
        
        let value = snapshot.value as? NSDictionary
        self.mainScreenColor = value?["mainScreenColor"] as? String ?? ""
        
    }
    
}
