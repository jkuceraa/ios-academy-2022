//
//  EpisodeRowItemView.swift
//  RickAndMorty
//
//  Created by Jiri Kucera on 15.08.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import SwiftUI

struct EpisodeRowItemView: View {
    let episode: Episode
    
    
    
    var body: some View {
        let formatted = episode.airDate.formatted(date: .long, time: .omitted)
        VStack(alignment: .leading) {
            Text(episode.name)
                .font(.appItemLargeTitle)
                .foregroundColor(.appTextItemTitle)
            Text("\(episode.code) • \(formatted)")
                .font(.appItemDescription)
                .foregroundColor(.appTextBody)
        }
    }
}

struct EpisodeRowItemView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeRowItemView(episode: .mock)
    }
}
