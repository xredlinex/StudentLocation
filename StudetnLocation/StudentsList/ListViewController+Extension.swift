//
//  ListViewController+Extension.swift
//  StudetnLocation
//
//  Created by alexey sorochan on 28.12.2019.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
        cell.updateCell(student: students[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "ProfileViewController") as! ProfileViewController
        viewController.recieveProfile = students[indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
    }
}
