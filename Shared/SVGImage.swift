//
//  SVGImage.swift
//  LazyView
//
//  Created by Jakub Kozlowicz on 26.03.21.
//

import Foundation
import SwiftUI
import UIKit
import Macaw



struct SVGImage: UIViewRepresentable {
    init(_ svgName: String) {
        self.svgName = svgName
    }
    
    var svgName: String
    
    func makeUIView(context: Context) -> SVGView {
        let svgView = SVGView()
        svgView.backgroundColor = UIColor(white: 1.0, alpha: 0.0)   // otherwise the background is black
        svgView.fileName = self.svgName
        svgView.contentMode = .scaleToFill
        return svgView
    }

    func updateUIView(_ uiView: SVGView, context: Context) {

    }

}
