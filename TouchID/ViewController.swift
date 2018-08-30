//
//  ViewController.swift
//  TouchID
//
//  Created by Rahmat Hidayat on 8/30/18.
//  Copyright © 2018 Rahmat Hidayat. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var lblInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func btnTouchidTapped(_ sender: UIButton) {
        let context = LAContext()
        let localizedReasonString = "Authentication Touch ID"
        
        var authError: NSError?
        if #available(iOS 8.0, *) {
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: localizedReasonString) { success, evaluateError in
                    
                    DispatchQueue.main.async {
                        if success {
                            // User authenticated successfully, take appropriate action
                            self.lblInfo.text = "Touch ID Authenticated Success"
                        } else {
                            // User did not authenticate successfully, look at error and take appropriate action
                            self.lblInfo.text = "Sorry!!... User did not authenticate successfully"
                        }
                    }
                }
            } else {
                // Could not evaluate policy; look at authError and present an appropriate message to user
                self.lblInfo.text = "Sorry!!.. Could not evaluate policy."
            }
        } else {
            // Fallback on earlier versions
            self.lblInfo.text = "This feature is not supported."
        }
    }
}

