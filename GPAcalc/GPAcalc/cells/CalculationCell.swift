//
//  CalculationCell.swift
//  GPAcalc
//
//  Created by Surya on 17/01/23.
//

import UIKit

class CalculationCell: UITableViewCell {

    @IBOutlet weak var calculate: UIButton!
    @IBOutlet weak var grade: UIButton!
    @IBOutlet weak var credit: UIButton!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var plus: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var tapForCredit : (() -> Void)? = nil
    var tapForGrade : (() -> Void)? = nil
    var tapForPlus : (() -> Void)? = nil
    var tapForCalculate : (() -> Void)? = nil
    
    func setData(model : Grade) {
        name.text = model.name
        credit.addTarget(self, action: #selector(tapCredit),for: .touchUpInside)
        grade.addTarget(self, action: #selector(tapGrade),for: .touchUpInside)
        plus.addTarget(self, action: #selector(tapPlus),for: .touchUpInside)
    }
    
    func setFooter(){
        calculate.addTarget(self, action: #selector(tapCalculate), for: .touchUpInside)
    }
    
    @objc func tapCredit(){
        if let tap = tapForCredit{
            tap()
        }
    }
    @objc func tapGrade(){
        if let tap = tapForGrade{
            tap()
        }
    }
    @objc func tapPlus(){
        if let tap = tapForPlus{
            tap()
        }
    }
    @objc func tapCalculate(){
        if let tap = tapForCalculate{
            tap()
        }
    }
    

}
