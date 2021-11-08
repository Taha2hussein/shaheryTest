//
//  UITableViewExtension.swift
//  viperTest
//
//  Created by A on 07/11/2021.
//

import UIKit

extension UITableView {
 
    func dequeueReusableCell<T: UITableViewCell>(_ type: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.classNameWithoutNamespaces, for: indexPath) as? T else {
            let message = "Could not dequeue cell with identifier \(T.classNameWithoutNamespaces) at \(indexPath)"
            fatalError(message)
        }
        return cell
    }
}
extension NSObject {
  class var classNameWithoutNamespaces: String {
    return String(describing: self)
  }
}
