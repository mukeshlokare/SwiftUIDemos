//
//  CombineSwiftDemo.swift
//  SwiftUIDemos
//
//  Created by mukesh on 26/05/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import SwiftUI

//Customize handling of asynchronous events by combining event-processing operators.
//The Combine framework provides a declarative Swift API for processing values over time. These values can represent many kinds of asynchronous events. Combine declares publishers to expose values that can change over time, and subscribers to receive those values from the publishers.

//Use @State for simple properties that belong to a single view. They should usually be marked private.
//Use @ObservedObject for complex properties that might belong to several views. Any time you’re using a reference type you should be using @ObservedObject for it.
//Use @EnvironmentObject for properties that were created elsewhere in the app, such as shared data.

struct CombineSwiftDemo: View {
    var demo: Demo
    @ObservedObject var viewModel = SearchUserViewModel()

    var body: some View {
            VStack {
                SearchUserBar(text: $viewModel.name) {
                    self.viewModel.search()
                }

                List(viewModel.users) { user in
                    SearchUserRow(viewModel: self.viewModel, user: user)
                        .onAppear { self.viewModel.fetchImage(for: user) }
                }
                }
                .navigationBarTitle(
                Text(demo.name),
                displayMode: .inline)
    }
}
