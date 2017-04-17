//
//  DetailRepositoryControllerViewController.swift
//  Challenge
//
//  Created by Gustavo Henrique on 15/04/17.
//  Copyright © 2017 Gustavo Henrique. All rights reserved.
//


import UIKit

class DetailRepositoryControllerViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var activityIndicator : UIActivityIndicatorView = UIActivityIndicatorView()
    let overlayView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        callFunction()
    }
    
    func callFunction(){
        
        self.title = PullRequestSingleton.sharedInstance.getRepository().name
        self.activityView(view: self.view, overlayView: self.overlayView, activityView: self.activityIndicator)
        PullRequestSingleton.sharedInstance.fetchRequests {
            
            if PullRequestSingleton.sharedInstance.getRequestList().count > 0 {
                self.activityIndicator.stopAnimating()
                self.overlayView.removeFromSuperview()
                self.tableView.reloadData()
            }else {
                self.setAlert(msg: "Bad Data", completion: nil)
            }
        }
    }
    
}

extension DetailRepositoryControllerViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pullRequest = PullRequestSingleton.sharedInstance.getRequestList()[indexPath.row]
        UIApplication.shared.open(URL(string: pullRequest.html_url)!, options: [:], completionHandler: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
extension DetailRepositoryControllerViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PullRequestSingleton.sharedInstance.getRequestList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! DetailRepositoryTableCell
        
        let pullRequest = PullRequestSingleton.sharedInstance.getRequestList()[indexPath.row]
        
        cell.configCell(pullRequest: pullRequest)
        
        return cell
    }
    
}
