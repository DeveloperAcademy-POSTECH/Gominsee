////
////  MakingNicknameView.swift
////  mentortee
////
////  Created by Yu ahyeon on 2022/04/11.
////

import SwiftUI
import UIKit
import CoreData

struct Nickname: View {
//    @ObservedObject var userSetting = UserSetting()

    @Environment(\.managedObjectContext) private var viewContext

//    @FetchRequest(entity: User.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \User.username, ascending: true)])
    @FetchRequest(entity: User.entity(), sortDescriptors: [])
    var UserInfo: FetchedResults<User>
    @Binding var accessToken: String

    @State private var name : String = ""
    // 기기별 스크린너비 변수받아오기
    let screenWidth1 = UIScreen.main.bounds.size.width
    let screenHeight1 = UIScreen.main.bounds.size.height

    var body: some View {
        ZStack{
            Color.backgroundColor.ignoresSafeArea()
            //배경색 영역
            VStack {
                VStack {
                    Text("반가워요!")
                        .font(.system(size: 30))
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("별명이 뭐에요?")
                        .font(.system(size: 30))
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .foregroundColor(.mainGreen)
                    .padding(.bottom, 50)
                HStack {
                    TextField("닉네임을 입력하세요(최대 n자)", text: $name)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 16))
                        .padding(.leading, 10)
                    Button(action: {
                        addItem()
                    }) {
                        Text("중복 확인")
                    }.padding(.trailing, 10)
                }
                .padding(.vertical, 15)
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white))
                NavigationLink(destination: MainView(accessToken: .constant(""))) {
                    Text("입력 완료")
                }.frame(maxWidth: .infinity, maxHeight: 50).background(RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.primaryColor))
//                NavigationLink(destination: MainView()) {
//                    Button(action: { addItem() }) {
//                        Text("입력 완료").foregroundColor(Color.white)
//                    }.background(Color.primaryColor)
//                }
            }.padding(.horizontal, 16)
                .padding(.top, -200)
//            ScrollView {
//                List {
//                    ForEach(UserInfo) { users in
//                        Text(users.username ?? "이름 없음")
//                    }
//                }
//            }
        }
        .onTapGesture {
            hideKeyboard()
        }//탭치면 키보드 내려감

    }

    private func addItem() {
        
        print("add item")
        withAnimation {
            //수정 부분
            if UserInfo.isEmpty {
                print("empty array")
            }
            else {
                print("before foreach")
                var cnt = 0
                for i in UserInfo {
                    if i.username == self.name {
                        self.accessToken = self.name
                        break
                    }
                    if UserInfo.endIndex == cnt {
                        self.accessToken = self.name
                        let newUser = User(context: viewContext)
                        newUser.username = self.name
                        name = ""
                        saveItems()
                    }
                    cnt += 1
                    print(i.username ?? "이름없음")
                }
//                ForEach(UserInfo) { users in
//                    print(users.wrappedUserName)
//                    if users.wrappedUserName == self.name {
//                        self.accessToken = self.name
//                    }
//                }
//                print(self.UserInfo.wrappedUserName)
//                ForEach(UserInfo, id: \.self) { (users: User) in
//                    Text(users.username! )
//                    let _ = print("되는거니")
//                    let _ = print(users.wrappedUserName)
    //                if users.wrappedUserName == self.name {
    //                    self.accessToken = self.name
    //                }
//                }
                print("after foreach")
            }
//            ForEach(UserInfo) { users in
//                let _ = print(users.wrappedUserName)
//                if users.wrappedUserName == self.name {
//                    self.accessToken = self.name
//                }
//            }
//            if UserInfo.isEmpty {
//                let newUser = User(context: viewContext)
//                newUser.username = name
//                name = ""
//                saveItems()
//                print(newUser.username)
//            } else {
//                print("success")
//            }
////            }
        }
    }

    private func saveItems() {
        print("saveItems")
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
//    private func getUser(){
////        let request = NSFetchRequest<User>(entityName:"User")
////
////        let filter = NSPredicate(format: "username == %@", self.name)
////
////
////        request.predicate = filter
//
//        @FetchRequest(
//            sortDescriptors: [NSSortDescriptor(keyPath: \User.userName, ascending: true)],
//            predicate: NSPredicate(format: "User == %@", self.name),
//            animation: .default) var users: FetchedResults<User>
//
//
//    }

}


//========================================
//struct Nickname: View {
//    @Environment(\.managedObjectContext) private var viewContext
//    @FetchRequest(entity: User.entity(), sortDescriptors: [])
//    var UserInfo: FetchedResults<User>
//    @State var textFieldTitle: String = ""
//
//    var body: some View {
//        NavigationView {
//            VStack(spacing: 10) {
//                TextField("", text: $textFieldTitle)
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .frame(height: 55)
//                    .background(Color(UIColor.secondarySystemBackground).cornerRadius(10))
//                    .padding(.horizontal, 10)
//
//                Button(action: {addItem()}, label: {
//                    Text("저장")
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .frame(height: 55)
//                        .foregroundColor(.white)
//                        .background(RoundedRectangle(cornerRadius: 10))
//                        .padding(.horizontal, 10)
//
//                })
////                print(UserInfo.count)
//                if UserInfo.isEmpty {
//                    let _ = print("empty")
//                }
//                else {
//                    List {
//                            ForEach(UserInfo) { users in
//                                //과일에 이름이 없으면 빈문자열을 생성
//                                Text(users.username ?? "이름 없음")
//                            }
//    //                    .onDelete(perform: deleteItems)
//                    }
//                }
//
//
//
//            }
//
//        }
//    }
//    private func addItem() {
//            withAnimation {
//                //수정 부분
//                let newUser = User(context: viewContext)
//                newUser.username = textFieldTitle
//                //textFieldTitle을 사용 후 재설정
////                print("addItem:  \(newUser.username)")
//                textFieldTitle = ""
//
//                saveItems()
//        }
//    }
//
//    private func saveItems() {
//            do {
//                try viewContext.save()
//            } catch {
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//        }
//    }
//
//}

struct Nickname_Previews: PreviewProvider {
    static var previews: some View {
        Nickname(accessToken: .constant(""))
//        Nickname()
    }
}

