import SwiftUI
import FirebaseAuth

struct SettingsView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @AppStorage("log_status") var log_Status = false
    
    var body: some View {
        List {
            NavigationLink(destination: FavoriteCategoryView()
                .navigationBarBackButtonHidden(true)
                .navigationTitle(Text(TextName.favoriteCategoryText))) {
                    Text(TextName.favoriteCategoryText) }
                .foregroundColor(.mainBlack)
            Text("닉네임 변경")
            Button(action: {
                do {
                    try Auth.auth().signOut()
                } catch let signOutError as NSError {
                    print("Error signing out: %@", signOutError)
                }
                DispatchQueue.global(qos: .background).async {
                    try? Auth.auth().signOut()
                }
                withAnimation(.easeInOut) {
                    log_Status = false
                }
            }, label: {
                Text("로그아웃")
                    .frame(maxWidth: .infinity, alignment: .leading)
            })
            Text("버전 정보 1.0.0")
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.mode.wrappedValue.dismiss()
        }) {
            Image(systemName: IconName.backward)
                .padding(.all, 16)
                .font(.system(size: 20))
                .foregroundColor(.mainBlack)
        })
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
