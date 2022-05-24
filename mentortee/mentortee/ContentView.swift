import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State private var selection = 1
    @State private var isShowingDetailView = false
    @State private var firstNaviLinkActive: Bool = false
    @EnvironmentObject var userInformation : UserInformation
    @AppStorage("log_status") var log_Status = true
    
    var body: some View {
        if log_Status {
            NavigationView {
                TabView(selection: $selection) {
                    MainView().tabItem { Image(systemName: IconName.house).environment(\.symbolVariants, .none) }.tag(1)
                    FeedView().tabItem { Image(systemName: IconName.textSquare).environment(\.symbolVariants, .none) }.tag(2)
                    
                    MyPageView(firstNaviLinkActive: $firstNaviLinkActive).tabItem { Image(systemName: IconName.person).environment(\.symbolVariants, .none) }.tag(3)
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
            }
            .onAppear() {
                print("ContentView 시작")
            }
        } else {
            LogInView()
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
