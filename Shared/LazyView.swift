//
//  LazyView.swift
//  LazyView
//
//  Created by Jakub Kozlowicz on 26.03.21.
//

import SwiftUI


struct LazyView: View {
    @ObservedObject var viewModel = LazyViewModel()
    @State var useLazyContainer = true
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .center) {
                GeometryReader { geometry in
                    ScrollView {
                        if useLazyContainer {
                            LazyVStack(alignment: .leading) {
                                LazyViewContent(viewModel: viewModel)
                            }
                        } else {
                            VStack(alignment: .leading) {
                                LazyViewContent(viewModel: viewModel)
                            }
                        }
                    }
                    
                    if viewModel.isLoadingGroups {
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                ProgressView()
                                Spacer()
                            }
                            Spacer()
                        }
                    }
                    
                }
                
            }
            .navigationTitle("LazyView")
            .toolbar {
                Button(action: {
                    self.useLazyContainer.toggle()
                }
                ) {
                    Text("Switch to " + (useLazyContainer ? "VStack" : "LazyVStack"))
                        .foregroundColor(.blue)
                        .bold()
                }
            }
            .onAppear {
                self.viewModel.fetchGroups()
            }
            
        }
    }
}

struct LazyView_Previews: PreviewProvider {
    static var previews: some View {
        LazyView()
    }
}
