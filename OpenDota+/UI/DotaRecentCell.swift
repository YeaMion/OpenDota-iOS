//
//  DotaRecentMatchCell.swift
//  OpenDota+
//
//  Created by 姚一鸣 on 2021/12/21.
//

import Kingfisher
import SwiftUI

struct DotaRecentCell: View {
    @Environment(\.colorScheme) var colorScheme
    var recent: DotaMatchModel

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                HStack {
                    Text(recent.heroName)
                        .font(.system(size: recent.heroName.count > 12 ? 14 : 18))
                        .bold()
                    Text(recent.winLost ? "W" : "L")
                        .font(.system(size: 8))
                        .frame(width: 12, height: 12, alignment: .center)
                        .background(recent.winLost ? .green : .red)
                        .cornerRadius(2)
                }
                .padding(.top, 6)
                .padding(.bottom, 4)
                Text("KDA: \(recent.KDA)")
                    .font(.system(size: 13))
                    .opacity(0.8)
                Text("LH/DN: \(recent.LD)")
                    .font(.system(size: 13))
                    .opacity(0.8)
                Spacer()
                Text(recent.playTime)
                    .font(.system(size: 12))
                    .opacity(0.5)
                    .padding(.bottom, 8)
            }
            .padding(.top, 8)
            .padding(.leading, 12)

            Spacer(minLength: 170)
        }
        .frame(height: 105, alignment: .bottom)
        .background(colorScheme == .light ? Color(red: 246/255.0, green: 246/255.0, blue: 246/255.0) : Color(.white).opacity(0.1))
        .cornerRadius(6)
        .overlay(
            KFImage(URL(string: "https://cdn.cloudflare.steamstatic.com/apps/dota2/images/dota_react/heroes/crops/\(recent.heroKey).png")!)
                .resizable()
                .frame(width: 180, height: 120, alignment: .center)
                .cornerRadius(6),
            alignment: .bottomTrailing)
    }
}
