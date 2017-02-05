//
//  PullRequestViewController.swift
//  GitHub
//
//  Created by Juliana Lacerda on 04/02/17.
//  Copyright © 2017 Juliana Lacerda. All rights reserved.
//

import UIKit

class PullRequestViewController: UIViewController, ControllersProtocol {
    
    @IBOutlet weak var webview: UIWebView!
    
    var urlPullRequest: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.webview.loadRequest(URLRequest(url: urlPullRequest!))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension PullRequestViewController: UIWebViewDelegate {
    
    func webViewDidStartLoad(_ webView: UIWebView) {
         self.showLoading()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.hideLoading()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        self.hideLoading()
    }
    
}
