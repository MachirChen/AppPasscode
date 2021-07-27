//
//  ViewController.swift
//  App Passcode
//
//  Created by Machir on 2021/7/27.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var passcodeImageViews: [UIImageView]!
    @IBOutlet var numberButtons: [UIButton]!
    
    var passcode = "0000"
    var entercode = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func imageChange() {
        switch entercode.count {
        case 1:
            for i in 0...3 {
                passcodeImageViews[i].isHighlighted = true
                if i > 0 {
                    passcodeImageViews[i].isHighlighted = false
                }
            }
        case 2:
            for i in 0...3 {
                passcodeImageViews[i].isHighlighted = true
                if i > 1 {
                    passcodeImageViews[i].isHighlighted = false
                }
            }
        case 3:
            for i in 0...3 {
                passcodeImageViews[i].isHighlighted = true
                if i > 2 {
                    passcodeImageViews[i].isHighlighted = false
                }
            }
        case 4:
            for i in passcodeImageViews {
                i.isHighlighted = true
            }
            checkPasscode()
        default:
            for i in passcodeImageViews {
                i.isHighlighted = false
            }
        }
    }
    
    func reset() {
        for i in passcodeImageViews {
            i.isHighlighted = false
        }
        entercode = ""
    }

    func checkPasscode() {
        if entercode == passcode {
            let controller = UIAlertController(title: "Correct", message: "Welcome Back!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) {
                (_) in self.reset()
            }
            controller.addAction(action)
            present(controller, animated: true, completion: nil)
        } else {
            let controller = UIAlertController(title: "Wrong", message: "Please Try Again!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            controller.addAction(action)
            present(controller, animated: true, completion: reset)
        }
    }
    
    @IBAction func enterPasscode(_ sender: UIButton) {
        if entercode.count != 4 {
            if let inputNumber = sender.currentTitle {
                entercode.append(inputNumber)
            }
        }
        imageChange()
    }
    @IBAction func backward(_ sender: UIButton) {
        if entercode.count != 0 {
            entercode = String(entercode.dropLast(1))
            imageChange()
        }
    }
}

