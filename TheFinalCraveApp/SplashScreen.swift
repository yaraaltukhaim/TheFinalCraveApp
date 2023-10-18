
import SwiftUI

struct SplashPage: View {
    var body: some View {
        VStack{
            
            ZStack{
                Color("Mycolo").ignoresSafeArea()
                Image("Group").frame(width:273 , height:  102).position(CGPoint(x: 194, y: 240))
                
                Text("Play. Eat. Repeat!").font(.title).foregroundColor(.white).position(CGPoint(x: 194, y:330))
                
                Text("🍔 🥘🍕🍣🌮🧆")
                    .multilineTextAlignment(.center)
                    .font(.title).position(CGPoint(x: 190, y: 390))
                .animation(.easeIn)    }
        }
    }}
#Preview {
    SplashPage()
}
