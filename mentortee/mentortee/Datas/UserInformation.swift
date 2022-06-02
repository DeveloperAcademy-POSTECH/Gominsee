import Foundation

final class UserInformation : ObservableObject {
    // TODO: User접속 시 아이디와 닉네임 등 정보를 추출해서 마이페이지 데이터에 넣어야됨 
    @Published var myPageData : MyPageData = MyPageData(username: "Chemi", myQuestionCount: 0, myAnswerCount: 0, userLV: 0)
    @Published var questionData = QuestionData.all()
}
