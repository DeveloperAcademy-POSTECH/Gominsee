////
////  MakingNicknameView.swift
////  mentortee
////
////  Created by Yu ahyeon on 2022/04/11.
////

import SwiftUI
import UIKit

struct Nickname: View {
    @ObservedObject var userSetting = UserSetting()

    @Environment(\.managedObjectContext) private var viewContext




//    let fetchRequest: NSFetchRequest<User> fetchRequest = User.fetchRequest()

    @State private var name : String = ""
    // 기기별 스크린너비 변수받아오기
    let screenWidth1 = UIScreen.main.bounds.size.width
    let screenHeight1 = UIScreen.main.bounds.size.height

    @FetchRequest(entity: User.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \User.username, ascending: true)], predicate: NSPredicate(format:"username == %@", $name)) var UserInfo: FetchedResults<User>

    var body: some View {
        ZStack{
            Color.backgroundColor.ignoresSafeArea()
            //배경색 영역
            VStack {
                VStack{
                    Text("반가워요!")
                        .font(.system(size: 30))
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("별명이 뭐에요?")
                        .font(.system(size: 30))
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                }.foregroundColor(.mainGreen)
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
                    }
                }
                .padding(.vertical, 15)
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white))
                NavigationLink(destination: MainView()) {
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
        }
        .onTapGesture {
            hideKeyboard()
        }//탭치면 키보드 내려감
    }

    private func addItem() {
        print("a")
        withAnimation {
//            @FetchRequest(entity: User.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \User.username, ascending: true)], predicate: NSPredicate(format:"username == %@", self.name)) var UserInfo: FetchedResults<User>
            
            let _ = print(self.name)
            
            //수정 부분
            if UserInfo.isEmpty {
                let newUser = User(context: viewContext)
                newUser.username = name
                name = ""
                saveItems()
            } else {
                print("success")
            }
            self.userSetting.accessToken = name
//            }
        }
    }

    private func saveItems() {
        print("b")
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }

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
        Nickname()
    }
}

