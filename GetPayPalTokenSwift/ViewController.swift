//
//  ViewController.swift
//  GetPayPalTokenSwift
//
//  Created by Onyeka Obi on 1/19/15.
//  Copyright (c) 2015 Onyeka Obi. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBOutlet weak var output: UILabel!
    var mutableData: NSMutableData!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func runTest() {
        let startUrl = "https://api.sandbox.paypal.com/v1/oauth2/token"
        let request = NSMutableURLRequest(URL: NSURL(string: startUrl)!)
        request.HTTPMethod = "POST"
        let rawCredentials = NSData(bytes: "AYSkoxC6MolMcRAlHJF6xWTvIWj4A6XcyAdhBSxsL8CJ1-wTo8L3L69V5A6c:ELxcaRDSmbrGcSSAGSZMiCMM4nRoufAwiXiFcfdGeuIQoziPwuMIm8d4LFC-", length: 0)
        var newCredentials = rawCredentials.base64EncodedDataWithOptions(NSBase64EncodingEndWithLineFeed)
        var authString = "Basic " + newCredentials;
        request.Authorization = authString
        request.HTTPBody = NSData(bytes: "grant_type=client_credentials", length:0)
        NSURLConnection(request: request, delegate: self)
        
    }


}

