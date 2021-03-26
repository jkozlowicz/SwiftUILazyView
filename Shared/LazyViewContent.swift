//
//  LazyViewContent.swift
//  LazyView
//
//  Created by Jakub Kozlowicz on 26.03.21.
//

import SwiftUI


struct LazyViewContent: View {
    @ObservedObject var viewModel: LazyViewModel
    
    var body: some View {
        ForEach(viewModel.groups, id: \.id) { group in
            VStack(alignment: .leading) {
                LazyViewRowHeader(title: group.title)
                    .padding(.leading, 5)
                
                if let items = viewModel.groupItems[group.id] {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 25) {
                            ForEach(items, id: \.id) { item in
                                LazyViewRowItem(item: item)
                            }
                        }
                        .padding()
                    }
                    .padding(.bottom)
                } else {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 25) {
                            ForEach([0, 1, 2, 3].indices) { index in
                                VStack {
                                    Spacer()
                                    HStack {
                                        Spacer()
                                        ProgressView()
                                        Spacer()
                                    }
                                    Spacer()
                                }
                                .frame(width: 200, height: 250)
                            }
                        }
                        .padding()
                    }
                    .padding(.bottom)
                }
            }
            .onAppear {
                if self.viewModel.groupItems[group.id] == nil {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation {
                            self.viewModel.fetchGroupItems(group: group)
                        }
                    }
                }
            }
        }
    }
}
