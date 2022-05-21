import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State private var selection = 1
    @State private var isShowingDetailView = false
    @State var firstNaviLinkActive: Bool = false
    @EnvironmentObject var userInformation : UserInformation

    var body: some View {
        NavigationView {
            if Auth.auth().currentUser != nil {
                TabView(selection: $selection) {
                    MainView().tabItem { Image(systemName: IconName.house).environment(\.symbolVariants, .none) }.tag(1)
                    FeedView().tabItem { Image(systemName: IconName.textSquare).environment(\.symbolVariants, .none) }.tag(2)
                    
                    MyPageView(firstNaviLinkActive: $firstNaviLinkActive, myPageData: userInformation.myPageData).tabItem { Image(systemName: IconName.person).environment(\.symbolVariants, .none) }.tag(3)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("🐼고민씨")
                            .padding(.leading, 16)
                            .font(.system(size: 22).weight(.bold))
                        .foregroundColor(.primaryColor) }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: getDestination(), isActive: $firstNaviLinkActive) {
                            Image(systemName: selection == 3 ? IconName.settings : IconName.pencil)
                                .padding(.all, 16)
                                .font(.system(size: 20))
                            .foregroundColor(.mainGreen) } }
                }
                .navigationBarTitleDisplayMode(.inline)
            } else {
                LogInView()
            }
        }
        .onAppear() {
            print("ContentView 시작")
        }
    }

    func getDestination() -> AnyView {
        if (selection == 3) {
            return AnyView(SettingsView())
        }
        else {
            return AnyView(QuestionMakingMain(firstNaviLinkActive: $firstNaviLinkActive))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserInformation())
    }
}
