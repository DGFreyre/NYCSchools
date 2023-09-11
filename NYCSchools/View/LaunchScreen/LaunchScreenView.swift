import SwiftUI

struct LaunchScreenView: View {
    @State private var isActive: Bool = false
    
    var body: some View {
        if isActive {
            SchoolsInformationView()
        } else {
            SplashScreenView(isActive: $isActive)
        }
    }
}

#Preview {
    LaunchScreenView()
}

