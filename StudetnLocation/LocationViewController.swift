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
    var defaultZoom: Float = 11
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let student = recieveData {
            students.append(student)
            _ = setMarkers(students)
        } else {
            students = StudentsInfo().getStudents()
            _ = setMarkers(students)
        }
        setDefaultCameraView()
        mapView.delegate = self
    }

    @IBAction func didTapViewListActionButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "ListViewController") as! ListViewController
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - Set markers and cordinates
extension LocationViewController {
    
    func setDefaultCameraView() {
        var customLatitude = Double()
        var customLongitude = Double()
        var countLocations: Double = 0
        
        for student in students {
            if student.studentlatitude != nil && student.studentLongitude != nil {
                countLocations += 1
                if let latitude = student.studentlatitude {
                    customLatitude += latitude
                }
                if let longitude = student.studentLongitude {
                    customLongitude += longitude
                }
            }
            if countLocations > 1 {
                defaultLatitude = customLatitude / countLocations
                defaultLongitutde = customLongitude / countLocations
                defaultZoom = 13
            } else if countLocations == 1 {
                defaultLatitude = customLatitude
                defaultLongitutde = customLongitude
                defaultZoom = 18
            }
        }
        let camera = GMSCameraPosition.camera(withLatitude: defaultLatitude,
                                              longitude: defaultLongitutde,
                                              zoom: defaultZoom)
        mapView.camera = camera
    }
    
    func setMarkers(_ profile: [StudentProfile]) -> [GMSMarker] {
        var markers: [GMSMarker] = []
        
        for studetns in profile {
            if let latitude = studetns.studentlatitude, let longitude = studetns.studentLongitude {
                let cordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                let marker = GMSMarker()
                marker.position = cordinate
                markers.append(marker)
                marker.accessibilityLabel = studetns.studentId
                marker.map = mapView
            }
        }
        return markers
    }
}

//  MARK: - Map Delegate
extension LocationViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewCotnroller = storyboard.instantiateViewController(identifier: "ProfileViewController") as! ProfileViewController
        for student in students {
            if student.studentId == marker.accessibilityLabel {
                viewCotnroller.recieveProfile = student
            }
        }
        navigationController?.pushViewController(viewCotnroller, animated: true)
        return true
    }
}

