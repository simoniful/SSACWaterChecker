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
        portionIntake.text = "목표의 \(round(portion * 100) / 100)%"
        
        if 0..<10 ~= portion {
            StatusImage.image = UIImage(named: "1-1")
        } else if 10..<20 ~= portion {
            StatusImage.image = UIImage(named: "1-2")
        } else if 20..<30 ~= portion {
            StatusImage.image = UIImage(named: "1-3")
        } else if 30..<40 ~= portion {
            StatusImage.image = UIImage(named: "1-4")
        } else if 40..<50 ~= portion {
            StatusImage.image = UIImage(named: "1-5")
        } else if 50..<60 ~= portion {
            StatusImage.image = UIImage(named: "1-6")
        } else if 60..<70 ~= portion {
            StatusImage.image = UIImage(named: "1-7")
        } else if 70..<80 ~= portion {
            StatusImage.image = UIImage(named: "1-8")
        } else if 80..<100 ~= portion {
            StatusImage.image = UIImage(named: "1-9")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let updatedNum = UserDefaults.standard.integer(forKey: "intake")
        totalIntake.text = "\(updatedNum)ml"
        
        let nickname = UserDefaults.standard.string(forKey: "nickname") ?? "익명사용자"
        let height = UserDefaults.standard.string(forKey: "height") ?? "160.0"
        let weight = UserDefaults.standard.string(forKey: "weight") ?? "50.0"
        let recommand : Double = (Double(height)! + Double(weight)!) / 100
        recommandedIntake.text = "\(nickname)님의 하루 물 권장 섭취량은 \(recommand)L 입니다"
        
        let portion = Double(updatedNum) / (recommand * 1000) * 100
        portionIntake.text = "목표의 \(round(portion * 100) / 100)%"
        
        if 0..<10 ~= portion {
            StatusImage.image = UIImage(named: "1-1")
        } else if 10..<20 ~= portion {
            StatusImage.image = UIImage(named: "1-2")
        } else if 20..<30 ~= portion {
            StatusImage.image = UIImage(named: "1-3")
        } else if 30..<40 ~= portion {
            StatusImage.image = UIImage(named: "1-4")
        } else if 40..<50 ~= portion {
            StatusImage.image = UIImage(named: "1-5")
        } else if 50..<60 ~= portion {
            StatusImage.image = UIImage(named: "1-6")
        } else if 60..<70 ~= portion {
            StatusImage.image = UIImage(named: "1-7")
        } else if 70..<80 ~= portion {
            StatusImage.image = UIImage(named: "1-8")
        } else if 80..<100 ~= portion {
            StatusImage.image = UIImage(named: "1-9")
        }
    }
    
    
    @IBAction func handleIntakeBtn(_ sender: UIButton) {
        let num = UserDefaults.standard.integer(forKey: "intake")
        let intake: String? = intakeInput.text
        let value: Int = Int(intake!) ?? 0
        UserDefaults.standard.set(num + Int(value), forKey: "intake")
        
        let updatedNum = UserDefaults.standard.integer(forKey: "intake")
        totalIntake.text = "\(updatedNum)ml"
        intakeInput.text = nil
        
        let height = UserDefaults.standard.string(forKey: "height") ?? "160.0"
        let weight = UserDefaults.standard.string(forKey: "weight") ?? "50.0"
        let recommand : Double = (Double(height)! + Double(weight)!) / 100
        
        let portion = Double(updatedNum) / (recommand * 1000) * 100
        portionIntake.text = "목표의 \(portion)%"
        
        if 0..<10 ~= portion {
            StatusImage.image = UIImage(named: "1-1")
        } else if 10..<20 ~= portion {
            StatusImage.image = UIImage(named: "1-2")
        } else if 20..<30 ~= portion {
            StatusImage.image = UIImage(named: "1-3")
        } else if 30..<40 ~= portion {
            StatusImage.image = UIImage(named: "1-4")
        } else if 40..<50 ~= portion {
            StatusImage.image = UIImage(named: "1-5")
        } else if 50..<60 ~= portion {
            StatusImage.image = UIImage(named: "1-6")
        } else if 60..<70 ~= portion {
            StatusImage.image = UIImage(named: "1-7")
        } else if 70..<80 ~= portion {
            StatusImage.image = UIImage(named: "1-8")
        } else if 80..<100 ~= portion {
            StatusImage.image = UIImage(named: "1-9")
        }
    }
    
    @IBAction func handleRefresh(_ sender: UIButton) {
        UserDefaults.standard.set(0, forKey: "intake")
        let updatedNum = UserDefaults.standard.integer(forKey: "intake")
        totalIntake.text = "\(updatedNum)ml"
        
        let height = UserDefaults.standard.string(forKey: "height") ?? "160.0"
        let weight = UserDefaults.standard.string(forKey: "weight") ?? "50.0"
        let recommand : Double = (Double(height)! + Double(weight)!) / 100
        let portion = Double(updatedNum) / (recommand * 1000) * 100
        
        portionIntake.text = "목표의 \(portion)%"
    }
}
