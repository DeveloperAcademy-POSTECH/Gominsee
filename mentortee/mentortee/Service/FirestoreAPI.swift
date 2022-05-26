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
        var categoryList: [Category] = []
        db.collection("DailyQuestion").whereField("question", notIn: blackQuestion)
            .getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    categoryList.removeAll()
                    let array = document.data()["category"] as? [String] ?? [""]
                    for index in array {
                        categoryList.append(self.castingCategory(category: index))
                    }
                    self.dailyQuestion.append(DailyQuestion(id: document.documentID, question: document.data()["question"] as? String ?? "", category: categoryList))
                }
                for index in self.dailyQuestion {
                    print("index : \(index)")
                }
            }
        }
    }

    func fetchUserQuestionData() {
        var categoryList: [Category] = []
        db.collection("UserQuestion").whereField("isShared", isEqualTo: false)
            .getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    categoryList.removeAll()
                    let array = document.data()["category"] as? [String] ?? [""]
                    for index in array {
                        categoryList.append(self.castingCategory(category: index))
                    }
                    self.userQuestionList.append(UserQuestion(id: document.documentID, nickname: document.data()["nickname"] as? String ?? "", question: document.data()["question"] as? String ?? "", cateogory: categoryList, uploadDate: document.data()["uploadDate"] as? Date ?? Date(), myThought: ""))
                }
            }
        }
    }

    func castingCategory(category: String) -> Category {
        switch category {
        case Category.values.rawValue:
            return Category.values
        case Category.aptitude.rawValue:
            return Category.aptitude
        case Category.career.rawValue:
            return Category.career
        case Category.taste.rawValue:
            return Category.taste
        case Category.hobby.rawValue:
            return Category.hobby
        case Category.thinking.rawValue:
            return Category.thinking
        case Category.secret.rawValue:
            return Category.secret
        case Category.reflection.rawValue:
            return Category.reflection
        case Category.habit.rawValue:
            return Category.habit
        default:
            return Category.all
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
