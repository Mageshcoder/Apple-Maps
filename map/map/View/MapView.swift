import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {

    @EnvironmentObject var viewModel: MapViewModel

    typealias UIViewType = MKMapView
    
    var locationManager = CLLocationManager()
    
    func setupManager() {
      locationManager.desiredAccuracy = kCLLocationAccuracyBest
      locationManager.requestWhenInUseAuthorization()
      locationManager.requestAlwaysAuthorization()
    }
    
  
    func makeUIView(context: Context) -> MKMapView {
      setupManager()
      let mapView = MKMapView(frame: UIScreen.main.bounds)
      mapView.showsUserLocation = true
      mapView.userTrackingMode = .follow
        
    print(mapView)
      return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
     
        let cityName = viewModel.location
        let geocoder = CLGeocoder()
        
        print("update ui view called")
               geocoder.geocodeAddressString(cityName) { (placemarks, error) in
                   if let placemark = placemarks?.first {
                       if let location = placemark.location {

                           let annotation = MKPointAnnotation()
                           annotation.coordinate = location.coordinate
                           annotation.title = cityName
                           uiView.addAnnotation(annotation)

                           let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 100000, longitudinalMeters: 10000)
                           uiView.setRegion(region, animated: true)
                       }
                   }
               }
    }

    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        print("dismantle ui view called")
    }
}
