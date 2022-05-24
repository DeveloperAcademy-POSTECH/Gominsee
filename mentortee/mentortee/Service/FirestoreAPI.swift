import Firebase
import FirebaseFirestoreSwift

class FireStoreManager: ObservableObject {
    // TODO: User가 답한 질문 필드를 만들어서 저장 후 해당값 제외한 오늘의 질문을 받아야 함
    @Published var dailyQuestion: [DailyQuestion] = []
    @Published var userQuestionList: [UserQuestion] = []
    var blackQuestion: [String] = ["아침에 일어나면 가장 먼저 무엇을 하시나요?"]
    let db = Firestore.firestore()

    init() {
        fetchDailyQuestionData()
        fetchUserQuestionData()
    }

    func fetchDailyQuestionData() {
        db.collection("DailyQuestion").whereField("question", notIn: blackQuestion)
            .getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    self.dailyQuestion.append(DailyQuestion(id: document.documentID, question: document.data()["question"] as? String ?? "", category: document.data()["category"].map { $0 } as? [String] ?? [""]))
                }
                print("dailyQuestion : \(self.dailyQuestion)")
            }
        }
    }

    func fetchUserQuestionData() {
        db.collection("UserQuestion").whereField("isShared", isEqualTo: false)
            .getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    // TODO: category enum형식으로 파싱해야함
                    self.userQuestionList.append(UserQuestion(id: document.documentID, nickname: document.data()["nickname"] as? String ?? "", question: document.data()["question"] as? String ?? "", cateogory: (document.data()["category"].map { $0 } as? [Category]) ?? [Category.all], uploadDate: document.data()["uploadDate"] as? Date ?? Date(), myThought: ""))
                }
                print("List : \(self.userQuestionList)")
            }
        }
    }

    func addUserQuestionData(questionData: UserQuestion) {
        let docData: [String: Any] = [
            "question": questionData.question,
            "category": questionData.cateogory.map { $0.rawValue },
            "nickname": questionData.nickname,
            "isDeleted": questionData.isDeleted,
            "isShared": questionData.isShared,
            "uploadDate": questionData.uploadDate
        ]
        
        db.collection("UserQuestion").document().setData(docData) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
}
