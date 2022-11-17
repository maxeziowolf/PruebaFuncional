//
//  GraphViewController.swift
//  PruebaFuncional
//
//  Created by Maximiliano Ovando Ramirez on 16/11/22.
//

import UIKit

//MARK: Protocol
protocol GraphViewProtocol {
    func updateBackground(color: UIColor)
    func updateInformation(response: InformationAPI?)
}


class GraphViewController: UIViewController {
    
    
    @IBOutlet weak var firstPieGraph: JPieChart!
    @IBOutlet weak var seconPieGraph: JPieChart!
    @IBOutlet var circules: [UIView]!
    @IBOutlet weak var lblYes: UILabel!
    @IBOutlet weak var lblNo: UILabel!
    @IBOutlet weak var lblEmp1: UILabel!
    @IBOutlet weak var lblEmp2: UILabel!
    @IBOutlet weak var lblEmp3: UILabel!
    @IBOutlet weak var lblEmp4: UILabel!
    @IBOutlet weak var lblEmp5: UILabel!
    @IBOutlet weak var lblEmp6: UILabel!
    
    public var presenter: GraphPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        
    }
    
    //MARK: Setup UI
    private func setupUI(){
        //SetupBackgroundConfig
        showModal(){
            self.presenter?.setupFirebase()
            self.presenter?.getInformation()
        }
        
        circules.forEach { (view) in
            view.layer.cornerRadius = view.bounds.width/2
        }
        
    }
    
    func showModal(closure: @escaping (()->())){
        
        let modal = LoadingModalViewController(nibName: "LoadingModalViewController", bundle: nil)
        modal.modalTransitionStyle = .crossDissolve
        modal.modalPresentationStyle = .overCurrentContext
        
        navigationController?.present(modal, animated: true){
            closure()
        }
        
    }
    
    func hidenModal(closure: @escaping (()->())){
        navigationController?.dismiss(animated: true){
            closure()
        }
    }
    




}

extension GraphViewController: GraphViewProtocol{
    
    func updateInformation(response: InformationAPI?) {
        
        hidenModal {
            let cleanYes = response?.data?.first?.values?.first(where: {$0.label?.lowercased() == "si"})?.value ?? 0
            let cleanNo = response?.data?.first?.values?.first(where: {$0.label?.lowercased() == "no"})?.value ?? 0
            
            self.firstPieGraph.lineWidth = 1
            self.firstPieGraph.addChartData(data: [
                JPieChartDataSet(percent: CGFloat(cleanNo), colors: [UIColor.darkishPink,UIColor.red]),
                JPieChartDataSet(percent: CGFloat(cleanYes), colors: [UIColor.purpleishBlueThree,UIColor.green]),
            ])
            
            
            self.lblYes.text = "SI \(cleanYes)%"
            self.lblNo.text = "NO \(cleanNo)%"
            
            
            let emp1 = response?.data?[1].values?[0].value ?? 0
            let emp2 = response?.data?[1].values?[1].value ?? 0
            let emp3 = response?.data?[1].values?[2].value ?? 0
            let emp4 = response?.data?[1].values?[3].value ?? 0
            let emp5 = response?.data?[1].values?[4].value ?? 0
            let emp6 = response?.data?[1].values?[5].value ?? 0

            self.seconPieGraph.lineWidth = 1
            self.seconPieGraph.addChartData(data: [
                JPieChartDataSet(percent: CGFloat(emp1), colors: [UIColor.green,UIColor.green]),
                JPieChartDataSet(percent: CGFloat(emp2), colors: [UIColor.red,UIColor.red]),
                JPieChartDataSet(percent: CGFloat(emp3), colors: [UIColor.orange,UIColor.orange]),
                JPieChartDataSet(percent: CGFloat(emp4), colors: [UIColor.gray,UIColor.gray]),
                JPieChartDataSet(percent: CGFloat(emp5), colors: [UIColor.yellow,UIColor.yellow]),
                JPieChartDataSet(percent: CGFloat(emp6), colors: [UIColor.cyan,UIColor.cyan]),
            ])


            self.lblEmp1.text = "\(response?.data?[1].values?[0].label ?? "") \(emp1)%"
            self.lblEmp2.text = "\(response?.data?[1].values?[1].label ?? "") \(emp2)%"
            self.lblEmp3.text = "\(response?.data?[1].values?[2].label ?? "") \(emp3)%"
            self.lblEmp4.text = "\(response?.data?[1].values?[3].label ?? "") \(emp4)%"
            self.lblEmp5.text = "\(response?.data?[1].values?[4].label ?? "") \(emp5)%"
            self.lblEmp6.text = "\(response?.data?[1].values?[5].label ?? "") \(emp6)%"
        }
        

    }
    
    
    func updateBackground(color: UIColor){
        
        self.view.backgroundColor = color
        
    }
}
