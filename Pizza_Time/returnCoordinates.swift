//
//  returnCoordinates.swift
//  Pizza_Time
//
//  Created by Matthew Zahar on 4/18/20.
//  Copyright © 2020 mzahar. All rights reserved.
//

import SwiftUI
import CoreLocation

struct returnCoordinates: View {
    let city: String

    var body: some View {
        switch  city{
        case "Burlington":
            return
        case "South Burlington":
            return
        case "Winooski":
            return
        case "Essex":
            return
        default :
            return
        }
    }
}

struct returnCoordinates_Previews: PreviewProvider {
    static var previews: some View {
        returnCoordinates(city: "Burlington")
    }
}
