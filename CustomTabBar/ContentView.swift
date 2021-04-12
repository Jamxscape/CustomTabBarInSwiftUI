//
//  ContentView.swift
//  CustomTabBar
//
// Created by BLCKBIRDS
// Visit BLCKBIRDS.COM FOR MORE TUTORIALS

import SwiftUI
class tabViewModel: ObservableObject {
    @Published public var tabViewHidden: Bool = false
}
struct ContentView: View {
    
    @StateObject var viewRouter: ViewRouter
    
    @State var showPopUp = false
    @ObservedObject var tabview: tabViewModel = tabViewModel()
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                switch viewRouter.currentPage {
                case .home:
                    HomeView(tabview: tabview)
                case .liked:
                    Text("Liked")
                case .records:
                   Text("Records")
                case .user:
                    Text("User")
                }
                Spacer()
                if tabview.tabViewHidden == false{
                ZStack {
                    if showPopUp {
                        PlusMenu(widthAndHeight: geometry.size.width/7)
                            .offset(y: -geometry.size.height/6)
                    }
                    HStack {
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .home, width: geometry.size.width/5, height: geometry.size.height/30, systemIconName: "homekit", tabName: "Home")
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .liked, width: geometry.size.width/5, height: geometry.size.height/30, systemIconName: "heart", tabName: "Liked")
                        ZStack {
                            Circle()
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width/7, height: geometry.size.width/7)
                                .shadow(radius: 4)
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width/7-6 , height: geometry.size.width/7-6)
                                .foregroundColor(Color("DarkPurple"))
                                .rotationEffect(Angle(degrees: showPopUp ? 90 : 0))
                        }
                            .offset(y: -geometry.size.height/8/2)
                            .onTapGesture {
                                withAnimation {
                                    showPopUp.toggle()
                                }
                            }
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .records, width: geometry.size.width/5, height: geometry.size.height/30, systemIconName: "waveform", tabName: "Records")
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .user, width: geometry.size.width/5, height: geometry.size.height/30, systemIconName: "person.crop.circle", tabName: "Account")
                    }
                        .frame(width: geometry.size.width, height: geometry.size.height/10)
                    .background(Color("TabBarBackground").shadow(radius: 1))
                }
                }
            }
                .edgesIgnoringSafeArea(.vertical)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
            .preferredColorScheme(.light)
    }
}

struct PlusMenu: View {
    
    let widthAndHeight: CGFloat
    
    var body: some View {
        HStack(spacing: 50) {
            ZStack {
                Circle()
                    .foregroundColor(Color("DarkPurple"))
                    .frame(width: widthAndHeight, height: widthAndHeight)
                Image(systemName: "record.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .frame(width: widthAndHeight, height: widthAndHeight)
                    .foregroundColor(.white)
            }
            ZStack {
                Circle()
                    .foregroundColor(Color("DarkPurple"))
                    .frame(width: widthAndHeight, height: widthAndHeight)
                Image(systemName: "folder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .frame(width: widthAndHeight, height: widthAndHeight)
                    .foregroundColor(.white)
            }
        }
            .transition(.scale)
    }
}

struct TabBarIcon: View {
    
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    
    let width, height: CGFloat
    let systemIconName, tabName: String

    var body: some View {
        VStack {
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
            .padding(.horizontal, -4)
            .onTapGesture {
                viewRouter.currentPage = assignedPage
            }
            .foregroundColor(viewRouter.currentPage == assignedPage ? Color("TabBarHighlight") : .gray)
    }
}
