import SwiftUI
import FirebaseFirestoreSwift

struct MythoughtModalSheet: View {
    @Environment(\.dismiss) private var dismiss
    // MARK: - 수정필요
    
    var answerDateTime : Date
    var myAnswer : String

    var body: some View {

        ZStack {
            VStack {
                List {
                    Section(header: Text(answerDateTime.formatted())) {
                        Text(myAnswer)
                            .foregroundColor(.mainBlack)
                    }
                }
                    .background(Color.backgroundColor)
                    .clipShape(RoundedRectangle(cornerRadius: 10))

                Button(action: {
                    dismiss()
                }, label: {
                        Text(TextName.closeText).bold()
                            .frame(width: 310, height: 40, alignment: .center)
                    })
                    .foregroundColor(.mainBlack)
                    .frame(width: 310, height: 40, alignment: .center)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.backgroundColor))
                    .font(.system(size: 18))
            }
                .background(Color.backgroundColor)
        }
    }
}



//struct MythoughtModalSheet_Previews: PreviewProvider {
//    static var previews: some View {
//        MythoughtModalSheet()
//    }
//}
//
