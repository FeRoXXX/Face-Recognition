//
//  ViewController.swift
//  FaceRecognitionProject
//
//  Created by Александр Федоткин on 25.10.2023.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var errorText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signinClicked(_ sender: Any) {
        let authContext = LAContext()
        
        var error : NSError?
        error?.value(forKey: "error face id")
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it your?") { success, error in
                if success{
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                    }
                } else{
                    DispatchQueue.main.async {
                        self.errorText.text = "It's not you"
                    }
                }
            }
        }
        
    }
    
}

