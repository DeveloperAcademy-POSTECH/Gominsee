//struct Question {
//    let id: Int
//    let question: String
//    let category: String
//    let writer: String
//}
//
//let tempData = Question (
//    id: 1,
//    question: "Chemi님은 뭘 할 때 가장 행복한가요?",
//    category: "가치관",
//    writer: "Chemi"
//)
struct QuestionData: Hashable {
    var category: String
    var otherThoughts: String
    var question: String
    var questionOwner: String
    var nickname: String
    var myName: String
}



extension QuestionData {
    static func all() -> [QuestionData] {
        return [
            QuestionData(category: "가치관", otherThoughts: "다른생각n개", question: "인생의 좌우명은 무엇인가요", questionOwner: "케미", nickname: "케미", myName: "브라운"),
            QuestionData(category: "취미", otherThoughts: "다른생각n개", question: "평소에 무엇을 할 때 가장 즐거운가요", questionOwner: "케미", nickname: "케미", myName: "브라운"),
            QuestionData(category: "취미", otherThoughts: "다른생각n개", question: "친구를 만날 때 주로 무슨 행위를 하시나요", questionOwner: "케미", nickname: "케미", myName: "노엘"),
            QuestionData(category: "습관", otherThoughts: "다른생각n개", question: "오전 9시에는 어떤 행동을 주로 하시나요?", questionOwner: "미뉴", nickname: "미뉴", myName: "루키"),
            QuestionData(category: "비밀", otherThoughts: "다른생각n개", question: "본인만 알고 있는 비밀이 있나요", questionOwner: "다온", nickname: "다온", myName: "케미")
        ]
    }
}
