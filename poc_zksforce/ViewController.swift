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
        var queryResult: ZKQueryResult!
        let sforce : ZKSforceClient = ZKSforceClient()
        result = sforce.login("asif@nsiglobal.com", password: "nsiglobal13nSbleH8RIgjUxQp4rHmuLMra5")
        print("session id is :: \(result.sessionId!)")
        queryResult = sforce.query("SELECT NAME FROM CONTACT WHERE EMAIL='Asif.junaid@nsiglobal.com'")
        for query in queryResult.records(){
            print(query)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

