//
//  DotaProfileCard.swift
//  OpenDota+
//
//  Created by 姚一鸣 on 2022/1/5.
//

import Kingfisher
import SwiftUI

struct DotaProfileCard: View {
    @Environment(\.colorScheme) var colorScheme

    @State var values: [Double] = [500, 320]
    var colors: [Color] = [Color.green, Color.red]

    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size

            ZStack {
                // 分段
                HStack {
                    Spacer()
                    ZStack {
                        KFImage(URL(string: "https://www.opendota.com/assets/images/dota2/rank_icons/rank_icon_3.png")!)
                            .resizable()
                            .frame(width: 92, height: 92, alignment: .center)
                        KFImage(URL(string: "https://www.opendota.com/assets/images/dota2/rank_icons/rank_star_4.png")!)
                            .resizable()
                            .frame(width: 92, height: 92, alignment: .center)
                    }
                    .padding()
                    .mask(
                        LinearGradient(gradient:
                            Gradient(colors: [Color.black.opacity(0), Color.black]), startPoint: .leading, endPoint: .trailing)
                            .frame(width: 92)
                    )
                }
                
                VStack {
                    // 头像、昵称
                    HStack {
                        KFImage(URL(string: "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/2c/2ceeded15edf102e999eeb24ffc9f91789b8fd0a_full.jpg")!)
                            .placeholder { Image("avatar_placeholder").resizable().frame(width: 36, height: 36, alignment: .center).scaledToFill() }
                            .resizable()
                            .frame(width: 36, height: 36, alignment: .center)
                            .cornerRadius(24)
                            .padding(.trailing, 8)
                        Text("shockjockey")
                            .bold()
                            .font(.custom("Reaver-Bold", size: 26))
                            .lineLimit(1)
                        Spacer()
                    }
                    
                    Spacer()
                    
                    // 胜率
                    //SegmentedBar(values: $values, colors: colors, isVertical: false)
                    //    .frame(height: 6, alignment: .center)
                }
                .padding()
                // .frame(width: abs(size.width - 60), height: 150, alignment: .leading)
            }
            .frame(width: abs(size.width - 40), height: 150, alignment: .center)
            .background(colorScheme == .light ? Color(red: 246/255.0, green: 246/255.0, blue: 246/255.0) : Color(.white).opacity(0.1))
            .cornerRadius(6)
            .padding(.horizontal, 20)
        }
    }
}

struct DotaProfileCard_Previews: PreviewProvider {
    static var previews: some View {
        DotaProfileCard()
    }
}
