import SwiftUI

struct ArticleView: View {
    @ObservedObject var viewModel: ArticleViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(viewModel.title)
                    .font(.title)
                Spacer()
            }

            Text(viewModel.body)

            Spacer()
        }
        .padding(.horizontal)
        .task { await viewModel.fetchArticle() }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(viewModel: ArticleViewModel(path: ""))
    }
}
