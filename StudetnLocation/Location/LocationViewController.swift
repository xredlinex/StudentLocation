//
//  LocationViewController.swift
//  StudetnLocation
//
//  Created by alexey sorochan on 27.12.2019.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class LocationViewController: UIViewController {
    
    @IBOutlet weak var mapView: GMSMapView!
    
    var students: [StudentProfile] = []
    var recieveData: StudentProfile?
    var defaultLatitude = 50.4304436
    var defaultLongitutde = 30.5645016
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let student = recieveData {
            students.append(student)
            _ = setMarkers(students)
        } else {
            students = StudentsInfo().getStudents()
            _ = setMarkers(students)
        }
        setCameraView()
        mapView.delegate = self
    }

    @IBAction func didTapViewListActionButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "ListViewController") as! ListViewController
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func didTapShowAllLocationsActionButton(_ sender: Any) {
        students = StudentsInfo().getStudents()
        _ = setMarkers(students)
        setCameraView()
    }
}
