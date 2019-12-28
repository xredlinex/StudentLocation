//
//  ListViewController.swift
//  StudetnLocation
//
//  Created by alexey sorochan on 27.12.2019.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var students: [StudentProfile] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        students = StudentsInfo().getStudents()

    }
    
    @IBAction func didTapGoBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    
}
