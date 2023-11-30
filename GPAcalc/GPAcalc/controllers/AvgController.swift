//
//  AvgController.swift
//  GPAcalc
//
//  Created by Surya on 17/01/23.
//

import UIKit

class AvgController: UIViewController {
    @IBOutlet weak var newStork: UIButton!
    var SType : Int = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        if SType == 1 {
            self.navigationItem.title = "GPA"
        }
        else if SType == 2 {
            self.navigationItem.title = "CGPA"
        }
        configureNavigationIcon()
        newStork.addTarget(self, action: #selector(tapNewStork), for: .touchUpInside)
    }
    
    func configureNavigationIcon(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(handleSetting))
    
    }
    @objc func handleSetting(){
        let story = UIStoryboard(name: "Main", bundle: nil)
        guard let controller = story.instantiateViewController(identifier: "SettingController") as? SettingController else {return}
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    @objc func tapNewStork(){
        let story = UIStoryboard(name: "Main", bundle: nil)
        guard let controller = story.instantiateViewController(identifier: "CalculationController") as? CalculationController else{return}
        controller.SType = self.SType
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
