//
//  LocationManager.swift
//  Country List
//
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    private let geocoder = CLGeocoder()

    @Published var countryName: String = "" 
    @Published var permissionDenied = false

    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latest = locations.first else { return }

        // Reverse geocode to get country
        geocoder.reverseGeocodeLocation(latest) { [weak self] placemarks, error in
            if let country = placemarks?.first?.country {
                DispatchQueue.main.async {
                    self?.countryName = country
                }
            } else {
                print("Reverse geocoding failed: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .denied {
            permissionDenied = true
        }
    }
}
