//
//  CoordinateRecommendViewModel.swift
//  deau
//
//  Created by yuki.hamada on 2024/11/26.
//
import Observation

@Observable @MainActor
final class CoordinateRecommendViewModel {
    enum State: Equatable {
        case initial   // init だと競合
        case loading
        case success(CoordinateRecommendResponse)
        case error(String)
    }

    private(set) var state: State = .initial
    private(set) var coordinates: [Coordinate] = [
        .init(imageName: "coordinate02", title: "クリスマスに映える服", time: "21時間前", userIconName: "userIcon01", userName: "だーはま", userHeight: "199cm", isFavorite: false),
        .init(imageName: "coordinate10", title: "クリスマスに映える服", time: "21時間前", userIconName: "userIcon02", userName: "だーはま", userHeight: "199cm", isFavorite: true),
        .init(imageName: "coordinate16", title: "クリスマスに映える服", time: "21時間前", userIconName: "userIcon01", userName: "だーはま", userHeight: "199cm", isFavorite: true),
        .init(imageName: "coordinate20", title: "クリスマスに映える服", time: "21時間前", userIconName: "userIcon02", userName: "だーはま", userHeight: "199cm", isFavorite: false),
        .init(imageName: "coordinate08", title: "クリスマスに映える服", time: "21時間前", userIconName: "userIcon01", userName: "だーはま", userHeight: "199cm", isFavorite: false),
        .init(imageName: "coordinate19", title: "クリスマスに映える服", time: "21時間前", userIconName: "userIcon02", userName: "だーはま", userHeight: "199cm", isFavorite: true),
    ]

    let apiClient: APIClientProtocol
    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }

    func favoriteButtonTapped(index: Int) {
        var saveCoordinate = coordinates[index]
        saveCoordinate.isFavorite.toggle()
        coordinates[index] = saveCoordinate
    }

    func onAppear() async {
        state = .loading
        let request: CoordinateRecommendRequest = .init(searchWord: "")
        do {
            let response: Result<CoordinateRecommendResponse, HTTPError> = try await apiClient.request(apiRequest: request)
            switch response {
            case .success(let repositories):
                print(repositories)
                state = .success(repositories)
            case .failure(let error):
                let errorDescription = error.errorDescription
                state = .error(errorDescription)
            }
        } catch {
            state = .error(error.localizedDescription)
        }
    }
}
