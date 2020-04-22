//
//  MapView.swift
//  Pizza_Time
//
//  Created by Matthew Zahar on 4/18/20.
//  Copyright © 2020 mzahar. All rights reserved.
//

import SwiftUI
import MapKit
 
struct MapView: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D

    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello")
    }
}