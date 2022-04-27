import SwiftUI

enum ReportDialog: String, CaseIterable {
    case spam = "스팸"
    case sexual = "성적인 발언"
    case unlike = "마음에 들지 않습니다"
    case hate = "혐오 발언"
    case fraud = "사기 또는 거짓"
    case bullying = "따돌림 또는 괴롭힘"
    case violence = "폭력 또는 위험한 단체"
    case copyright = "지식 재산권 침해"
    case ect = "기타"
}


extension AnswerView {
    static func all() -> [AnswerView] {
        return [
            AnswerView(thumbnail: "thumbnail_lv1", nickname: "meenu", date: "1시간 전", contents: "노란색을 보면 기분이 좋아짐"),
            AnswerView(thumbnail: "thumbnail_lv2", nickname: "chemi", date: "2시간 전", contents: "보라색"),
            AnswerView(thumbnail: "thumbnail_lv3", nickname: "brown", date: "3시간 전", contents: "브라운"),
            AnswerView(thumbnail: "thumbnail_lv1", nickname: "noel", date: "4시간 전", contents: "보라색"),
            AnswerView(thumbnail: "thumbnail_lv3", nickname: "rookie", date: "5시간 전", contents: "주황색"),
            AnswerView(thumbnail: "thumbnail_lv2", nickname: "daon", date: "6시간 전", contents: "연두색")
        ]
    }
}
