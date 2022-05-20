import SwiftUI

extension Text {
    func dateTextStyle() -> Text {
        bold()
    }

    func dailyQuestionTextStyle() -> Text {
        bold()
            .font(.system(size: 35))
    }

    func dailyCategoryTextStyle() -> Text {
        font(.system(size: 14))
            .foregroundColor(Color.primaryColor)
    }

    func categoryDoneTextStyle() -> Text {
        bold()
            .font(.system(size: 20))
    }
}
