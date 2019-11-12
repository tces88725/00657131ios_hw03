//
//  IntroView.swift
//  00657131ios
//
//  Created by User11 on 2019/11/12.
//  Copyright © 2019 alice. All rights reserved.
//

import SwiftUI
struct IntroView: View{
    init(){UITableView.appearance().backgroundColor = .clear}
    @State private var name = ""
    @State private var isAge = false
    @State private var age = 1
    @State private var selectGender = "Male"
    let genders = ["Male", "Female"]
    @State private var birthday = Date()
    @State private var showActionSheet = false
    let dateFormatter: DateFormatter =
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }()
    @State private var showGamePage = false
    @State private var showNameAlert = false
    var body: some View{
        NavigationView{
        VStack{
            Image("disneyland")
                .resizable()
                .scaledToFill()
                .frame(width:200,height:200)
                .clipped()
            TextField("Your Name", text: $name)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth:1))
            .frame(width:300)
            .multilineTextAlignment(.center)
            
            Toggle("告訴我你的年齡？", isOn:$isAge)
            if isAge{
            Stepper(value: $age, in: 1...100)
            {
                if age == 1
                {
                    Text("\(age)歲")
                }
                else
                {
                    Text("\(age)歲")
                }
            }
            .frame(width:200)
            }
            Form{
                
                Picker("Gender",selection:$selectGender){
                ForEach(genders, id: \.self){
                        (gender) in
                        Text(gender)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                DatePicker("生日",selection:$birthday,in:...Date(),displayedComponents:.date)
                }
            .padding(EdgeInsets(top:30,leading:0,bottom:0,trailing:0))
            .frame(width:400,height:300)
            .clipped()
            
            Button(action:{
                if self.name==""{
                    self.showNameAlert = true
                }
                else{
                    self.showGamePage = true
                }
            })
            {
                HStack
                {
                    Text("START")
                    .fontWeight(.semibold)
                    Image(systemName: "play")

                }
                .background(Color.red)
                .cornerRadius(50)
            }
            .alert(isPresented: $showNameAlert){
                ()->Alert in
                return Alert(title: Text("errer!"),message: Text("你還沒輸入名字"))
            }
            .sheet(isPresented:self.$showGamePage){
                GameView()
            }
            /*{
                GameView(showGamePage:self.$showGamePage,
                         isProfile:self.$isProfile,
                         name:self.$name,
                         birthday:self.$birthday,
                         age:self.$age,
                         isGender:self.$isGender,
                         selectGender:self.$selectGender)
            }*/
            }
        .navigationBarTitle("公主崩壞")
        .font(.largeTitle)
        }
        
        }
    }
struct IntroView_Previews: PreviewProvider
{
    static var previews: some View
    {
        IntroView()
    }
}


