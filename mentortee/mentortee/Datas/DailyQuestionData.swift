import SwiftUI

struct DailyQuestion: Identifiable {
    var id: String
    var question: String = ""
    var category: [Category] = []
}
