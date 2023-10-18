import SwiftUI
import FortuneWheel

struct ContentView: View {
    @State private var displayPopup = false
    @State private var selectedCuisine = "Your Cuisine"
    
    @State private var selectedEmojis = "Your Cuisine"


    var cuisines = ["American", "Italian", "Asian", "Indian", "Khaleeji", "Mexican"]

    var emojis = ["🍔", "🍕", "🍣", "🥘", "🧆", "🌮"]

    
    
    @State var isAsian = false
    @State var isMexican = false
    @State var isItalian = false
    @State var isIndian = false
    @State var isKhaleeji = false
    @State var isAmerican = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 50) {
                    Text("Spin The Wheel")
                        .font(.largeTitle)
                        .foregroundStyle(.orange)
                        .bold()
                    
                    ZStack(alignment: .top) {
                        ZStack(alignment: .center) {
                            FortuneWheel(titles: cuisines, size: 320, onSpinEnd: { i in
                                selectedCuisine = cuisines[i]
                                
                                
                                
                                selectedEmojis = emojis[i]
                                
                                
                                
                                displayPopup = true
                            })
                        }
                    }
                    
                    HStack {
                        Text("Swipe to spin")
                            .font(Font.system(.headline))
                            .foregroundStyle(.orange)
                        Image(systemName: "hand.draw")
                            .font(Font.system(.largeTitle))
                            .foregroundStyle(.orange)
                    }
                }
                
                if displayPopup {
                    Color.gray.opacity(0.7)
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        Text("Your Cuisine is")
                            .font(.title)
                        Text(selectedCuisine)
                            .font(.title)
                        Text(selectedEmojis)
                            .font(.largeTitle)
                        
                        HStack {
                            Button("Play Again") {
                                // Handle the "Play Again" action here
                                displayPopup = false
                            }
                            .font(.headline)
                            .foregroundColor(.orange)
                            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                            .overlay(
                                Capsule(style: .continuous)
                                    .stroke(Color.orange, style: StrokeStyle(lineWidth: 2))
                            )
                            
                            Button("Confirm") {
                                displayPopup = false
                                
                                switch selectedCuisine
                                {
                                case "Asian" :
                                    isAsian = true
                                case"Mexican":
                                    isMexican = true
                                case"Indian":
                                    isIndian = true
                                case"Italian":
                                    isItalian = true
                                case"Khaleeji":
                                    isKhaleeji = true
                                case"American":
                                    isAmerican = true
                                default:
                                    isAsian = true
                                    
                                }
                                
                                
                            }
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 10, leading: 25, bottom: 10, trailing: 25))
                            .background(Color.orange)
                            .cornerRadius(30)
                        }
                        .padding(EdgeInsets(top: 30, leading: 10, bottom: 10, trailing: 10))
                    }
                    .frame(width: 280, height: 280)
                    .background(Color.white)
                    .cornerRadius(20)
                    
                    NavigationLink(destination: Asian(),
                                   isActive: self.$isAsian,
                                   label: {
                        
                        EmptyView()
                            .navigationBarBackButtonHidden(true)
                    })
                    NavigationLink(destination: Swipe(),
                                   isActive: self.$isMexican,
                                   label: {
                        EmptyView()
                            .navigationBarBackButtonHidden(true)
                    })
                    NavigationLink(destination: Italian(),
                                   isActive: self.$isItalian,
                                   label: {
                        EmptyView()
                            .navigationBarBackButtonHidden(true)
                    })
                    NavigationLink(destination: Khaleeji(),
                                   isActive: self.$isKhaleeji,
                                   label: {
                        EmptyView()
                            .navigationBarBackButtonHidden(true)
                    })
                    NavigationLink(destination: Indian(),
                                   isActive: self.$isIndian,
                                   label: {
                        EmptyView()
                            .navigationBarBackButtonHidden(true)
                    })
                    NavigationLink(destination: American(),
                                   isActive: self.$isAmerican,
                                   label: {
                        EmptyView()
                            .navigationBarBackButtonHidden(true)
                    })
                    
                }
            }
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    ContentView()
}
