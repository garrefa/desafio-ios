//
//  PullRequestsOfARepositoryViewControllerTests.swift
//  Desafio iOS
//
//  Created by João Pedro Souza on 31/01/17.
//  Copyright © 2017 Arena. All rights reserved.
//

import XCTest
import SwiftyUtils
@testable import Desafio_iOS

class PullRequestsOfARepositoryViewControllerTests: XCTestCase {
  
  var pullRequestsOfARepositoryViewController: PullRequestsOfARepositoryViewController!

  override func setUp() {
    super.setUp()
    pullRequestsOfARepositoryViewController = R.storyboard.main().instantiateViewController(withIdentifier: "PullRequestsOfARepositoryViewController") as! PullRequestsOfARepositoryViewController
    pullRequestsOfARepositoryViewController.perform(#selector(PullRequestsOfARepositoryViewController.loadView))
  }
  
  override func tearDown() {
    super.tearDown()
  }
    
  func testThatTableViewIsConnectedToDataSource () {
    XCTAssertNotNil(self.pullRequestsOfARepositoryViewController.tableView.dataSource, "Table data source cannot be nil");
  }
  
  func testThatTableViewIsConnectedToDelegate () {
    XCTAssertNotNil(self.pullRequestsOfARepositoryViewController.tableView.delegate, "Table delegate cannot be nil");
  }
  
  func testTableViewCellCreateCellsWithReuseIdentifier() {
    let bundle = Bundle(for: type(of: self))
    let filePath = bundle.path(forResource: "PullRequests", ofType: "json")!
    let jsonData = FileManager.default.contents(atPath: filePath)
    
    do {
      let jsonMockRepositories = try JSONSerialization.jsonObject(with: jsonData!, options: .allowFragments) as? [ [String : Any] ]
      let pullRequests: [PullRequest] = jsonMockRepositories!.arrayOfClass()
      self.pullRequestsOfARepositoryViewController.pullRequests = pullRequests
      self.pullRequestsOfARepositoryViewController.tableView.reloadData()
      
      let indexPath = IndexPath(row: 0, section: 0)
      let cell = self.pullRequestsOfARepositoryViewController.tableView.cellForRow(at: indexPath)
      XCTAssertTrue(cell!.reuseIdentifier == R.reuseIdentifier.pullRequestCell.identifier, "Table does not create reusable cells")
      
    } catch {
      
    }
  }
  
  func testIfTableViewHasAutomaticDimension() {
    self.pullRequestsOfARepositoryViewController.viewDidLoad()
    XCTAssertTrue(self.pullRequestsOfARepositoryViewController.tableView.rowHeight == UITableViewAutomaticDimension)
  }
  
  func testIfTableViewCellIsFilledCorrectlly() {
    let bundle = Bundle(for: type(of: self))
    let filePath = bundle.path(forResource: "PullRequests", ofType: "json")!
    let jsonData = FileManager.default.contents(atPath: filePath)
    
    do {
      let jsonMockRepositories = try JSONSerialization.jsonObject(with: jsonData!, options: .allowFragments) as? [ [String : Any] ]
      let pullRequests: [PullRequest] = jsonMockRepositories!.arrayOfClass()
      self.pullRequestsOfARepositoryViewController.pullRequests = pullRequests
      self.pullRequestsOfARepositoryViewController.tableView.reloadData()
      
      let firstPullRequest = pullRequests.first!
      
      let indexPath = IndexPath(row: 0, section: 0)
      let pullRequestsTableViewCell = self.pullRequestsOfARepositoryViewController.tableView.cellForRow(at: indexPath) as! PullRequestTableViewCell
      
      XCTAssertTrue(firstPullRequest.title == pullRequestsTableViewCell.labelPullRequestTitle.text, "Pull request title is not filled correctlly");
      
      XCTAssertTrue(firstPullRequest.body == pullRequestsTableViewCell.labelPullRequestDescription.text, "Pull request description is not filled correctlly");
      
      XCTAssertTrue(firstPullRequest.user.login == pullRequestsTableViewCell.labelLogin.text, "Pull request user login is not filled correctlly");
      
      XCTAssertTrue(firstPullRequest.createdAt.toString(format: "dd/MM/yyyy") == pullRequestsTableViewCell.labelDate.text, "Pull request date is not filled correctlly");
      
    } catch {
      
    }
  }
  
  func testCountPullRequestsOpenedAndClosed() {
    let bundle = Bundle(for: type(of: self))
    let filePath = bundle.path(forResource: "PullRequests", ofType: "json")!
    let jsonData = FileManager.default.contents(atPath: filePath)
    do {
      let jsonMockRepositories = try JSONSerialization.jsonObject(with: jsonData!, options: .allowFragments) as? [ [String : Any] ]
      let pullRequests: [PullRequest] = jsonMockRepositories!.arrayOfClass()
      let counts = self.pullRequestsOfARepositoryViewController.countClosedAndOpenedPullRequests(pullRequests: pullRequests)
      
      let openedCount = counts.first!
      let closedCount = counts[1]
      
      XCTAssertTrue(openedCount == 12, "Opened count of pull requests is not correct")
      XCTAssertTrue(closedCount == 18, "Opened count of pull requests is not correct")
    } catch {
      
    }
  }
  
}
