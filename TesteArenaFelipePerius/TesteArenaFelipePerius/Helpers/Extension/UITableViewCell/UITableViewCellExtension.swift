//
//  UITableView+Helper.swift
//  desafio-concrete
//
//  Created by Felipe Perius on 04/01/18.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//
import UIKit

extension UITableViewCell {
    class func createCell<T: UITableViewCell>(_ tableView: UITableView, indexPath: IndexPath) -> T {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T else {
            return T()
        }
        return cell
    }
}
