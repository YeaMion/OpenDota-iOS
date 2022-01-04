//
//  DotaHeroesView.swift
//  OpenDota+
//
//  Created by 姚一鸣 on 2021/12/11.
//

import SwiftUI

struct DotaHeroesView: View {
    @EnvironmentObject var dotaData: DotaData
    @State private var selectedListIndex = 0
    @State private var searchString = ""
    
    var body: some View {
        NavigationView {
            List {
                Picker("Attributes", selection: $selectedListIndex, content: {
                    Text("Strength").tag(0)
                    Text("Agility").tag(1)
                    Text("Intelligence").tag(2)
                })
                    .pickerStyle(SegmentedPickerStyle())
                if selectedListIndex == 0 {
                    ForEach(dotaData.dotaHeroesList) { hero in
                        if hero.primary_attr == "str" {
                            NavigationLink(destination: DotaHeroInfoView(dotaHero: hero)) {
                                DotaHeroRow(dotaHero: hero)
                            }
                        }
                    }
                } else if selectedListIndex == 1 {
                    ForEach(dotaData.dotaHeroesList) { hero in
                        if hero.primary_attr == "agi" {
                            NavigationLink(destination: DotaHeroInfoView(dotaHero: hero)) {
                                DotaHeroRow(dotaHero: hero)
                            }
                        }
                    }
                } else if selectedListIndex == 2 {
                    ForEach(dotaData.dotaHeroesList) { hero in
                        if hero.primary_attr == "int" {
                            NavigationLink(destination: DotaHeroInfoView(dotaHero: hero)) {
                                DotaHeroRow(dotaHero: hero)
                            }
                        }
                    }
                }
            }
            .searchable(text: $searchString)
            .navigationTitle("Heroes")
        }
    }
}
