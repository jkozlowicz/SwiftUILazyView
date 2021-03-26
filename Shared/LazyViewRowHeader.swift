//
//  LazyViewRowHeader.swift
//  LazyView
//
//  Created by Jakub Kozlowicz on 26.03.21.
//

import SwiftUI

struct LazyViewRowHeader: View {
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title)
                .bold()
                .padding(.bottom, 5)
            Spacer()
            
            NavigationLink(destination: EmptyView()) {
                Text("See all")
                    .font(.headline)
                    .foregroundColor(.blue)
            }
        }
        .padding(.horizontal)
    }
}
