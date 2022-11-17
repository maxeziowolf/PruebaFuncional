//
//  Entity.swift
//  PruebaFuncional
//
//  Created by Maximiliano Ovando Ramirez on 16/11/22.
//

import Foundation
import FirebaseDatabase

class GraphBackground{
    
    var graphScreenColor: String?
    
    init() {}
    
    public func backgroundsFromSnapshot(snapshot: DataSnapshot){
        
        let value = snapshot.value as? NSDictionary
        self.graphScreenColor  = value?["graphScreenColor"] as? String ?? ""
        
    }
    
}

struct InformationAPI: Codable {
    let data: [Datum]?
}

// MARK: - Datum
struct Datum: Codable {
    let pregunta: String?
    let values: [Value]?
}

// MARK: - Value
struct Value: Codable {
    let label: String?
    let value: Int?
}
