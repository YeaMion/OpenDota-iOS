//
//  DotaHomeView.swift
//  OpenDota+
//
//  Created by 姚一鸣 on 2021/12/19.
//

import Kingfisher
import SwiftUI

struct DotaPostView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var dotaData: DotaData
    @State var currentIndex: Int = 0

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    Divider()
                    HStack {
                        Text("Recent")
                            .font(.title2)
                            .bold()
                        Spacer()
                    }
                    .padding(.leading, 20)

                    DotaRecentSnapCarousel(trailingSpace: 70, index: $currentIndex, items: dotaData.dotaRecentMatchedList, content: { match in
                        GeometryReader { proxy in
                            let size = proxy.size

                            DotaRecentCell(recent: match)
                                .frame(width: size.width)
                        }
                    })

//                    ScrollView(.horizontal, showsIndicators: false) {
//                        HStack(alignment: .top, spacing: 0) {
//                            Spacer(minLength: 12)
//                            DotaRecentCell()
//                            Spacer(minLength: 12)
//                        }
//                    }
                }
            }
            .navigationTitle("Dota")
        }
    }
}

struct DotaHomeView_Previews: PreviewProvider {
    static var previews: some View {
        DotaPostView()
    }
}
