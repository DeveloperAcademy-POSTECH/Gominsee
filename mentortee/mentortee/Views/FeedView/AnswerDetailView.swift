//
//  AnswerView.swift
//  mentortee
//
//  Created by 김민택 on 2022/04/06.
//

import SwiftUI

var showingOptions = false

public struct TextAlert {
  public var title: String // Title of the dialog
  public var message: String // Dialog message
  public var placeholder: String = "신고 사유를 적어주세요." // Placeholder text for the TextField
  public var accept: String = "신고할래요" // The left-most button label
  public var cancel: String? = "아니오" // The optional cancel (right-most) button label
  public var secondaryActionTitle: String? = nil // The optional center button label
  public var keyboardType: UIKeyboardType = .default // Keyboard tzpe of the TextField
  public var action: (String?) -> Void // Triggers when either of the two buttons closes the dialog
  public var secondaryAction: (() -> Void)? = nil // Triggers when the optional center button is tapped
} // 이거랑

extension UIAlertController {
  convenience init(alert: TextAlert) {
    self.init(title: alert.title, message: alert.message, preferredStyle: .alert)
    addTextField {
       $0.placeholder = alert.placeholder
       $0.keyboardType = alert.keyboardType
    }
    if let cancel = alert.cancel {
      addAction(UIAlertAction(title: cancel, style: .cancel) { _ in
        alert.action(nil)
      })
    }
    if let secondaryActionTitle = alert.secondaryActionTitle {
       addAction(UIAlertAction(title: secondaryActionTitle, style: .default, handler: { _ in
         alert.secondaryAction?()
       }))
    }
    let textField = self.textFields?.first
    addAction(UIAlertAction(title: alert.accept, style: .destructive) { _ in
      alert.action(textField?.text)
    })
  }
} // 이거랑

struct AlertWrapper<Content: View>: UIViewControllerRepresentable {
  @Binding var isPresented: Bool
  let alert: TextAlert
  let content: Content

  func makeUIViewController(context: UIViewControllerRepresentableContext<AlertWrapper>) -> UIHostingController<Content> {
    UIHostingController(rootView: content)
  }

  final class Coordinator {
    var alertController: UIAlertController?
    init(_ controller: UIAlertController? = nil) {
       self.alertController = controller
    }
  }

  func makeCoordinator() -> Coordinator {
    return Coordinator()
  }

  func updateUIViewController(_ uiViewController: UIHostingController<Content>, context: UIViewControllerRepresentableContext<AlertWrapper>) {
    uiViewController.rootView = content
    if isPresented && uiViewController.presentedViewController == nil {
      var alert = self.alert
      alert.action = {
        self.isPresented = false
        self.alert.action($0)
      }
      context.coordinator.alertController = UIAlertController(alert: alert)
      uiViewController.present(context.coordinator.alertController!, animated: true)
    }
    if !isPresented && uiViewController.presentedViewController == context.coordinator.alertController {
      uiViewController.dismiss(animated: true)
    }
  }
} // 이거랑

extension View {
  public func alert(isPresented: Binding<Bool>, _ alert: TextAlert) -> some View {
    AlertWrapper(isPresented: isPresented, alert: alert, content: self)
  }
} // 이거랑

struct AnswerView: View {
    @State private var showingOptions = false
    @State private var showingReportAlert = false
    @State private var showingDeleteAlert = false
    
    @State private var showDialog = false
    
