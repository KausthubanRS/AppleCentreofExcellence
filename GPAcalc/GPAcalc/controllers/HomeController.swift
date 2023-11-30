//
//  ViewController.swift
//  GPAcalc
//
//  Created by Surya on 14/01/23.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var cgpa: UIButton!
    @IBOutlet weak var gpa: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gpa.addTarget(self, action: #selector(tapForGPA), for: .touchUpInside)
        cgpa.addTarget(self, action: #selector(tapForCGPA), for: .touchUpInside)
    }
    override func viewWillAppear(_ animated: Bool) {
        setNeedsStatusBarAppearanceUpdate()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent
    }
    @objc func tapForGPA(){
        let story = UIStoryboard(name: "Main", bundle: nil)
        guard let controller = story.instantiateViewController(identifier: "AvgControler") as? AvgController else{return}
        controller.SType = 1
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    @objc func tapForCGPA(){
        let story = UIStoryboard(name: "Main", bundle: nil)
        guard let controller = story.instantiateViewController(identifier: "AvgControler") as? AvgController else{return}
        controller.SType = 2
        self.navigationController?.pushViewController(controller, animated: true)

    }
   
}

