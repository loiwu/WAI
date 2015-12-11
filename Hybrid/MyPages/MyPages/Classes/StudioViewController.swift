//
//  SecondViewController.swift
//  MyPages
//
//  Created by Loi Wu on 12/11/15.
//  Copyright © 2015 Loi Wu. All rights reserved.
//

import UIKit
import WebKit

class StudioViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView?
    
    func webView(webView: WKWebView,
        didStartProvisionalNavigation navigation: WKNavigation){
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func webView(webView: WKWebView,
        didFinishNavigation navigation: WKNavigation){
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
    func webView(webView: WKWebView,
        decidePolicyForNavigationResponse navigationResponse: WKNavigationResponse,
        decisionHandler: ((WKNavigationResponsePolicy) -> Void)){
            
            print(navigationResponse.response.MIMEType)
            
            decisionHandler(.Allow)
            
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let preferences = WKPreferences()
        preferences.javaScriptEnabled = false
        
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        
        webView = WKWebView(frame: view.bounds, configuration: configuration)
        
        if let theWebView = webView{
            let url = NSURL(string: "https://loiwu.github.io/gwrabbit/")
            let urlRequest = NSURLRequest(URL: url!)
            theWebView.loadRequest(urlRequest)
            theWebView.navigationDelegate = self
            view.addSubview(theWebView)
            
        }
        
    }
    
}