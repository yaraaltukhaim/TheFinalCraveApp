import SwiftUI

struct Cuisines: View {
    @State var selected = ""
    @State var show = false
    
    var body: some View {
        ZStack {
            Text("Home")
            
            VStack{
                Spacer()
                
                RadioButtons(selected: self.$selected, show: self.$show).offset(y: (UIApplication.shared.windows.last?.safeAreaInsets.bottom)!)
            }
        }//.background(.black.opacity(0.2))
  
    }
}

struct RadioButtons : View {
    @Binding var selected : String
    @Binding var show : Bool
    @State var showSecond: Bool = false
    var body: some View {
        NavigationView{
            VStack(alignment: .center) {
                Text("Choose Your Cuisine")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top)
                    .multilineTextAlignment(.center)
                
                ForEach(data,id: \.self){i in
                    Button(action:{
                        self.selected = i
                        
                    }){
                        HStack{
                            
                            Text(i)
                            
                            Spacer()
                            
                            ZStack{
                                
                                Circle().fill(self.selected == i ? Color(.orange): Color.orange.opacity(0.5)).frame(width: 18, height: 18)
                                if self.selected == i{
                                    Circle().stroke(Color.orange, lineWidth:2) .frame(width:25, height: 25)
                                }
                            }
                        }.foregroundColor(.black)
                    }
                    .padding(.top,10)
                }
                Button("Let's Go!") {
                    showSecond.toggle()
        
                }
                
                .font(.headline)
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 10, leading: 25, bottom: 10, trailing: 25))
                .background(Color.orange)
                .cornerRadius(30)
                
            }
            .padding(.vertical)
            .padding(.horizontal,35)
            .padding(.bottom,(UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 15)
            .background(.white)
            .cornerRadius(20)
        }.fullScreenCover(isPresented: $showSecond) {
            switch selected{
                case "American 🍔" :
                    American()
                case"Mexican 🌮":
                    Swipe()
                case"Italian 🍕":
                    Italian()
                case"Asian 🍣":
                    Asian()
                case"Indian 🥘":
                    Indian()
                case"Khaleeji 🧆":
                    Khaleeji()
                default:
                    American()
                    
                    
                }
            }
        }
    }
//}
var data = ["American 🍔", "Mexican 🌮", "Italian 🍕", "Asian 🍣", "Indian 🥘", "Khaleeji 🧆"]
    


#Preview {
    Cuisines()
}
