import SwiftUI

@main
struct DartsApp: App {
    var body: some Scene {
        WindowGroup {
            _DMV()
                .onAppear {
                    UserDefaultsManager().firstLaunch()
                }
        }
    }
}
