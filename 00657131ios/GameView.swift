//
//  GameView.swift
//  00657131ios
//
//  Created by User11 on 2019/11/12.
//  Copyright © 2019 alice. All rights reserved.
//

import SwiftUI
struct GameView: View{
    var prinese = ["白雪","灰姑娘","茉莉","美人魚","睡美人"]
    var pick=["白雪","灰姑娘","茉莉","美人魚","睡美人"]
    var dead=["白雪壞","灰姑娘壞","茉莉壞","美人魚壞","睡美人壞"]
    var bad=["邪惡皇后","後母","Jafar","Ursula","黑魔后"]
    @State private var send = false
    @State private var selectedName = 0
    @State private var selectedNamebad = 0
    @State private var selectedNamedead = 0
    @State private var showpic = "白雪"
    var body: some View{
        VStack{
             Image(self.showpic)
            .resizable()
            .scaledToFill()
            .frame(width:200,height:300)
            .clipped()
            Picker(selection: self.$selectedName, label: Text("選擇公主")) {
                   ForEach(0..<self.pick.count) { (index) in
                Text(self.pick[index])
                }
                }
             /*Picker(selection: $showpic,label: Text("選擇角色")) {
                ForEach(pick, id: \.self) { (role) in
                Text(role)
              }
              }*/
            .pickerStyle(SegmentedPickerStyle())
            Spacer()
                
            Button(action:
                {if self.selectedName == self.selectedNamebad
                    {
                        self.showpic = self.dead[self.selectedName]
                    }
                else
                {
                    self.showpic = self.pick[self.selectedName]
                }
                self.send=true})
            {
                Text("確認")
               
            }
                    .alert(isPresented: $send){
                        ()->Alert in
                        if self.selectedName==self.selectedNamebad{
                            return Alert(title: Text("正確！"),message: Text("公主崩壞了恭喜"), dismissButton: .default(Text("再試一次")))
                        }
                        else{
                            return Alert(title: Text("錯誤！"),message: Text("再試試看別的！"), dismissButton: .default(Text("再試一次")))
                        }
                
            }
                
            
            
            
            
            Picker(selection: self.$selectedNamebad, label: Text("選擇剋星")) {
               ForEach(0..<self.bad.count) { (index) in
            Text(self.bad[index])
            }
            }
            /*Picker(selection: $selectedNamebad,label: Text("選擇剋星")) {
            ForEach(bad, id: \.self) { (role) in
               Text(role)
             }
             }*/
            .pickerStyle(SegmentedPickerStyle())
            Image(self.bad[self.selectedNamebad])
            .resizable()
            .scaledToFill()
            .frame(width:200,height:300)
            .clipped()
        
        }
        
        
    }
}

//.pickerStyle(SegmentedPickerStyle())
