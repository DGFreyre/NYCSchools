

import SwiftUI

struct SplashScreenView: View {
    @Binding private var isActive: Bool
    private var animation: String
    init(isActive: Binding<Bool>, animation: String = Constants.launchScreenAnimation) {
        _isActive = isActive
        self.animation = animation
    }
    var body: some View {
        ZStack(alignment: .top){
            Color.backgroundBlue
            VStack {
                Spacer().frame(height: 100)
                Image("NYCLogo").resizable().scaledToFit().frame(width: 250)
                Spacer().frame(height: 80)
                LottieView(lottieFile: animation).scaleEffect(0.5).frame(width: 250, height: 250)
            } .onAppear {
                DispatchQueue.main.asyncAfter (deadline: .now() + Constants.splashScreenDuration) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    SplashScreenView(isActive: .constant(false))
}
