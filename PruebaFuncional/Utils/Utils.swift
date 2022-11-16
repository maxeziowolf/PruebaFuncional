//
//  Utils.swift
//  PruebaFuncional
//
//  Created by Maximiliano Ovando Ramirez on 16/11/22.
//

import UIKit

class Utils {
    
    //MARK: Private Functions
    public static  func validateAlphabet(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        let regEx = "([A-Z]*[a-z]*( )*)*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
         
        if (predicate.evaluate(with: string)){
            
            return true
            
        }else if string == ""{
            
            return true
            
        }
        
        return false
    }
    
}
