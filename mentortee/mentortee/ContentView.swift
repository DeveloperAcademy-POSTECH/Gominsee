import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State private var selection = 1
    @State private var isShowingDetailView = false
    @EnvironmentObject var userInformation : UserInformation
    @AppStorage("log_status") var log_Status = true
    
    var body: some View {
        // MARK: 시뮬레이터 빌드시 필요
        if log_Status == false {
            NavigationView {
                TabView(selection: $selection) {
                    MainView().tabItem { Image(systemName: IconName.house).environment(\.symbolVariants, .none) }.tag(1)
                    FeedView().tabItem { Image(systemName: IconName.textSquare).environment(\.symbolVariants, .none) }.tag(2)
                    
                    MyPageView().tabItem { Image(systemName: IconName.person).environment(\.symbolVariants, .none) }.tag(3)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("🐼고민씨")
                            .padding(.leading, 16)
                            .font(.system(size: 22).weight(.bold))
                        .foregroundColor(.primaryColor) }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: getDestination()) {
                            Image(systemName: selection == 3 ? IconName.settings : IconName.pencil)
                                .padding(.all, 16)
                                .font(.system(size: 20))
                            .foregroundColor(.mainGreen) } }
                }
                .navigationBarTitleDisplayMode(.inline)
            }
//            .onAppear() {
//                print("내 UID : \(Auth.auth().currentUser?.uid)")
//            }
        } else {
            LogInView()
        }
    }
    
    func getDestination() -> AnyView {
        if (selection == 3) {
            return AnyView(SettingsView())
        }
        else {
            return AnyView(QuestionMakingMain())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserInformation())
    }
}
