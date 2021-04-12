//
//  HomeView.swift
//  CustomTabBar
//
//  Created by 马元 on 2021/4/8.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var tabview: tabViewModel
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: FirstView(tabview: tabview)){
                    VStack{
                        Text("点击此处跳转第一个页面")
                        Text("Click here, link to the FirstView")
                    }
                }
            }.onAppear(perform: {
                tabview.tabViewHidden = false
            }) // 在此处修改将Tabview隐藏 <- HERE
            .navigationBarTitle("HOME", displayMode: .inline)
        }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    @ObservedObject var tabview: tabViewModel  = tabViewModel()
//    static var previews: some View {
//        HomeView(tabview: tabview)
//    }
//}
