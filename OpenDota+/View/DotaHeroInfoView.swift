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
        KFImage(URL(string: "https://cdn.cloudflare.steamstatic.com" + dotaHero.img)!)
            .placeholder { Image("item_placeholder").resizable().scaledToFill().frame(width: 128, height: 72, alignment: .center) }
            .resizable()
            .frame(width: 128, height: 72, alignment: .leading)
            .scaledToFill()
            .cornerRadius(4)
            .shadow(radius: 10)
        Text(dotaHero.localized_name ?? "Unknown").bold()
    }
}
