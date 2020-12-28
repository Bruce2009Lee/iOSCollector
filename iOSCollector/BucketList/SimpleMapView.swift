//
//  SimpleMapView.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/27.
//

import SwiftUI
import MapKit

struct SimpleMapView: UIViewRepresentable {
    
    @Binding var centerCoordinate: CLLocationCoordinate2D
    
    var annotations: [MKPointAnnotation]
    
    @Binding var selectedPlace: MKPointAnnotation?
    @Binding var showingPlaceDetails: Bool
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        if annotations.count != view.annotations.count {
            view.removeAnnotations(view.annotations)
            view.addAnnotations(annotations)
        }
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: SimpleMapView
        
        init(_ parent: SimpleMapView) {
            self.parent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            parent.centerCoordinate = mapView.centerCoordinate
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            // 这是我们视图重用的唯一标识符
            let identifier = "Placemark"
            
            // 试图找到一个我们可以回收的视图
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            if annotationView == nil {
                // 我们找不到一个；创建一个新的
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                
                // 允许它显示弹出信息
                annotationView?.canShowCallout = true
                
                // 将信息按钮附加到视图
                annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            } else {
                // 我们有一个重用的视图，所以给它新的标注
                annotationView?.annotation = annotation
            }
            
            // 无论是新视图还是复用视图，都将其返回
            return annotationView
        }
        
        func mapView(_ mapView: MKMapView,
                       annotationView view: MKAnnotationView,
                       calloutAccessoryControlTapped control: UIControl) {

            guard let placemark = view.annotation as? MKPointAnnotation else { return }

            parent.selectedPlace = placemark
            parent.showingPlaceDetails = true
        }
    }
}

extension MKPointAnnotation {
    
    static var example: MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.title = "London"
        annotation.subtitle = "Home to the 2012 Summer Olympics."
        annotation.coordinate = CLLocationCoordinate2D(latitude: 51.5, longitude: -0.13)
        return annotation
    }
}

struct SimpleMapView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleMapView(
            centerCoordinate: .constant(MKPointAnnotation.example.coordinate), annotations:[MKPointAnnotation.example],
            selectedPlace: .constant(MKPointAnnotation.example),
            showingPlaceDetails: .constant(false))
    }
}
