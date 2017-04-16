//
//  GithubJavaController.swift
//  Challenge
//
//  Created by Gustavo Henrique on 15/04/17.
//  Copyright © 2017 Gustavo Henrique. All rights reserved.
//


import UIKit

class GithubJavaController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var page = 1
    var activityIndicator : UIActivityIndicatorView = UIActivityIndicatorView()
    let overlayView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        callFunction()
    }
    
    func callFunction() {
        
        self.activityView(view: self.view,overlayView: self.overlayView, activityView: self.activityIndicator)
        RepositorySingleton.sharedInstance.fetchRepositories(page: page, completionHandler: {
            
            if RepositorySingleton.sharedInstance.getRepositories().count > 0 {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    self.activityIndicator.stopAnimating()
                    self.overlayView.removeFromSuperview()
                    self.tableView.reloadData()
                })
                
            }else {
                self.setAlert(msg: "Bad data", completion: nil)
            }
        })

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailRepository" {
            print("Changing View")
        }
    }
}

extension GithubJavaController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let choosedRepo = RepositorySingleton.sharedInstance.getRepositories()[indexPath.row]
        PullRequestSingleton.sharedInstance.setRepository(newRepository: choosedRepo)

        performSegue(withIdentifier: "detailRepository", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastRowIndex = tableView.numberOfRows(inSection: 0)
        
        if (indexPath.row == (lastRowIndex - 1)) {
            self.page += 1
            callFunction()
        }
    }
}

extension GithubJavaController : UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RepositorySingleton.sharedInstance.getRepositories().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell", for: indexPath) as! RepositoryTableCell
        
        let repository = RepositorySingleton.sharedInstance.getRepositories()[indexPath.row]
        
        cell.configCell(repository: repository)
        
        return cell
    }
    
}
