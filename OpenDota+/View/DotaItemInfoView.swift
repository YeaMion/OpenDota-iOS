//
//  DotaItemInfoView.swift
//  OpenDota+
//
//  Created by 姚一鸣 on 2021/12/11.
//

import Kingfisher
import MapKit
import SwiftUI

struct DotaItemInfoView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var dotaData: DotaData
    var dotaItem: DotaItemModel

    var body: some View {
        ScrollView {
            VStack {
                // 标题
                HStack {
                    KFImage(URL(string: "https://steamcdn-a.akamaihd.net" + dotaItem.img)!)
                        .placeholder { Image("item_placeholder").resizable().frame(width: 85, height: 64, alignment: .center).scaledToFill() }
                        .resizable()
                        .frame(width: 85, height: 64, alignment: .leading)
                        .cornerRadius(4)
                        .scaledToFill()
                        .shadow(radius: 10)
                    VStack {
                        HStack {
                            Text(dotaItem.dname ?? "Unknown")
                                .font(.title3)
                                .bold()
                                .lineLimit(1)
                            Spacer()
                        }
                        HStack {
                            Image("gold")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 17, alignment: .leading)
                            switch dotaItem.cost {
                            case .string(let cst): Text(cst).foregroundColor(Color(red: 196/255.0, green: 151/255.0, blue: 53/255.0))
                            case .int(let cst): Text(String(cst)).foregroundColor(Color(red: 196/255.0, green: 151/255.0, blue: 53/255.0))
                            case .none: Text("0").foregroundColor(Color(red: 196/255.0, green: 151/255.0, blue: 53/255.0))
                            }

                            switch dotaItem.tier {
                            case .string(let ti):
                                if ti != "0" && ti != "" {
                                    Text("TIER \(ti)")
                                        .font(.system(size: 12))
                                        .opacity(0.7)
                                        .frame(width: 48, height: 18, alignment: .center)
                                        .background(colorScheme == .light ? Color(red: 236/255.0, green: 236/255.0, blue: 236/255.0) : Color(.white).opacity(0.2))
                                        .cornerRadius(3)
                                }
                            case .int(let ti):
                                if ti > 0 {
                                    Text("TIER \(String(ti))")
                                        .font(.system(size: 12))
                                        .opacity(0.7)
                                        .frame(width: 48, height: 18, alignment: .center)
                                        .background(colorScheme == .light ? Color(red: 236/255.0, green: 236/255.0, blue: 236/255.0) : Color(.white).opacity(0.2))
                                        .cornerRadius(3)
                                }
                            case .none: Text("").frame(width: 0, height: 0).clipped()
                            }
                            Spacer()
                        }
                        Spacer()
                    }
                    Spacer()
                }
                .padding(.leading, 16)
                .padding(.top, 18)
                .padding(.bottom, 12)

                // 效果介绍
                switch dotaItem.hint {
                case .string(let hin):
                    if hin.count > 0 {
                        HStack {
                            Text(hin)
                                .padding(.leading, 16)
                                .padding(.trailing, 16)
                                .padding(.bottom, 4)
                            Spacer()
                        }
                    }
                case .none: Text("").frame(width: 0, height: 0)
                }

                // 额外备注, 绿字
                switch dotaItem.notes {
                case .string(let note):
                    if note.count > 0 {
                        HStack {
                            Text(note)
                                .padding(.leading, 16)
                                .padding(.trailing, 16)
                                .padding(.bottom, 4)
                                .foregroundColor(Color(red: 34/255.0, green: 156/255.0, blue: 34/255.0))
                                .font(.system(size: 14))
                            Spacer(minLength: 0)
                        }
                    }
                case .none: Text("").frame(width: 0, height: 0)
                }

                // 加成数据
                if dotaItem.attrib?.count ?? 0 > 0 {
                    VStack {
                        if dotaItem.attrib != nil {
                            ForEach(Array((dotaItem.attrib?.enumerated())!), id: \.1) { _, att in
                                HStack {
                                    Text(att.header ?? "")
                                    switch att.value {
                                    case .string(let val): Text(val)
                                    case .none: Text("")
                                    }
                                    Text(att.footer ?? "")
                                    Spacer()
                                }
                                .padding(.leading, 16)
                                .padding(.trailing, 16)
                                .font(.system(size: 14))
                                .opacity(0.7)
                            }
                        }
                    }
                }

                // 魔法消耗和冷却时间
                HStack {
                    Image("mana")
                        .resizable()
                        .frame(width: 11, height: 11, alignment: .center)
                        .cornerRadius(2)
                    switch dotaItem.mc {
                    case .string(let mana): Text(mana).font(.system(size: 14))
                    case .int(let mana): Text(String(mana)).font(.system(size: 14))
                    case .none: Text("0")
                    }
                    Image("cooldown")
                        .resizable()
                        .frame(width: 11, height: 11, alignment: .center)
                        .cornerRadius(2)
                        .padding(.leading, 4)
                    switch dotaItem.cd {
                    case .string(let cd): Text(cd).font(.system(size: 14))
                    case .int(let cd): Text(String(cd)).font(.system(size: 14))
                    case .none: Text("0")
                    }
                    Spacer()
                }
                .padding(.leading, 20)

                // 背景介绍
                switch dotaItem.lore {
                case .string(let lor):
                    if lor.count > 0 {
                        HStack { Text(lor)
                            .padding(.leading)
                            .padding(.trailing)
                            .padding(.top, 8)
                            .padding(.bottom, 8)
                            .opacity(0.5)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                RoundedRectangle(cornerRadius: 4, style: .continuous).fill(colorScheme == .light ? Color(red: 246/255.0, green: 246/255.0, blue: 246/255.0) : Color(.white).opacity(0.1))
                            )
                        }
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                    }
                case .none: Text("").frame(width: 0, height: 0)
                }

                // 合成
                switch dotaItem.components {
                case .stringArray(let components):
                    if components.count > 0 {
                        VStack {
                            HStack {
                                Text("Recipe: ")
                                    .opacity(0.7)
                                    .font(.system(size: 14))
                                Spacer()
                            }
                            .padding(.leading, 20)
                            .padding(.top, 10)
                            ScrollView(.horizontal) {
                                HStack(alignment: .top, spacing: 0, content: {
                                    ForEach(Array(components.enumerated()), id: \.1) { _, component in
                                        let com = dotaData.dotaItemsDict[component]
                                        if com != nil {
                                            NavigationLink(
                                                destination: DotaItemInfoView(dotaItem: com!)) {
                                                    KFImage(URL(string: "https://steamcdn-a.akamaihd.net" + com!.img)!)
                                                        .placeholder { Image("item_placeholder").resizable().frame(width: 43, height: 33, alignment: .center).scaledToFill() }
                                                        .resizable()
                                                        .frame(width: 43, height: 33, alignment: .leading)
                                                        .cornerRadius(4)
                                                        .scaledToFill()
                                                        .padding(.trailing, 6)
                                            }
                                        }
                                    }
                                })
                            }
                            .padding(.leading, 20)
                        }
                    }
                case .none: Text("").frame(width: 0, height: 0)
                }
            }
            .navigationBarTitle(dotaItem.dname ?? "")
        }
    }
}
