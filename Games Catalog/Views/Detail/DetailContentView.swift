//
//  DetailContentView.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 04/07/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailContentView: View {
	
	@State var moreDesc: Bool = false
	
	var game: DetailGame
	
	var body: some View {
		VStack(alignment: .leading) {
			Text("\(game.name)")
				.font(.largeTitle)
				.fontWeight(.bold)
			HStack(alignment: .lastTextBaseline, spacing: 3) {
				RatingView(rating: .constant(1), maximumRating: 1)
					.font(.subheadline)
				Text("\(String(format: "%.1f", game.rating ?? 0))")
					.font(.subheadline)
				Text("(\(game.ratingsCount ?? 0))")
					.font(.subheadline)
					.foregroundColor(Color.secondary)
			}
			.padding(.bottom, 10)
			Text("Description")
				.font(.headline)
				.fontWeight(.semibold)
				.padding(.bottom, 5)
			description
			Divider()
			detailGame
		}
	}
}

extension DetailContentView {
	private var description: some View {
		VStack {
			if moreDesc {
				Text("\(game.descriptionRaw ?? "")")
					.font(.body)
			} else {
				Button(action: {
					self.moreDesc.toggle()
				}, label: {
					VStack(alignment: .leading) {
						Text("\(game.descriptionRaw ?? "")")
							.font(.body)
							.lineLimit(4)
							.foregroundColor(Color("Text"))
						Text("More")
					}
				})
			}
		}
	}
	
	private var detailGame: some View {
		Group {
			Text("Genre")
				.font(.headline)
				.padding(.bottom, 5)
			Text("\(game.genre)")
			Divider()
			Text("Platform")
				.font(.headline)
				.padding(.bottom, 5)
			Text("\(game.platform)")
			Divider()
			Text("Publisher")
				.font(.headline)
				.padding(.bottom, 5)
			Text("\(game.publisher)")
			Divider()
			HStack(alignment: .top) {
				VStack(alignment: .leading) {
					Text("Developer")
						.font(.headline)
						.padding(.bottom, 5)
					Text("\(game.developer)")
						.lineLimit(2)
						.frame(minWidth: 0, maxWidth: 180, alignment: .leading)
						.padding(.bottom)
					Text("Metacritic")
						.font(.headline)
						.padding(.bottom, 5)
					if let metacritic = game.metacritic {
						ScoreBox(color: game.metacriticShape, score: String("\(metacritic)"))
					} else {
						ScoreBox(color: game.metacriticShape, score: String("0"))
					}
				}
				Spacer()
				Spacer()
				VStack(alignment: .leading) {
					Text("Release Date")
						.font(.headline)
						.padding(.bottom, 5)
					Text("\(game.releaseDate ?? "-")")
				}
				Spacer()
			}
		}
	}
}
