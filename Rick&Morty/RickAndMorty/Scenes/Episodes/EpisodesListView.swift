//
//  EpisodesListView.swift
//  RickAndMorty
//
//  Created by Jiri Kucera on 15.08.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import SwiftUI

struct EpisodesListView: View {
    private let episodes: [Episode] = {
        (0...99).map { _ in
            Episode.mock
        }
    }()
    var body: some View {
        VStack{
            List{
                ForEach(episodes) { episode in
                    EpisodeRowItemView(episode: episode)
                        .listRowBackground(Color.appBackgroundItem)
                }
            }.listStyle(.plain)
        }
    }
}

struct EpisodesListView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodesListView()
    }
}
