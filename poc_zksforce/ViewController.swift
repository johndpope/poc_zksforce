//
//  ViewController.swift
//  poc_zksforce
//
//  Created by Asif Junaid on 17/01/2017.
//  Copyright © 2017 Asif Junaid. All rights reserved.
//

import UIKit
import ZKSforce
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loginToSalesforce()
    }
    
    func loginToSalesforce(){
        var result : ZKLoginResult!
        let sforce : ZKSforceClient = ZKSforceClient()
            result = sforce.login("asif@nsiglobal.com", password: "nsiglobal13nSbleH8RIgjUxQp4rHmuLMra5")
    
        print("session id is :: \(result.sessionId!)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

