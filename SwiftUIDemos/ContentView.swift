//
//  ContentView.swift
//  SwiftUIDemos
//
//  Created by mukesh on 25/05/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
//    @EnvironmentObject var appUtil : AppUtil
    
    var body: some View {
        NavigationView{
            VStack{
//                Button(action: {
//                    self.appUtil.count += 1
//                }) {
//                    Text("Button Tap")
//                }
                
                List(demos){ demo in
                    DemoCell(demo:demo)
                }.navigationBarTitle("SwiftUI")
            }
        }
    }
}

struct DemoCell: View {
    var demo: Demo
    
    var body: some View {
        NavigationLink(destination: getDestination(demo: demo)){
            HStack{
                Image(demo.thumbnailImage)
                    .cornerRadius(8)
                VStack(alignment: .leading, spacing: 10){
                    Text(demo.name)
                    Text(demo.demoDescription)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
    }

    fileprivate func getDestination(demo: Demo) -> AnyView  {
        
        switch demo.viewType {
            case .SwiftUICompo:
                return AnyView(SwiftUIComponantView())
            case .Registration:
                return AnyView(RegistrationView())
            case .Overlay:
                return AnyView(OverlayView())
            case .ImageView:
                return AnyView(ImageView(demo: demo))
            case .CardDemo:
                return AnyView(CardDemo(demo: demo))
            case .Animation:
                return AnyView(AnimationView())
            case .Gesture:
                return AnyView(GestureDemoView())
            case .GridLayout:
                return AnyView(GridLayoutView())
            case .PathShapes:
                return AnyView(PathShapeView())
            case .CombineSwift:
                return AnyView(CombineSwiftDemo(demo: demo))
            case .APICall:
                return AnyView(APICallDemo())
           case .CombineDemo2:
                return AnyView(CombineDemo2View())
           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}

