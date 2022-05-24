import SwiftUI

enum Category: String, CaseIterable, Hashable {
    case all = "전체"
    case values = "가치관"
    case aptitude = "적성"
    case career = "진로"
    case taste = "취향"
    case hobby = "취미"
    case thinking = "고민"
    case secret = "비밀"
    case reflection = "회고"
    case habit = "습관"
}

extension Category {
    var categoryImage: Image {
        switch self {
        case .all:
            return Image("")
        case .values:
            return Image.valuesImage
        case .aptitude:
            return Image.aptitudeImage
        case .career:
            return Image.careerImage
        case .taste:
            return Image.tasteImage
        case .hobby:
            return Image.hobbyImage
        case .thinking:
            return Image.thinkingImage
        case .secret:
            return Image.secretImage
        case .reflection:
            return Image.reflectionImage
        case .habit:
            return Image.habitImage
        }
    }
}

extension View {
    func categoryButtonStyle() -> some View {
        padding()
            .frame(width: 60, height: 30, alignment: .center)
            .foregroundColor(Color.white)
    }
}

extension Text {
    func categoryTextStyle() -> Text {
        fontWeight(.semibold)
            .font(.system(size: 15))
    }
}
