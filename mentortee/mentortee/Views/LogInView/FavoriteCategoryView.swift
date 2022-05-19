import SwiftUI

struct FavoriteCategoryView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selection: Set<Category> = []
    let colunmn = [GridItem(.adaptive(minimum: 100))]

    var body: some View {
        GeometryReader { geo in
            VStack {
                selectFavoriteCategory()
                Spacer()
                    .frame(height: geo.size.height * 0.1)
                choosingDoneButton(geo: geo)
            }
                .frame(minHeight: geo.size.height, alignment: .center)
        }
            .navigationBarItems(leading: Button(action: { dismiss() }, label: {
                Image(systemName: IconName.backward)
                    .padding(.all, 16)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
            }))
    }

    private func selectFavoriteCategory() -> some View {
        LazyVGrid(columns: colunmn, spacing: 60) {
            ForEach(Category.allCases, id: \.rawValue) { value in
                Group {
                    Button(action: { checkSelection(category: value) }) {
                        VStack {
                            value.categoryImage
                                .resizable()
                                .frame(width: 80, height: 80)
                            categoryImage(value: value)
                        }
                    }
                }
            }
        }
    }

    private func categoryImage(value: Category) -> some View {
        Text(value.rawValue)
            .foregroundColor(.white)
            .frame(width: 70, height: 20, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 40)
                .fill(selection.contains(value) ? Color.primaryColor : Color.gray))
    }

    private func choosingDoneButton(geo: GeometryProxy) -> some View {
        Button(action: {
            dismiss()
        }, label: {
                Text(TextName.choosingDone)
                    .categoryDoneTextStyle()
                    .foregroundColor(.white)
                    .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.07)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.primaryColor))
            })
    }

    func checkSelection(category: Category) {
        if selection.contains(category) {
            selection.remove(category)
        } else {
            selection.insert(category)
        }
    }


    struct FavoriteCategoryView_Previews: PreviewProvider {
        static var previews: some View {
            FavoriteCategoryView()
        }
    }
}
