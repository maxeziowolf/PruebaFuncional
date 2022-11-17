//
//  LoadingModalViewController.swift
//  PruebaFuncional
//
//  Created by Maximiliano Ovando Ramirez on 16/11/22.
//

import UIKit

class LoadingModalViewController: UIViewController {
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var viewContent: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI(){
        activityIndicator.transform = activityIndicator.transform.scaledBy(x: 3, y: 3)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        viewContent.layer.cornerRadius = 20
    }
}
