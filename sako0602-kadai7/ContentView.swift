//
//  ContentView.swift
//  sako0602-kadai7
//
//  Created by sako0602 on 2022/12/11.
//

import SwiftUI

struct ContentView: View {
    
    @State private var numText1 = ""
    @State private var numText2 = ""
//    @State private var subNumText1 = ""
//    @State private var subNumText2 = ""
    @State private var addTotal = "Label"
    @State private var subTotal = "Label"
    @FocusState private var numberPadClose: Bool
    
    var body: some View {
        TabView {
            ZStack{
                Color.orange
                VStack{
                    NumInputView(numText1: $numText1, numText2: $numText2)
                        .focused($numberPadClose)
                    Button("Button") {
                        numberPadClose = false
                        additionalCalc()
                    }
                    Text("\(addTotal)")
                        .padding()
                }
            }
            .tabItem {
                Text("Item 1")
            }

            ZStack{
                Color.green
                VStack{
                    NumInputView(numText1: $numText1, numText2: $numText2)
                        .focused($numberPadClose)
                    Button("Button"){
                        numberPadClose = false
                        subtractionCalc()
                    }
                    Text("\(subTotal)")
                        .padding()
                }
            }
            .tabItem {
                Text("Item 2")
            }
        }
    }
    
    func additionalCalc() {
        let unwrappedAddNum1 = Int(numText1) ?? 0
        let unwrappedAddNum2 = Int(numText2) ?? 0
        addTotal = String(unwrappedAddNum1 + unwrappedAddNum2)
    }
    
    func subtractionCalc() {
        let unwrappedSubNum1 = Int(numText1) ?? 0
        let unwrappedSubNum2 = Int(numText2) ?? 0
        subTotal = String(unwrappedSubNum1 - unwrappedSubNum2)
    }
    
}

struct NumInputView: View {
    
    @Binding var numText1: String
    @Binding var numText2: String
    
    var body: some View {
        VStack {
            TextField("", text: $numText1)
                .keyboardType(.numberPad)
                .frame(width: 70,height: 50)
                .background(Color.white)
                .border(Color.black)
                .padding()
            TextField("", text: $numText2)
                .keyboardType(.numberPad)
                .frame(width: 70,height: 50)
                .background(Color.white)
                .border(Color.black)
                .padding()
        }
    }
}
//
//struct AddNumInputView: View {
//
//    @Binding var addNumText1: String
//    @Binding var addNumText2: String
//
//    var body: some View {
//        VStack {
//            TextField("", text: $addNumText1)
//                .keyboardType(.numberPad)
//                .frame(width: 70,height: 50)
//                .background(Color.white)
//                .border(Color.black)
//                .padding()
//            TextField("", text: $addNumText2)
//                .keyboardType(.numberPad)
//                .frame(width: 70,height: 50)
//                .background(Color.white)
//                .border(Color.black)
//                .padding()
//        }
//    }
//}
//
//struct SubNumInputView: View {
//
//    @Binding var subNumText1: String
//    @Binding var subNumText2: String
//
//    var body: some View {
//        VStack {
//            TextField("", text: $subNumText1)
//                .keyboardType(.numberPad)
//                .frame(width: 70,height: 50)
//                .background(Color.white)
//                .border(Color.black)
//                .padding()
//            TextField("", text: $subNumText2)
//                .keyboardType(.numberPad)
//                .frame(width: 70,height: 50)
//                .background(Color.white)
//                .border(Color.black)
//                .padding()
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
