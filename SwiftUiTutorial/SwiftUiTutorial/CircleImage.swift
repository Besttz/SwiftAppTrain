//
//  CircleImage.swift
//  SwiftUiTutorial
//
//  Created by ZhangTommy on 27/6/20.
//  Copyright © 2020 Tommy Zhang. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("turtlerock")
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 10)
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
