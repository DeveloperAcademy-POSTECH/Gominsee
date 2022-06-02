import FirebaseFirestoreSwift
import Foundation

struct QuestionData: Identifiable, Hashable {
    @DocumentID var id: String?
    var nickname: String
    var question: String
    var category: [Category]
    var uploadDate: Date
    var myThought: [String]
    var isShared: Bool = false
    var isDeleted: Bool = false
}

extension QuestionData {
    static func all() -> [QuestionData] {
        return [
            QuestionData(id: "1", nickname: "케미", question: "인생의 좌우명은 무엇인가요", category: [.aptitude], uploadDate: Date(), myThought: ["carpe diem", "ABCDEFU"]),
            QuestionData(id: "2", nickname: "브라운", question: "평소에 무엇을 할 때 가장 즐거운가요", category: [.career], uploadDate: Date(), myThought: ["sleep"]),
            QuestionData(id: "3", nickname: "루키", question: "친구를 만날 때 주로 무슨 행위를 하시나요", category: [.aptitude], uploadDate: Date(), myThought: ["game"]),
            QuestionData(id: "4", nickname: "노엘", question: "오전 9시에는 어떤 행동을 주로 하시나요?", category: [.habit], uploadDate: Date(), myThought: ["C5"]),
            QuestionData(id: "5", nickname: "미뉴", question: "본인만 알고 있는 비밀이 있나요", category: [.secret], uploadDate: Date(), myThought: [""]),
            QuestionData(id: "6", nickname: "다온", question: "남들은 모르는 나만의 비밀이 있나요? 있다면 무엇인가요?", category: [.secret], uploadDate: Date(), myThought: [""])
        ]
    }
}
