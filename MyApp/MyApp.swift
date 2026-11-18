import SwiftUI

@main
struct MyAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                if GoalStorage.load() == nil {
                    OnboardingView()
                } else {
                    ActivityView()
                }
            }
            .preferredColorScheme(.dark)
          
        }
    }
}
