//
//  RepositoryListViewControllerTest.swift
//  Desafio iOS
//
//  Created by João Pedro Souza on 31/01/17.
//  Copyright © 2017 Arena. All rights reserved.
//

import XCTest
@testable import Desafio_iOS

class RepositoryListViewControllerTests: XCTestCase {
  
  var repositoryListViewController: RepositoryListViewController!
  
  override func setUp() {
    super.setUp()
    repositoryListViewController = R.storyboard.main().instantiateViewController(withIdentifier: "RepositoryListViewController") as! RepositoryListViewController    
    repositoryListViewController.perform(#selector(RepositoryListViewController.loadView))
  }
  
  override func tearDown() {
    super.tearDown()
    repositoryListViewController = nil
  }
  
  func testThatTableViewIsConnectedToDataSource () {
    XCTAssertNotNil(self.repositoryListViewController.tableView.dataSource, "Table data source cannot be nil");
  }
  
  func testThatTableViewIsConnectedToDelegate () {
    XCTAssertNotNil(self.repositoryListViewController.tableView.delegate, "Table delegate cannot be nil");
  }
  
  func testTableViewCellCreateCellsWithReuseIdentifier() {
    let bundle = Bundle(for: type(of: self))
    let filePath = bundle.path(forResource: "RepositoryItens", ofType: "json")!
    let jsonData = FileManager.default.contents(atPath: filePath)
    
    do {
      let jsonMockRepositories = try JSONSerialization.jsonObject(with: jsonData!, options: .allowFragments) as? [String : Any]
      let arrayRepositories = jsonMockRepositories!["items"] as! [[String:Any]]
      let repositories: [Repository] = arrayRepositories.arrayOfClass()
      let count = jsonMockRepositories!["total_count"] as! Int
      let repositoryList = RepositoryList(repositories: repositories, totalCount: count)
      self.repositoryListViewController.repositoryList = repositoryList
      self.repositoryListViewController.tableView.reloadData()
      
      let indexPath = IndexPath(row: 0, section: 0)
      let cell = self.repositoryListViewController.tableView.cellForRow(at: indexPath)
      XCTAssertTrue(cell!.reuseIdentifier == R.reuseIdentifier.repositoryCell.identifier, "Table does not create reusable cells")
      
    } catch {
      
    }
  }
  
  func testIfTableViewHasHeightOf129() {
    XCTAssertTrue(self.repositoryListViewController.tableView.rowHeight == 129.0)
  }

  func testIfTableViewCellIsFilledCorrectlly() {
    let bundle = Bundle(for: type(of: self))
    let filePath = bundle.path(forResource: "RepositoryItens", ofType: "json")!
    let jsonData = FileManager.default.contents(atPath: filePath)
    
    do {
      let jsonMockRepositories = try JSONSerialization.jsonObject(with: jsonData!, options: .allowFragments) as? [String : Any]
      let arrayRepositories = jsonMockRepositories!["items"] as! [[String:Any]]
      let repositories: [Repository] = arrayRepositories.arrayOfClass()
      let count = jsonMockRepositories!["total_count"] as! Int
      let repositoryList = RepositoryList(repositories: repositories, totalCount: count)
      self.repositoryListViewController.repositoryList = repositoryList
      self.repositoryListViewController.tableView.reloadData()
      
      let firstRepository = repositories.first!
      
      let indexPath = IndexPath(row: 0, section: 0)
      let repositoryTableViewCell = self.repositoryListViewController.tableView.cellForRow(at: indexPath) as! RepositoryTableViewCell
      
      XCTAssertTrue(firstRepository.name == repositoryTableViewCell.labelRepositoryName.text, "Repository name is not filled correctlly");
      
      XCTAssertTrue(firstRepository.respositoryDescription == repositoryTableViewCell.labelRepositoryDescription.text, "Repository description is not filled correctlly");
      
      XCTAssertTrue(String(firstRepository.forksCount) == repositoryTableViewCell.labelNumberOfForks.text, "Number of forks is not filled correctlly");
      
      XCTAssertTrue(String(firstRepository.stargazersCount) == repositoryTableViewCell.labelNumberOfStars.text, "Number of stars is not filled correctlly");
      
      XCTAssertTrue(firstRepository.owner.login == repositoryTableViewCell.labelLoginName.text, "Owner login name is not filled correctlly");

    } catch {
      
    }
  }
}
