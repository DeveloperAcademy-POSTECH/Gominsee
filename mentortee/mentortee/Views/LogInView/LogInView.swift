import SwiftUI
import FirebaseAuth

struct LogInView: View {
    @Environment(\.window) var window: UIWindow?
    @State private var appleLoginCoordinator: AppleAuthCoordinator?
    let screenWidth2 = UIScreen.main.bounds.size.width
    let screenHeight2 = UIScreen.main.bounds.size.height

    var body: some View {
        VStack {
            VStack {
                Text("고민씨")
                    .font(.system(size: 30))
                    .bold()
                    .padding(.bottom, 50)
                    .foregroundColor(Color.primaryColor)

                Group {
                    Text("하루에 한번 질문을 통해")
                        .bold()

                    Text("나를 만나보세요")
                        .bold()
                        .padding(.top, 0)
                        .padding(EdgeInsets(top: 0, leading: 8, bottom: 100, trailing: 25))
                }
                    .font(.system(size: 21))
                    .foregroundColor(.mainGreen)

                Button(action: {
                    appleLogin()
                }) {

                    HStack {
                        Image(systemName: IconName.applelogo)
                            .foregroundColor(.mainBlack)

                        Text("Apple로 로그인")
                            .foregroundColor(.mainBlack)
                            .padding()

                    }
                        .frame(width: screenWidth2 * 0.75, height: screenHeight2 * 0.05)
                        .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 2))
                }
            }
        }
    }
    func appleLogin() {
        appleLoginCoordinator = AppleAuthCoordinator(window: window)
        appleLoginCoordinator?.startAppleLogin()
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}



