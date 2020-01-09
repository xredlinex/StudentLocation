//
//  LocationViewController+Extension.swift
//  StudetnLocation
//
//  Created by alexey sorochan on 28.12.2019.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

// MARK: - set default map view
extension LocationViewController {
    
    func setCameraView() {
        var locations: [CLLocationCoordinate2D] = []
        
        for student in students {
            if let latitude = student.studentlatitude, let longitude = student.studentLongitude {
                locations.append(CLLocationCoordinate2DMake(latitude, longitude))
            }
        }
        if locations.count == 1 {
            guard let latitude = locations.first?.latitude, let longitude = locations.first?.longitude else {
                return
            }
            let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 18)
            mapView.camera = camera
        } else if locations.count > 1 {
            let marker: GMSMarker = GMSMarker(position: locations.first ?? CLLocationCoordinate2D(latitude: defaultLatitude,
                                                                                                  longitude: defaultLongitutde))
            var bounds = GMSCoordinateBounds(coordinate: marker.position, coordinate: marker.position)
            for location in locations {
                bounds = bounds.includingCoordinate(location)
                let camera = GMSCameraUpdate.fit(bounds, withPadding: CGFloat(60))
                self.mapView.animate(with: camera)
            }
        } else {
            let alert = UIAlertController(title: "Sorry", message: "No Student Locations Found", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: .default) { (_) in}
            alert.addAction(alertAction)
            present(alert, animated: true)
        }
    }

//  MARK: - set markers
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
                viewCotnroller.hideShowLocationButton = true
            }
        }
        navigationController?.pushViewController(viewCotnroller, animated: true)
        return true
    }
}
