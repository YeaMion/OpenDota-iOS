//
//  ContentView.swift
//  OpenDota+
//
//  Created by 姚一鸣 on 2021/9/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var selection: Int = 0
    var body: some View {
        TabView(selection: $selection) {
            DotaHeroesView()
                .tabItem {
                    VStack {
                        if selection == 0 {
                            Image(colorScheme == .light ? "tabicon_hero_light" : "tabicon_hero_dark")
                        } else {
                            Image(colorScheme == .light ? "tabicon_hero_light_unselected" : "tabicon_hero_dark_unselected")
                        }
                        // Text("Heroes")
                    }
                }
                .tag(0)

            DotaItemsView()
                .tabItem {
                    VStack {
                        if selection == 1 {
                            Image(colorScheme == .light ? "tabicon_item_light" : "tabicon_item_dark")
                        } else {
                            Image(colorScheme == .light ? "tabicon_item_light_unselected" : "tabicon_item_dark_unselected")
                        }
                        // Text("Items")
                    }
                }
                .tag(1)

            DotaHomeView()
                .tabItem {
                    VStack {
                        if selection == 2 {
                            Image(colorScheme == .light ? "tabicon_match_light" : "tabicon_match_dark")
                        } else {
                            Image(colorScheme == .light ? "tabicon_match_light_unselected" : "tabicon_match_dark_unselected")
                        }
                        // Text("Matches")
                    }
                }
                .tag(2)
        }
//        .overlay(
//            Color(red: 47/255.0, green: 45/255.0, blue: 67/255.0, opacity: 0.7)
//                .edgesIgnoringSafeArea(.vertical)
//                .edgesIgnoringSafeArea(.horizontal)
//                .frame(height: 50)
//                //.shadow(color: Color(red: 47/255.0, green: 45/255.0, blue: 67/255.0, opacity: 1), radius: 10, x: 0, y: 0)
//                .overlay(HStack {
//                    Spacer()
//
//                    Button(action: {
//                        self.selection = 0
//                    }, label: {
//                        VStack {
//                            Image("icon_hero")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 32, height: 32, alignment: .center)
//                                .foregroundColor(Color(red: 32/255, green: 43/255, blue: 63/255))
//                        }
//                        .opacity(selection == 0 ? 1 : 0.4)
//                    })
//                        .padding(.top, 16)
//
//                    Spacer()
//
//                    Button(action: {
//                        self.selection = 1
//                    }, label: {
//                        VStack {
//                            Image("icon_item")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 32, height: 32, alignment: .center)
//                                .foregroundColor(Color(red: 32/255, green: 43/255, blue: 63/255))
//                        }
//                        .opacity(selection == 1 ? 1 : 0.4)
//                    })
//                        .padding(.top, 16)
//
//                    Spacer()
//
//                    Button(action: {
//                        self.selection = 2
//                    }, label: {
//                        VStack {
//                            Image("icon_match")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 30, height: 30, alignment: .center)
//                                .foregroundColor(Color(red: 32/255, green: 43/255, blue: 63/255))
//                        }
//                        .opacity(selection == 2 ? 1 : 0.4)
//                    })
//                        .padding(.top, 16)
//
//                    Spacer()
//
//                }),
//            alignment: .bottom)
//        SideBarStack(sidebarWidth: 125, showSidebar: $showSidebar) {
//            // Sidebar content here
//
//            Button(action: {
//                showSidebar.toggle()
//            }) {
//                Text("FFFF")
//                    .font(.system(size: 15))
//                    .foregroundColor(Color.red)
//                    .animation(nil)
//            }
//        } content: {
//            // Main content here
//            Button(action: {
//                showSidebar.toggle()
//            }) {
//                Text("DDDDD")
//                    .font(.system(size: 15))
//                    .foregroundColor(Color.red)
//                    .animation(nil)
//            }
//        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
