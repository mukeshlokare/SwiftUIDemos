//
//  Demo.swift
//  SwiftUIDemos
//
//  Created by mukesh on 25/05/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import Foundation
import SwiftUI

struct Demo: Identifiable {
    
    var id = UUID()
    var name : String
    var description: String
    var image: String
    var viewType: ViewType

    var demoName: String { return name }
    var demoDescription: String { return description }
    var thumbnailImage: String { return image }
}

enum ViewType: CaseIterable {
    case SwiftUICompo
    case Registration
    case Overlay
    case ImageView
    case CardDemo
    case Animation
    case Gesture
    case GridLayout
    case PathShapes
    case CombineSwift
    case APICall
    case CombineDemo2
}
