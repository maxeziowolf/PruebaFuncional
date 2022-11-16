//
//  NameUserTextfieldTableViewCell.swift
//  PruebaFuncional
//
//  Created by Maximiliano Ovando Ramirez on 16/11/22.
//

import UIKit

//MARK: Protocol
protocol NameUserTextfieldTableViewCellDelegate {
    func updateUserName(userName: String)
}

class NameUserTextfieldTableViewCell: UITableViewCell, ReuseCell {
    
    //MARK: Outlets
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var labelUsername: UILabel!
    
    //MARK: Variables
    public var delegate: NameUserTextfieldTableViewCellDelegate?
    
    //MARK: Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    //MARK: Setup()
    private func setupUI(){
        tfUsername.delegate = self
        viewContainer.layer.cornerRadius = 20
    }
    
}


//MARK: NameUserTextfieldTableViewCell
extension NameUserTextfieldTableViewCell: UITextFieldDelegate{
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        labelUsername.text = "Nombre: \(tfUsername.text ?? "")"
        delegate?.updateUserName(userName: tfUsername.text ?? "")
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return Utils.validateAlphabet(textField, shouldChangeCharactersIn: range, replacementString: string)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
    }
    
}

