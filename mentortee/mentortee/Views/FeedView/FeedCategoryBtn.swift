import SwiftUI

enum categoryBtn: String {
    case all = "전체"
    case veiwPoint = "가치관"
    case career = "진로"
    case preference = "취향"
    case hobby = "취미"
    case concern = "고민"
    case secret = "비밀"
    case reflection = "회고"
    case habit = "습관"
}

struct FeedCategoryBtn: View {
    @State var categoryList = ["전체" ,"가치관", "진로", "취향", "취미", "고민", "비밀", "회고", "습관"]
    @State var currentIdx = 0
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(categoryList, id:\.self) { value in
                    Button(value) {
                        currentIdx = categoryList.firstIndex(of: value)!
                    }
                    .frame(width: 60, height: 30, alignment: .center)
                    .foregroundColor(Color.white)
                    .background(RoundedRectangle(cornerRadius: 40)
                        .fill( currentIdx == categoryList.firstIndex(of: value)!  ? Color.primaryColor : Color.gray))
                }
            }
        }
    }
}

struct FeedCategoryBtn_Previews: PreviewProvider {
    static var previews: some View {
        FeedCategoryBtn()
    }
}
