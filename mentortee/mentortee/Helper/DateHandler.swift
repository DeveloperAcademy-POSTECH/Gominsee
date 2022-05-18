import SwiftUI

func dateFormatKR() -> DateFormatter {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "ko-KR")
    formatter.dateFormat = "YY년 M월 d일 (eeee)"
    return formatter
}
