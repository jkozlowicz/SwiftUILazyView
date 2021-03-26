//
//  LazyViewRowItem.swift
//  LazyView
//
//  Created by Jakub Kozlowicz on 26.03.21.
//

import SwiftUI


struct LazyViewRowItem: View {
    let item: MyGroupItem
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(radius: 5, x: 1, y: 1)
            
            VStack(alignment: .leading, spacing: 15) {
                
                HStack {
                    Spacer()
                    SVGImage(item.image)
                        .frame(width: 100, height: 100)
                    Spacer()
                }
                
                HStack {
                    Text(item.title)
                        .bold()
                    Spacer()
                }
                
                HStack {
                    Text(item.description)
                    Spacer()
                }
            }
            .padding()
        }
        .frame(width: 200, height: 250)
    }
}
