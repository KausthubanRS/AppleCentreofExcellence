//
//  CalculationController.swift
//  GPAcalc
//
//  Created by Surya on 17/01/23.
//

import UIKit

class CalculationController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    
    var SType : Int = 1
    var isGrade : Bool = false
    var cell : CalculationCell?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var name: UITextField!
    var list: [Grade] = [Grade]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "New Stork"
        self.tapTohideKeyboard()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        self.tableView.separatorStyle = .none
        configureTable()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func configureTable(){
        let model = Grade()
        model.id = "\(list.count + 1)"
        model.name = ""
        list.append(model)
        self.tableView.reloadData()
    }
    
    
    
    var isScrolled : Bool = false
    @objc func keyboardWillShow(_ notification: NSNotification){
        if !self.isScrolled{
            self.tableView.contentSize = CGSize(width: 0, height: self.tableView.contentSize.height + 250.0)
            self.isScrolled = true
        }
        
    }
    @objc func keyboardWillHide(_ notification: NSNotification){
        if !self.isScrolled{
            self.tableView.contentSize = CGSize(width: 0, height: self.tableView.contentSize.height - 250.0)
            self.isScrolled = false
        }
    }
}
    extension CalculationController  {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return list.count + 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            if indexPath.row == list.count {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "footer") as! CalculationCell
                cell.setFooter()
                return cell
            }
            else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CalculationCell
                if indexPath.row == list.count - 1 {
                    cell.plus.isHidden = false
                }
                else {
                    cell.plus.isHidden = true
                }
                
                cell.setData(model: list[indexPath.row])
                
                cell.tapForPlus = {
                    self.configureTable()
                }
                
                cell.tapForCredit = {
                    self.cell = cell
                    self.isGrade = false
                    let story = UIStoryboard(name: "Maine", bundle: nil)
                    guard let controller = story.instantiateViewController(withIdentifier: "ValueSelectionController") as? ValueSelectionController else{return}
                    controller.isGrade = self.isGrade
                    self.navigationController?.pushViewController(controller, animated: true)
                }
                
                cell.tapForGrade = {
                    self.cell = cell
                    self.isGrade = true
                    let story = UIStoryboard(name: "Maine", bundle: nil)
                    guard let controller = story.instantiateViewController(withIdentifier: "ValueSelectionController") as? ValueSelectionController else{return}
                    controller.isGrade = self.isGrade
                    self.navigationController?.pushViewController(controller, animated: true)
                }
                return cell
            }
        }
        func tableView(_ tableView : UITableView , heightForRowAt indexPath : IndexPath) -> CGFloat{
            return UITableView.automaticDimension
        }
        func tableView(_ tableView : UITableView , didSelectRowAt indexPath : IndexPath){
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    extension CalculationController : callBack {
        func callBack(str : String){}
    }
    

