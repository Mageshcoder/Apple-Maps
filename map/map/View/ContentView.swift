//
//  ContentView.swift
//  map
//
//  Created by DB-MM-011 on 13/06/23.
//

import SwiftUI
import CoreLocation
import Foundation

struct ContentView: View {

    @StateObject private var viewModel = MapViewModel()

    var body: some View {

        VStack {
            Text("Location Finder")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.green)
                .font(.system(size: 26))

            TextField("Enter location ", text: $viewModel.location)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(.blue)
                            .font(.body)
                            .cornerRadius(6)
                            .padding()
            MapView()
                .environmentObject(viewModel)
                .frame(height: 500)
                }
        .padding()

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
