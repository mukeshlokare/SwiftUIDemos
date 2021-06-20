//
//  OverlayView.swift
//  SwiftUIDemos
//
//  Created by mukesh on 26/05/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import SwiftUI

struct OverlayView: View {
    @State private var showingOverlay = false
        var body: some View {
            ZStack {
                VStack {
                    Text("Hello World")
                }
                .background(
                        Rectangle()
                            .fill(Color.purple)
                            .frame(width: 300, height: 300)
                )
                .onAppear {
                        self.showingOverlay.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            self.showingOverlay.toggle()
                        }
                }

                if showingOverlay {
                    Rectangle()
                        .stroke(Color.blue, lineWidth: 5)
                        .frame(width: 300, height: 300)
                        .transition(.asymmetric(insertion: .move(edge: .top), removal: .opacity))
                        .animation(.easeInOut(duration: 1))
                }
            }
        }
}

struct OverlayView_Previews: PreviewProvider {
    static var previews: some View {
        OverlayView()
    }
}
