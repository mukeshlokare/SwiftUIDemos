//
//  AnimationView.swift
//  SwiftUIDemos
//
//  Created by mukesh on 26/05/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import SwiftUI

let p1 = CGPoint(x: 50, y: 50)
let p2 = CGPoint(x: 100, y: 25)
let p3 = CGPoint(x: 100, y: 100)

struct AnimationView: View {
    @State var toggle = true
    var body: some View {
        VStack {
            Button("Toggle") {
                withAnimation { self.toggle.toggle() }
            }
            Path { p in
                p.move(to: toggle ? p1 : p2)
                p.addLine(to: p3)
            }.stroke(lineWidth: 2)
        }
    }
}

struct Line: Shape {
    var start, end: CGPoint

    func path(in rect: CGRect) -> Path {
        Path { p in
            p.move(to: start)
            p.addLine(to: end)
        }
    }
}
struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
