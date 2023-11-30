//
//  ValueSelectionController.swift
//  GPAcalc
//
//  Created by Surya on 18/01/23.
//

import UIKit

class ValueSelectionController: UITableViewController {
    var isGrade : Bool = true
    var list : [Grade] = [Grade]()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureValue()
        self.tableView.separatorStyle = .none
        self.tableView.tableFooterView = UIView()
    }
    func configureValue(){
        self.list.removeAll()
        if isGrade{
            self.navigationItem.title = "Select Grade"
            for i in 0...8 {
                let model = Grade()
                model.id = "\(i)"
                if i == 0 {model.name = "O"}
                else if i == 1 {model.name = "A+"}
                else if i == 2 {model.name = "A"}
                else if i == 3 {model.name = "B+"}
                else if i == 4 {model.name = "B"}
                else if i == 5 {model.name = "C"}
                else if i == 6 {model.name = "RA"}
                else if i == 7 {model.name = "SA"}
                else if i == 8 {model.name = "W"}
                list.append(model)
            }}
        
        else{
            self.navigationItem.title = "Select Credit"
            for i in 0...4 {
                let model = Grade()
                model.id = "\(i)"
                model.name = "\(i)"
                list.append(model)
            }}
        
        self.tableView.reloadData()
        
    }
 

    override func numberOfSections(in tableView: UITableView ) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return list.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row].name!

        return cell
    }
   

}


