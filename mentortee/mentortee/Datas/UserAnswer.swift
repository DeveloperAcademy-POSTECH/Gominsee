import FirebaseFirestoreSwift
import Foundation

struct UserAnswer: Identifiable, Hashable {
    @DocumentID var id: String?
    var nickname: String
    var question: String
    var category: [Category]
    var uploadDate: Date
    var myThought: String
    var isShared: Bool = false
    var isDeleted: Bool = false
}
