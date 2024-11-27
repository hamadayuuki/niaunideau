//
//  ContentView.swift
//  deau
//
//  Created by 濵田　悠樹 on 2024/11/26.
//

import SwiftUI

struct ContentView: View {

    private var user_fcm_token = "dJntMz_UnU45rjmmWrAJ6s:APA91bEqlG7BMLUqG7YjrMA0EYU0F7fG_7ruA3Tw_Iz_B38ULWRhMNFeQnuGO0N-bGbm0it8737iHpK1UHdTMFU2HkMiB9NyhPtKxV9-FlK9FfeKbzo1uhE"

    var body: some View {
        ZStack {
            Text("Push通知")
                .padding()
                .foregroundColor(.white)
                .background(.orange)
                .cornerRadius(10)
        }
        .task {
            do {
                let response = try await PushNotification().fetchNews(user_fcm_token: user_fcm_token, title: "【おすすめコーデ】", body: "1週間後のクリスマスデートで彼女さんをビックリさせませんか？")
                print(response)
                if response.result == "success" {
                    print("Push通知 成功しました")
                } else {
                    print("Push通知 エラーが発生しました")
                }
            } catch {
                print("Push通知 エラーが発生しました")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
