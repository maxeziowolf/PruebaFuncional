//
//  UserSelfieTableViewCell.swift
//  PruebaFuncional
//
//  Created by Maximiliano Ovando Ramirez on 16/11/22.
//

import UIKit

protocol UserSelfieTableViewCellDelegate {
    func openCamera()
}

class UserSelfieTableViewCell: UITableViewCell, ReuseCell {
    
    //MARK: Protocols
    public var delegate: UserSelfieTableViewCellDelegate?
    
    //MARK: Outlets
    @IBOutlet weak var btnSelfie: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    private func setup(){
        btnSelfie.layer.cornerRadius = 20
    }

    @IBAction func onOpenCamaraClicked(_ sender: Any) {
        delegate?.openCamera()
    }
    
    
}
