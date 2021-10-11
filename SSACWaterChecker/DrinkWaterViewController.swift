//
//  DrinkWaterViewController.swift
//  SSACWaterChecker
//
//  Created by Sang hun Lee on 2021/10/11.
//

import UIKit
import TextFieldEffects

class DrinkWaterViewController: UIViewController {
    @IBOutlet var totalIntake: UILabel!
    @IBOutlet var portionIntake: UILabel!
    @IBOutlet var recommandedIntake: UILabel!
    @IBOutlet var intakeInput: HoshiTextField!
    @IBOutlet var StatusImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let updatedNum = UserDefaults.standard.integer(forKey: "intake")
        totalIntake.text = "\(updatedNum)ml"
        
        let nickname = UserDefaults.standard.string(forKey: "nickname") ?? "익명사용자"
        let height = UserDefaults.standard.string(forKey: "height") ?? "160.0"
        let weight = UserDefaults.standard.string(forKey: "weight") ?? "50.0"
        let recommand : Double = (Double(height)! + Double(weight)!) / 100
        recommandedIntake.text = "\(nickname)님의 하루 물 권장 섭취량은 \(recommand)L 입니다"
        
        let portion = Double(updatedNum) / (recommand * 1000) * 100
        portionIntake.text = "목표의 \(portion)%"
        
    }
    
    
    @IBAction func handleIntakeBtn(_ sender: UIButton) {
        let num = UserDefaults.standard.integer(forKey: "intake")
        let intake: String? = intakeInput.text
        let value: Int = Int(intake!) ?? 0
        UserDefaults.standard.set(num + Int(value), forKey: "intake")
        let updatedNum = UserDefaults.standard.integer(forKey: "intake")
        totalIntake.text = "\(updatedNum)ml"
        intakeInput.text = nil
    }
    
    @IBAction func handleRefresh(_ sender: UIButton) {
        UserDefaults.standard.set(0, forKey: "intake")
        let updatedNum = UserDefaults.standard.integer(forKey: "intake")
        totalIntake.text = "\(updatedNum)ml"
    }
}
