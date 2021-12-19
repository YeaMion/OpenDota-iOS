//
//  DotaHeroInfoView.swift
//  OpenDota+
//
//  Created by 姚一鸣 on 2021/12/14.
//

import Kingfisher
import SwiftUI

struct DotaHeroInfoView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var dotaData: DotaData
    var dotaHero: DotaHeroModel

    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    KFImage(URL(string: "https://dotabase.dillerm.io/dota-vpk/panorama/images/heroes/selection/" + dotaHero.name + "_png.png")!)
                        .placeholder { Image("item_placeholder").resizable().scaledToFill().frame(width: 71, height: 94, alignment: .center).scaledToFill() }
                        .resizable()
                        .frame(width: 71, height: 94, alignment: .leading)
                        .scaledToFill()
                        .cornerRadius(4)
                        .shadow(radius: 10)
                    Spacer()
                }
                .padding(.leading, 16)
                .padding(.top, 18)
                .padding(.bottom, 12)
            }
            .navigationBarTitle(dotaHero.localized_name ?? "Unknown")
        }
    }
}
