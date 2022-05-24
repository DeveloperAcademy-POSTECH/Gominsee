import Foundation

final class UserInformation : ObservableObject {
    @Published var myPageData : MyPageData = MyPageData(username: "Chemi", myQuestionCount: 0, myAnswerCount: 0, userLV: 0)
    @Published var questionData = UserQuestion.all()
}
