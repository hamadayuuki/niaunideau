//
//  CoordinateRecommendViewModel.swift
//  deau
//
//  Created by yuki.hamada on 2024/11/26.
//
import Observation

@Observable @MainActor
final class CoordinateRecommendViewModel {
    private(set) var coordinates: [Coordinate] = [
        .init(imageName: "coordinate01", title: "クリスマスに映える服", time: "21時間前", userIconName: "userIcon01", userName: "だーはま", userHeight: "199cm", isFavorite: false),
        .init(imageName: "coordinate02", title: "クリスマスに映える服", time: "21時間前", userIconName: "userIcon02", userName: "だーはま", userHeight: "199cm", isFavorite: true),
        .init(imageName: "coordinate03", title: "クリスマスに映える服", time: "21時間前", userIconName: "userIcon01", userName: "だーはま", userHeight: "199cm", isFavorite: true),
        .init(imageName: "coordinate04", title: "クリスマスに映える服", time: "21時間前", userIconName: "userIcon02", userName: "だーはま", userHeight: "199cm", isFavorite: false),
        .init(imageName: "coordinate05", title: "クリスマスに映える服", time: "21時間前", userIconName: "userIcon01", userName: "だーはま", userHeight: "199cm", isFavorite: false),
        .init(imageName: "coordinate06", title: "クリスマスに映える服", time: "21時間前", userIconName: "userIcon02", userName: "だーはま", userHeight: "199cm", isFavorite: true),
    ]

    func favoriteButtonTapped(index: Int) {
        var saveCoordinate = coordinates[index]
        saveCoordinate.isFavorite.toggle()
        coordinates[index] = saveCoordinate
    }
}
