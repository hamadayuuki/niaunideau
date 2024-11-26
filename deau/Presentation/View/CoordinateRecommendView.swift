//
//  CoordinateRecommendView.swift
//  deau
//
//  Created by 濵田　悠樹 on 2024/11/26.
//

import SwiftUI

struct Coordinate: Identifiable {
    let id: UUID = UUID()
    let imageName: String   // "coordinate01"
    let title: String   // クリスマスに映える服
    let time: String   // 21時間前
    let userIconName: String   // "userIcon01
    let userName: String   // だーはま
    let userHeight: String   // 181cm
    var isFavorite: Bool
}

struct CoordinateRecommendView: View {
    let coordinates: [Coordinate] = [
        .init(imageName: "coordinate01", title: "クリスマスに映える服", time: "21時間前", userIconName: "userIcon01", userName: "だーはま", userHeight: "199cm", isFavorite: false),
        .init(imageName: "coordinate02", title: "クリスマスに映える服", time: "21時間前", userIconName: "userIcon02", userName: "だーはま", userHeight: "199cm", isFavorite: true),
        .init(imageName: "coordinate03", title: "クリスマスに映える服", time: "21時間前", userIconName: "userIcon01", userName: "だーはま", userHeight: "199cm", isFavorite: true),
        .init(imageName: "coordinate04", title: "クリスマスに映える服", time: "21時間前", userIconName: "userIcon02", userName: "だーはま", userHeight: "199cm", isFavorite: false),
        .init(imageName: "coordinate05", title: "クリスマスに映える服", time: "21時間前", userIconName: "userIcon01", userName: "だーはま", userHeight: "199cm", isFavorite: false),
        .init(imageName: "coordinate06", title: "クリスマスに映える服", time: "21時間前", userIconName: "userIcon02", userName: "だーはま", userHeight: "199cm", isFavorite: true),
    ]

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 12) {
                ForEach(0..<3) { i in
                    HStack(spacing: 12) {
                        coordinateCard(
                            coordinate: coordinates[i * 2],
                            cardSize: .init(width: 400, height: 600)
                        )

                        coordinateCard(
                            coordinate: coordinates[i*2 + 1],
                            cardSize: .init(width: 400, height: 600)
                        )
                    }
                }
            }
        }
    }


    private func coordinateCard(coordinate: Coordinate, cardSize: CGSize) -> some View {
        VStack(spacing: 8) {
            ZStack {
                Image(coordinate.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: cardSize.width * 0.42, height: cardSize.height * 0.42)
                    .clipped()

                Image(systemName: "heart.fill")
                    .resizable()
                    .frame(width: 23, height: 20)
                    .offset(x: cardSize.width * 0.42 / 2 - 20, y: cardSize.height * 0.42 / 2 - 20)
                    .foregroundStyle(coordinate.isFavorite ? .red : .white)
            }
            //.frame(width: cardSize.width * 0.42, height: cardSize.height * 0.42)

            Divider()
                .frame(height: 1)
                .padding(.horizontal, 12)

            VStack(alignment: .leading, spacing: 0) {
                Text(coordinate.title)
                    .font(.system(size: 12, weight: .bold, design: .rounded))

                Text(coordinate.time)
                    .foregroundStyle(.gray)
                    .font(.system(size: 10, weight: .regular, design: .rounded))
            }
            .frame(alignment: .leading)
        }
        .frame(width: cardSize.width * 0.42, height: cardSize.height * 0.42)
        .padding(.bottom, 36)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.gray, lineWidth: 1)
        )
    }

}

#Preview {
    CoordinateRecommendView()
}

