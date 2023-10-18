import SwiftUI

struct WelcomePopUp: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var WelcomePop : Bool

    var body: some View {
        
        VStack (alignment: .center) {
            Text("Welcome Cravers,")
                .bold()
                .foregroundColor(.orange)
                .font(.system(size: 17))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text("to the ultimate dining companion!")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .bold()
                .foregroundColor(.orange)
                .font(.system(size: 17))
                .padding(.bottom)
            
            

            
            Text("1. Spin the wheel to select a food genre")
                .foregroundColor(.black)
                .font(.system(size: 12))
                
            Text("2. Swipe through restaurant options in that genre.")
                .foregroundColor(.black)
                .font(.system(size: 12))
            Text("3. Pick your favorite and feast!")
                .foregroundColor(.black)
                .font(.system(size: 12))
            
            
            Button("Got it") {
                WelcomePop.toggle()
                
               // presentationMode.wrappedValue.dismiss()
            }
            .bold()
            .foregroundColor(.white)
            .bold()
            .padding(EdgeInsets(top: 10, leading: 50, bottom: 10, trailing: 50))
            .background(.orange)
            .cornerRadius(30)
            .padding(.top)

            
            //.padding(EdgeInsets(top: 30, leading: 10, bottom: 10, trailing: 10))
        }
        
        
        .background(
            Image("Background")
                .resizable()
                .frame(width: 350, height: 260)
                .ignoresSafeArea()
        )
        .frame(width: 320, height: 230)
        .background(.white)
        .cornerRadius(20)
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
        .shadow(radius: 10)
       

        
        
    }
}

#Preview {
    WelcomePopUp(WelcomePop: .constant(true))
}
