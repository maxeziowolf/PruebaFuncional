//
//  GraphDescriptionTableViewCell.swift
//  PruebaFuncional
//
//  Created by Maximiliano Ovando Ramirez on 16/11/22.
//

import UIKit

//MARK: Protocol
protocol GraphDescriptionTableViewCellDelegate {
    func openGraphView()
}

class GraphDescriptionTableViewCell: UITableViewCell, ReuseCell {

    //MARK: Outlets
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var btnShowGraph: UIButton!
    
    
    //MARK: Variables
    public var delegate: GraphDescriptionTableViewCellDelegate?
    
    //MARK: Lifecycle
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        setupUI()
    }
    
    //MARK: setupUI
    
    private func setupUI(){
        
        viewContent.layer.cornerRadius = 20
        btnShowGraph.layer.cornerRadius = 20
        
    }
    

    @IBAction func onShowGraphClicked(_ sender: Any) {
        delegate?.openGraphView()
    }
    
    
}

