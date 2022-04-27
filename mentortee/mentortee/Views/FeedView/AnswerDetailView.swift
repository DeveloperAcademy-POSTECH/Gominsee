import SwiftUI

struct AnswerDetailView: View {
    var body: some View {
        VStack {
            Accordion()
            ReplyAnswer()
        }
    }
}

struct AnswerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerDetailView()
    }
}
