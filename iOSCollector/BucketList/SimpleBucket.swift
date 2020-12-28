//
//  SimpleBucket.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/27.
//

import SwiftUI
import MapKit

struct SimpleBucket: View {
    
    @State private var centerCoordinate = CLLocationCoordinate2D()
    
    @State private var locations = [MKPointAnnotation]()
    
    @State private var selectedPlace: MKPointAnnotation?
    @State private var showingPlaceDetails = false
    
    var body: some View {
        ZStack {
            SimpleMapView(
                    centerCoordinate: $centerCoordinate,
                    annotations: locations,
                    selectedPlace: $selectedPlace,
                    showingPlaceDetails: $showingPlaceDetails)
                .edgesIgnoringSafeArea(.all)
            Circle()
                .fill(Color.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        let newLocation = MKPointAnnotation()
                        newLocation.coordinate = self.centerCoordinate
                        newLocation.title = "Example location"
                        self.locations.append(newLocation)
                    }, label: {
                        Image(systemName: "plus")
                    })
                    .padding()
                    .background(Color.black.opacity(0.75))
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                }
            }
        }.alert(isPresented: $showingPlaceDetails) {
            Alert(title: Text(selectedPlace?.title ?? "Unknown"),
                  message: Text(selectedPlace?.subtitle ?? "Missinplace information."),
                  primaryButton: .default(Text("OK")),
                  secondaryButton: .default(Text("Edit")) {
                // edit this place
            })
        }
    }
}

struct SimpleBucket_Previews: PreviewProvider {
    static var previews: some View {
        SimpleBucket()
    }
}
