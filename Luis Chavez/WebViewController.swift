//
//  WebViewController.swift
//  Luis Chavez
//
//  Created by Luis Armando Chávez Soto on 24/04/15.
//  Copyright (c) 2015 me.luischavez. All rights reserved.
//

import UIKit

class WebViewController: UIViewController,UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    var url: String!
    @IBOutlet weak var progressView: UIProgressView!
    var hasFinishedLoading = false

    
    @IBAction func removeWebViewAction(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let targetURL = NSURL(string: url)
        let request = NSURLRequest(URL: targetURL!)
        webView.loadRequest(request)
        webView.delegate = self
        
        self.title = "Loading..."
    }

    func webViewDidStartLoad(webView: UIWebView) {
        self.title = "Loading..."
        hasFinishedLoading = false
        progressView.progress = 0.1
        progressView.hidden = false
        updateProgress()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
        self.title = webView.stringByEvaluatingJavaScriptFromString("document.title")
        
        delay(1) { [weak self] in
            if let _self = self {
                _self.hasFinishedLoading = true
            }
        }
    
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        if error.code == NSURLErrorNotConnectedToInternet || error.code == NSURLErrorNetworkConnectionLost{
            var alert = UIAlertController(title: "No Internet", message: "Check internet connection.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: { (action:UIAlertAction!) -> Void in
                self.dismissViewControllerAnimated(true, completion: nil)
            }))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    deinit {
        webView.stopLoading()
        webView.delegate = nil
    }
    
    func updateProgress() {
        if progressView.progress >= 1 {
            progressView.hidden = true
        } else {
            
            if hasFinishedLoading {
                progressView.progress += 0.002
            } else {
                if progressView.progress <= 0.3 {
                    progressView.progress += 0.004
                } else if progressView.progress <= 0.6 {
                    progressView.progress += 0.002
                } else if progressView.progress <= 0.9 {
                    progressView.progress += 0.001
                } else if progressView.progress <= 0.94 {
                    progressView.progress += 0.0001
                } else {
                    progressView.progress = 0.9401
                }
            }
            
            delay(0.008) { [weak self] in
                if let _self = self {
                    _self.updateProgress()
                }
            }

        }
    }

    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

}
