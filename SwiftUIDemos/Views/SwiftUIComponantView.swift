//
//  SwiftUIComponantView.swift
//  SwiftUIDemos
//
//  Created by mukesh on 25/05/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import SwiftUI
import SwiftUI

/// The type of view representing the body of this view.
///
/// When you create a custom view, Swift infers this type from your
/// implementation of the required `body` property.

struct SwiftUIComponantView: View {
//    @State private var experience = 1
//    @State private var gender = ["male","female","transg"]
    
    @State private var experience = 1
    @State private var temperature: Double = 0
    @State var percentage: Float = 50

    var body: some View {
//        List(0 ..< 10){ item in
//            HStack{
//
//            Image(systemName: "photo")
//            VStack{
//                Text("Welcome to SwiftUI")
//                Text("Welcome to SwiftUI1")
//
//                }
//
//            }
//        }.navigationBarTitle("List view", displayMode: .inline)
        
//        Rectangle()
//            .fill(Color.red)
//            .frame(width:150, height:100)
        

        
//        VStack {
//            Stepper("Your experience",onIncrement: {
//                self.experience += 1
//            },onDecrement: {
//                self.experience -= 1
//            })//value: $experience, in: 0...15)
//                   Text("Your experience is \(experience)")
//               }
        
//        Form{
//            Section{
//                Picker(selection: $gender, label: Text("Gender")) {
//                    ForEach(0 ..< gender.count){
//                        Text(self.gender[$0])
//                    }
//                }.pickerStyle(WheelPickerStyle())
//            }
//        }
        
        VStack {
            
            Stepper("Your experience",value: $experience, in: 0...15)
            Text("Your experience is \(experience)")
            
            VStack {
                Slider(value: $temperature, in: -50...100, step: 0.1)
                Text("\(temperature) Temperature is \(temperature * 9 / 5 + 32) Fahrenheit")
            }
            
            CustomView(percentage: $percentage)
                            .accentColor(.red)
                            .frame(width: 200, height: 44)
//            https://github.com/spacenation/swiftui-sliders
            
            //https://github.com/AvdLee/SwiftUIKitView.git
        }
        
    }
}

//PreviewProvider is a protocol used for generating previews that you can see on the right-hand side in Xcode.
// generates previews in the canvas for each provider it discovers.
struct SwiftUIComponantView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIComponantView()
    }
}



/*
 @State private var experience = 1

 
 VStack {
            Stepper("Your experience",value: $experience, in: 0...15)
            Text("Your experience is \(experience)")
        }
 */



/*
 
 @State private var gender = ["male","female","transg"]

 
 Form{
     Section{
         Picker(selection: $gender, label: Text("Gender")) {
             ForEach(0 ..< gender.count){
                 Text(self.gender[$0])
             }
         }.pickerStyle(WheelPickerStyle())
     }
 }
 
 */

/*
 @State private var temperature: Double = 0

 VStack {
     Slider(value: $temperature, in: -50...100, step: 0.1)
     Text("\(temperature) Temperature is \(temperature * 9 / 5 + 32) Fahrenheit")
 }
 */

struct CustomView: View {

    @Binding var percentage: Float // or some value binded

    var body: some View {
        GeometryReader { geometry in
            // TODO: - there might be a need for horizontal and vertical alignments
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.gray)
                Rectangle()
                    .foregroundColor(.accentColor)
                    .frame(width: geometry.size.width * CGFloat(self.percentage / 100))
            }
            .cornerRadius(12)
            .gesture(DragGesture(minimumDistance: 0)
                .onChanged({ value in
                    // TODO: - maybe use other logic here
                    self.percentage = min(max(0, Float(value.location.x / geometry.size.width * 100)), 100)
                }))
        }
    }
}