    var thumbnail: String
    var nickname: String
    var date: String
    var contents: String
    var myName: String = "meenu"
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(systemName: thumbnail).resizable().frame(width: 28, height: 28).padding(5)
                VStack(alignment: .leading) {
                    HStack {
                        Text(nickname).font(.system(size: 16)).bold()
                        Text(date).font(.system(size: 12)).foregroundColor(Color.gray)
                        Spacer()
                        // 이 아래부분까지요
                        Button(action: { showingOptions = true }) {
                            Image(systemName: "ellipsis")
                        }.foregroundColor(Color.black).rotationEffect(Angle(degrees: 90))

                            .confirmationDialog("행동 선택", isPresented: $showingOptions) {
                                if (myName == nickname) {
                                    Button("수정하기") {
                                        print("수정하기")
                                    }
                                    Button("삭제하기", role: .destructive) {
                                        showingDeleteAlert = true
                                    }
                                }
                                else {
                                    Button("신고하기", role: .destructive) {
                                        showDialog = true
                                    }
                                }
                            }
                            .alert("정말 삭제하실 건가요?", isPresented: $showingDeleteAlert) {
                                Button("삭제할래요", role: .destructive) {}
                                Button("아니요", role: .cancel) {}
                            } message: {
                                Text("삭제하신 답변은 복구할 수 없어요 ㅠ^ㅠ      신중하게 생각하고 선택해주세요.")
                            }
                            .alert(isPresented: $showDialog, TextAlert(title: "정말 신고하실 건가요?", message: "") { result in
                                if let text = result {
                                    print(text)
                                }
                            })
                    }.padding(.init(top: 15, leading: 15, bottom: 5, trailing: 15))
                    Text(contents).font(.system(size: 16)).padding([.leading, .bottom, .trailing], 15)
                }.frame(maxWidth: .infinity, alignment: .leading).background(RoundedRectangle(cornerRadius: 10).fill(Color.backgroundColor))
            
            }.padding(.init(top: 5, leading: 10, bottom: 5, trailing: 10))
        }
    }
}

struct Accordion: View {
    @State private var collapsed = false
    var body: some View {
        ZStack {
            VStack {
                Spacer().frame(height: 60)
                ScrollView {
                    AnswerView(thumbnail: "person", nickname: "meenu", date: "1시간 전", contents: "노란색을 보면 기분이 좋아짐")
                    AnswerView(thumbnail: "person.fill", nickname: "chemi", date: "2시간 전", contents: "보라색")
                    AnswerView(thumbnail: "person.crop.circle", nickname: "brown", date: "3시간 전", contents: "브라운")
                    AnswerView(thumbnail: "person.crop.circle.fill", nickname: "noel", date: "4시간 전", contents: "보라색")
                    AnswerView(thumbnail: "person.circle", nickname: "rookie", date: "5시간 전", contents: "주황색")
                    AnswerView(thumbnail: "person.circle.fill", nickname: "daon", date: "6시간 전", contents: "연두색")
                    Spacer().frame(height: 10)
                }
            }.frame(maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? .infinity : 0).background(RoundedRectangle(cornerRadius: 10).fill(Color.white)).shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
            VStack {
                Button(action: { self.collapsed.toggle() }) {
                    HStack {
                        Text("9개의 생각이 있어요.").font(.system(size: 14)).foregroundColor(Color.black)
                        Spacer()
                        Image(systemName: collapsed ? "chevron.up.circle.fill" : "chevron.down.circle.fill").resizable().frame(width: 30, height: 30).foregroundColor(Color.mainGreen)
                    }.padding(10)
                }.frame(maxWidth: .infinity, maxHeight: 50).background(RoundedRectangle(cornerRadius: 10).fill(Color.white)).shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
                Spacer()
            }
        }.padding(.horizontal, 16.0)
    }
}

struct replyAnswer: View {
    @State private var checked = false
    @State var answer: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("질문에 대한 나의 생각을 적어주세요", text: $answer).font(.system(size: 16)).padding(.leading, 5.0)
                Button(action: {}) {
                    Image(systemName: "arrow.up.circle.fill").resizable().frame(width: 30, height: 30).foregroundColor(Color.primaryColor)
                }.padding(.trailing, 5.0)
            }.background(RoundedRectangle(cornerRadius: 20).fill(Color.backgroundColor)).padding(.horizontal, 10)
            Button (action: { self.checked.toggle() }) {
                HStack{
                    Image(systemName: checked ? "checkmark.circle.fill" : "checkmark.circle").foregroundColor(checked ? Color.mainGreen : Color.gray)
                    Text("내 생각 나만 볼래요").font(.system(size: 14)).foregroundColor(checked ? Color.black : Color.gray)
                }
            }.padding(.leading, 10)
        }.frame(maxWidth: .infinity, maxHeight: 85).background(Rectangle().fill(Color.white)).shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: -5)
    }
}

struct AnswerDetailView: View {
    var body: some View {
        VStack {
            Accordion()
//            TextFieldAlert()
            replyAnswer()
        }
    }
}

struct AnswerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerDetailView()
    }
}
