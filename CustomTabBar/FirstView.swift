//
//  FirstView.swift
//  CustomTabBar
//
//  Created by 马元 on 2021/4/12.
//

import SwiftUI

struct FirstView: View {
    
    @ObservedObject var tabview: tabViewModel
    var body: some View {
        VStack{
            List{
                Group{
                    Text("这是第一个页面")
                    Text("This is the first view !")
                    Text("这是第一个页面")
                    Text("This is the first view !")
                    Text("这是第一个页面")
                    Text("This is the first view !")
                    Text("这是第一个页面")
                    Text("This is the first view !")
                    Text("这是第一个页面")
                    Text("This is the first view !")
                }
                Group{
                    Text("这是第一个页面")
                    Text("This is the first view !")
                    Text("这是第一个页面")
                    Text("This is the first view !")
                    Text("这是第一个页面")
                    Text("This is the first view !")
                    Text("这是第一个页面")
                    Text("This is the first view !")
                    Text("这是第一个页面")
                    Text("This is the first view !")
                }
                Group{
                    Text("这是第一个页面")
                    Text("This is the first view !")
                    Text("这是第一个页面")
                    Text("This is the first view !")
                    Text("这是第一个页面")
                    Text("This is the first view !")
                    Text("这是第一个页面")
                    Text("This is the first view !")
                    Text("这是第一个页面")
                    Text("This is the first view !")
                }
            }
        }.onAppear(perform: {
            tabview.tabViewHidden = true
        })
    }
}

//struct FirstView_Previews: PreviewProvider {
//    @ObservedObject var tabview: tabViewModel  = tabViewModel()
//    static var previews: some View {
//        FirstView(tabview: tabview)
//    }
//}
