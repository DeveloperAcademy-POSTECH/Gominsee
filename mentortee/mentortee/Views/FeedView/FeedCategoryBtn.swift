import SwiftUI

struct FeedCategoryBtn: View {
    @Binding var currentIdx: String
    var categoryBtn = CategoryBtn.allCases

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(categoryBtn, id:\.self) { value in
                    Button(value.rawValue) {
                        currentIdx = value.rawValue
                    }
                    .frame(width: 60, height: 30, alignment: .center)
                    .foregroundColor(Color.white)
                    .background(RoundedRectangle(cornerRadius: 40)
                        .fill( currentIdx == value.rawValue ? Color.primaryColor : Color.gray))
                }
            }
        }
    }
}

struct FeedCategoryBtn_Previews: PreviewProvider {
    static var previews: some View {
        FeedCategoryBtn(currentIdx: .constant(""))
    }
}
