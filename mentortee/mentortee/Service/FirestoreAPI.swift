import Firebase

class FireStoreManager: ObservableObject {
    // TODO: User가 답한 질문 필드를 만들어서 저장 후 해당값 제외한 오늘의 질문을 받아야 함
    @Published var dailyQuestion: [DailyQuestion] = [DailyQuestion(id: "", question: "", category: [])]
    var blackQuestion: [String] = ["아침에 일어나면 가장 먼저 무엇을 하시나요?"]

    func fetchData() {
        let db = Firestore.firestore()
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

    init() {
        fetchData()
    }
}
