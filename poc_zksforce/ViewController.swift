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
        queryField(client: sforce,field: "NAME")
    }
    
    func queryField(client:ZKSforceClient,field:String){
        var queryResult: ZKQueryResult!
        queryResult = client.query("SELECT \(field) FROM CONTACT WHERE EMAIL='Asif.junaid@nsiglobal.com'")
        for query in queryResult.records(){
            if let dict = query as? ZKSObject{
                print(dict.fields()["Name"]!)
            }
        }
    }
    func addContact(client:ZKSforceClient,fname:String,lname:String){
        let contact: ZKSObject = ZKSObject(type: "Contact")
        contact.setFieldValue(fname as NSObject!, field: "FirstName")
        contact.setFieldValue(lname as NSObject!, field: "LastName")
        let result = client.create([contact])
        let saveResult:ZKSaveResult = result[0]
        saveResult.success?print("sucess"):print("failed")
    }
    
}

