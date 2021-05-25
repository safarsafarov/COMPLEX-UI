//
//  ContentView.swift
//  complex-UI
//
//  Created by codestorm on 2021/5/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Home : View {
    @State var menu = 0
    @State var page = 0
    
    var body: some View {
        ZStack {
            Color("Color").edgesIgnoringSafeArea(.all)
            
            VStack {
                ZStack {
                    HStack {
                        Button(action: {
                            
                        }) {
                            Image("Menu")
                                .renderingMode(.original)
                                .padding()
                        }
                        .background(Color.white)
                        .cornerRadius(10)
                        
                        Spacer()
                        
                        Image("pic")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .cornerRadius(12)
                    }
                    .padding(.horizontal)
                    
                    Text("Food Items")
                        .font(.system(size: 22))
                }
                
                HStack{
                    Button(action: {
                        self.menu = 0
                    }) {
                        Text("Chinese")
                            .foregroundColor(self.menu == 0 ? .white : .black)
                            .padding(.vertical)
                            .padding(.horizontal, 20)
                        
                    }
                    .background(self.menu == 1 ? Color.black : Color.white)
                    .clipShape(Capsule())
                    
                    Button(action: {
                        self.menu = 2
                    }) {
                        Text("Mexican")
                            .foregroundColor(self.menu == 2 ? .white : .black)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                    }
                    .background(self.menu == 1 ? Color.black : Color.white)
                    .clipShape(Capsule())
                }
                .padding(.top, 30)
                
                GeometryReader{g in
                    Carousel(width: UIscreen.main.bounds.width, page: self.$page, height: g.frame(in: .global).height)
                }
            }
        }
    }
}


struct Carousel : UIViewRepresentable {
    
    func makeCoordinator() ->  Coordinator {
        
        return Carousel.Coordinator(parent1: self)
        
    }
    
    var width: CGFloat
    @Binding var page : Int
    var height : CGFloat
    
    func makeUIView(context : Context) -> UIScrollView {
        let total = width * CGFloat(data.count)
        let view = UIScrollView()
        
        view.isPagingEnabled = true
        
        view.contentSize - CGSize(width: total, height: 1.0)
        view.bounces = true
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.delegate = context.coordinator
        
        let view1 = UIHostingController(rootView: List(page: self.$page))
        view1.view.frame = CGRect(x: 0, y: 0, width: total, height: self.height)
        view1.view.backgroundColor = .clear
        view.addSubview(view1.view)
        
        return view
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
    }
    
    class Coordinator : NSObject,UIScrollViewDelegate{
        
        var parent : Carousel
        
        init(parent1: Carousel) {
            parent = parent1
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let 
        }
        
    }
}
