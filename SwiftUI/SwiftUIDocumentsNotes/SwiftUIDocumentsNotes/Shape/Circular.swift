//
//  Circular.swift
//  SwiftUIDocumentsNotes
//
//  Created by engin gülek on 31.12.2022.
//

import SwiftUI

struct Circular: View {
    let lineWidth : CGFloat
    let backgoroundColor : Color
    let foregroundColor : Color
    let percentage : Double
    var body: some View {
        GeometryReader { geometry in
            
            ZStack {
                CircularShape()
                    .stroke(style: StrokeStyle(lineWidth: lineWidth))
                    .fill(backgoroundColor)
                
                CircularShape(percent: percentage)
                    .stroke(style: StrokeStyle(lineWidth: lineWidth))
                    .fill(foregroundColor)
            }
            .animation(.easeIn(duration: 1.0), value: percentage)
            .padding(.horizontal)
            
        }
    }
}

struct Circular_Previews: PreviewProvider {
    static var previews: some View {
        Circular(lineWidth: 20, backgoroundColor: .red, foregroundColor: .green, percentage: 60)
    }
}
