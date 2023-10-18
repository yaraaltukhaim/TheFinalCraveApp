import SwiftUI

struct ChoosePage: View {
    @State var b1IsSelected: Bool = false
    @State var b2IsSelected: Bool = false
    @State var selectedButton: Int = -1
    @State var welcomeRestaurants: Bool = false
    
    @State var WelcomePop : Bool = false
    @State var cuisines : Bool = false
    var body: some View {
        ZStack{
        VStack{
            VStack{
                Button(action: {
                    WelcomePop.toggle()
                    
                }, label: {
                    
                    Image(systemName: "questionmark.circle.fill")
                        .resizable()
                        .frame(width: 30,height: 30)
                        .position(CGPoint(x: 336, y:5 ))
                        .foregroundColor(.orange)
                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                }
                )
                
                
                
            }
            
            VStack  {
                Text("  Hello Cravers!").font(.system(size: 37)).foregroundColor(.orange).bold()
                    .position(CGPoint(x: 150, y:9 ))
                    .frame(width: 315,height: 34 )
                
            }
            
            VStack {
                Button(action: {
                    cuisines.toggle()
                    selectedButton = 1
                }, label: {
                    
                    Text("Choose Your Restaurant")
                        .frame(width:307 , height:  161)
                        .fontWeight(.bold)
                        .font(.headline)
                        .foregroundColor(.orange)
                    
                    
                        .background{
                            Image("back")
                                .frame(width: 305,height: 159)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                .ignoresSafeArea()
                        }
                        .border(selectedButton == 1 ?  Color.orange : .clear, width: 2).cornerRadius(10).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    
                }
                )
                
            }
            .sheet(isPresented: $cuisines) {
                Cuisines()
                    .presentationDetents([.height(400)])
            }
            .padding(40)
         
            VStack {
                Button(action: {
                    welcomeRestaurants.toggle()
                    selectedButton = 0
                }, label: {
                    
                    Text("Choose Your Cuisine")
                        .frame(width:307 , height:  161)
                        .fontWeight(.bold)
                        .font(.headline)
                        .foregroundColor(.orange)
                    
                    
                        .background{
                            Image("back")
                                .ignoresSafeArea()
                        }
                        .border(selectedButton == 0 ?  Color.orange : .clear, width:2).cornerRadius(10).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    
                    
                    
                }
                )
            }
            .fullScreenCover(isPresented: $welcomeRestaurants){
                ContentView()
            }
            
            
            VStack{
                Spacer()
                Text("Play. Eat. Repeat!").font(.system(size: 17))
                    .frame(width:248 , height:  36)
                
                    .foregroundColor(.orange)
                    .font(.footnote)
            }.navigationBarBackButtonHidden(true)
            
        }
            if WelcomePop {
                Color.gray.opacity(0.7)
                    .edgesIgnoringSafeArea(.all)
                WelcomePopUp(WelcomePop: $WelcomePop)
            }
        }
        
    }
    }
    


#Preview {
    ChoosePage()
}
