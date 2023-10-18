import SwiftUI

struct Indian: View {
    var body: some View {
       IndianName()
    }
}

struct  Indian_Previews: PreviewProvider {
    static var previews: some View {
        Indian()
    }
}

struct IndianName : View {
    @State var restaurant = [
        
            Tools(id: 0, image: "Zafarn", name: "Zafarn", offset: 0, place: 1),
                   Tools(id: 1, image: "Baba Khan", name: "Baba khan", offset: 0, place: 2),
                   Tools(id: 2, image: "Ruhi", name: "Ruhi", offset: 0, place: 3),
                   Tools(id: 3, image: "Spice", name: "Spice", offset: 0, place: 4),
                   Tools(id: 4, image: "Makani", name: "Makani", offset: 0, place: 5),
                   Tools(id: 5, image: "Mohalla", name: "Mohalla", offset: 0, place: 6),
                   Tools(id: 6, image: "Molo", name: "Molo", offset: 0, place: 7),
                   Tools(id: 7, image: "Golden Chimney", name: "Golden Chimney", offset: 0, place: 8),
                   Tools(id: 8, image: "Amaly", name: "Amaly", offset: 0, place: 9),
                   Tools(id: 9, image: "Blue Tok Tok", name: "Blue Tok Tok", offset: 0, place: 10)
               ]
    @State private var isFinished: Bool = false

    var isAllItemsProcessed: Bool {
        return restaurant.allSatisfy { $0.offset == 1 }
    }
    @State var swiped = 0
    @Namespace var name
    @State var selected: Tools =  Tools(id: 0, image: "sketch", name: "Sketch", offset: 0, place: 1)
    @State var show = false

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Swipe ")
                            .font(.system(size: 45))
                            .fontWeight(.bold)
                            .foregroundColor(Color.orange)
                        HStack(spacing: 12) {
                            Text("swipe right to remove")
                                .font(.system(size: 30))
                                .foregroundColor(Color.gray.opacity(0.7))
                        }
                    }
                    Spacer(minLength: 0)
                }
                .padding()

                GeometryReader { reader in
                    ZStack {
                        ForEach(restaurant.reversed()) { tool in
                            CardView(tool: tool, reader: reader, swiped: $swiped, show: $show, selected: $selected, name: name)
                                .offset(x: tool.offset)
                                .rotationEffect(.init(degrees: getRotation(offset: tool.offset)))
                                .gesture(DragGesture().onChanged({ value in
                                    withAnimation {
                                        if value.translation.width > 0 {
                                            restaurant[tool.id].offset = value.translation.width
                                        }
                                    }
                                }).onEnded({ value in
                                    withAnimation {
                                        if value.translation.width > 150 {
                                            restaurant[tool.id].offset = 1000
                                            swiped = tool.id + 1
                                        } else {
                                            restaurant[tool.id].offset = 0
                                        }
                                    }
                                }))
                        }
                    }
                    .offset(y: -25)
                }
            }
            
            if show {
                IndianDetail(tool: selected, show: $show, name: name)
            }
        }
        .background(
            LinearGradient(gradient: .init(colors: [Color("bottom")]), startPoint: .bottom, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                .opacity(show ? 0 : 1)
        )
    }

    func getRotation(offset: CGFloat) -> Double {
        let value = offset / 150
        let angle: CGFloat = 5
        let degree = Double(value * angle)
        return degree
    }
}

struct IndianCardView: View {
    var tool: Tools
    var reader: GeometryProxy
    @Binding var swiped: Int
    @Binding var show: Bool
    @Binding var selected: Tools
    var name: Namespace.ID

    var body: some View {
        
        VStack {
            Spacer(minLength: 0)
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
                VStack {
                    Image("\(tool.image)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: tool.image, in: name)
                        .clipShape(Circle())
                        .padding(.leading,30)
                    Spacer()
                    HStack {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("\(tool.name)")
                                .font(.system(size: 40))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            Button(action: {
                                withAnimation(.spring()) {
                                    selected = tool
                                    show.toggle()
                                }
                            }) {
                                Text("Let's eat! >")
                                    .font(.system(size: 25))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.orange)
                            }
                        }
                        Spacer(minLength: 0)
                    }
                    .padding(.horizontal, 35)
                    .padding(.bottom, 60)
                    .padding(.top, 25)
                }
                .offset(x: -15, y: UIScreen.main.bounds.height < 750 ? 5 : 25)
            }
            .background(Color.white)
            .frame(height: reader.frame(in: .global).height - 120)
            .padding(.vertical, 10)
            .cornerRadius(25)
            .padding(.horizontal, 30 + (CGFloat(tool.id - swiped) * 10))
            .offset(y: tool.id - swiped <= 2 ? CGFloat(tool.id - swiped) * 25 : 50)
            .shadow(color: Color.black.opacity(0.12), radius: 5, x: 0, y: 5)
            Spacer(minLength: 0)
        }
        .contentShape(Rectangle())
    }
}

struct IndianTools: Identifiable {
    var id: Int
    var image: String
    var name: String
    var offset: CGFloat
    var place: Int
}

struct IndianDetail: View {
    var tool: Tools
    @Binding var show: Bool
    var name: Namespace.ID
    @State private var isPressed = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .top, spacing: 12) {
                    Button(action: {
                        withAnimation(.spring()) {
                            show.toggle()
                        }
                    }) {

                Spacer()
                
                    }
                    Spacer(minLength: 0)
                    ZStack {
                        Image(tool.image)
                       .resizable()
                          .frame(width: 300, height: 300)
                        .clipShape(Circle())
                         .overlay(Circle().stroke(Color.orange, lineWidth: 4))
                         .offset(x: -20, y: 130)
                         .padding(.top,150)

        Text("Congrats!")
          .font(.system(size: 50))
              .fontWeight(.bold)
              .foregroundColor(.orange)
    .multilineTextAlignment(.leading)
          .padding(.top, -120) //Adjust the top padding to position the text
         .padding(.leading,-50)
                 Text("You're Craving 🔥")
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            .foregroundColor(.orange)
                            .multilineTextAlignment(.leading)
                            .padding(.top, -45) //Adjust the top padding to position the text
                            .padding(.leading,-50)
                                       }
                                   }
                .padding(.leading, 20)
                .padding([.top, .bottom, .trailing])
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        Text( ("\(tool.name) 🥘!"))
                            .font(.system(size: 45, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.bottom,-100)
                    }
                    .padding(.vertical,150)
                    .padding(.bottom,-20)
                        
                        HStack {
    
                                Button("Play Again"){
                                    isPressed = true
                                   }.fullScreenCover(isPresented: $isPressed ,content: ChoosePage.init)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 120)
                                .background(Color.orange)
                                .clipShape(Capsule())
                                .padding(.top,-40)
                            
                                       
                                    }
                    
                            }
                          
                        }
                        .padding(.top, -100)
                        .padding(.bottom)
                    }
                    .padding(.horizontal, 10)
                }
            }
