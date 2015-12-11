//
//  FirstViewController.swift
//  MyPages
//
//  Created by Loi Wu on 12/11/15.
//  Copyright © 2015 Loi Wu. All rights reserved.
//

import UIKit
import WebKit

class HomeViewController: UIViewController {

    var webView: WKWebView?
    
    override func loadView() {
        super.loadView() // call parent loadView
        self.webView = WKWebView() // instantiate WKWebView
        self.view = self.webView! // make it the main view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad() // run base class viewDidLoad
        let url = NSURL(string:"http://loiwu.github.io/") // make a URL
        let req = NSURLRequest(URL:url!) // make a request w/ that URL
        self.webView!.loadRequest(req) // unwrap the webView and load the request.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

