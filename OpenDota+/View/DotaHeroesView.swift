//
//  DotaHeroesView.swift
//  OpenDota+
//
//  Created by 姚一鸣 on 2021/12/11.
//

import SwiftUI

struct DotaHeroesView: View {
    @EnvironmentObject var dotaData: DotaData
    @State private var selectedColorIndex = 0

    var body: some View {
        NavigationView {
            List {
                Picker("Favorite Color", selection: $selectedColorIndex, content: {
                    Text("Strength").tag(0)
                    Text("Agility").tag(1)
                    Text("Intelligence").tag(2)
                })
                    .pickerStyle(SegmentedPickerStyle())
                if selectedColorIndex == 0 {
                    ForEach(dotaData.dotaHeroesList) { hero in
                        if hero.primary_attr == "str" {
                            NavigationLink(destination: DotaHeroInfoView(dotaHero: hero)) {
                                DotaHeroRow(dotaHero: hero)
                            }
                        }
                    }
                } else if selectedColorIndex == 1 {
                    ForEach(dotaData.dotaHeroesList) { hero in
                        if hero.primary_attr == "agi" {
                            NavigationLink(destination: DotaHeroInfoView(dotaHero: hero)) {
                                DotaHeroRow(dotaHero: hero)
                            }
                        }
                    }
                } else if selectedColorIndex == 2 {
                    ForEach(dotaData.dotaHeroesList) { hero in
                        if hero.primary_attr == "int" {
                            NavigationLink(destination: DotaHeroInfoView(dotaHero: hero)) {
                                DotaHeroRow(dotaHero: hero)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Heroes")
        }
    }
}
