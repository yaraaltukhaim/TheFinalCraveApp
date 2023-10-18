import SwiftUI

struct ShowingSplash: View {
    @State private var showSplash = true
    
    @State private var showHome = false
    var body: some View {
        
        NavigationStack {
            ZStack {
                if showSplash {
                    SplashPage()
                    
                }
            }
            
            
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now()+1.0) {
                    withAnimation (.smooth(duration: 3 )){
                        self.showSplash = false
                        
                        
                        showHome = true
                    }
                }}
            
            .navigationDestination(isPresented: $showHome) {
               // SplashScreen()
                ChoosePage()
            }.navigationBarBackButtonHidden(true)
            
            
            
            
        }
    } }

#Preview {
    ShowingSplash()
}
