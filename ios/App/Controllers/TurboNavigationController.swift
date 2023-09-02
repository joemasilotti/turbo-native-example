import SwiftUI
import Turbo
import UIKit
import WebKit

let rootURL = URL(string: "http://localhost:3000")!

class TurboNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        visit(rootURL)
    }

    func visit(_ url: URL) {
        let proposal = VisitProposal(url: url, options: VisitOptions())
        visit(proposal)
    }

    // MARK: Private

    private lazy var session: Session = {
        let configuration = WKWebViewConfiguration()
        // Identifies Turbo Native apps with `turbo_native_app?` helper in Rails.
        configuration.applicationNameForUserAgent = "Turbo Native iOS"

        let session = Session(webViewConfiguration: configuration)
        session.delegate = self
        session.pathConfiguration = PathConfiguration(sources: [
            .server(rootURL.appending(path: "/configuration.json"))
        ])
        return session
    }()

    private func visit(_ proposal: VisitProposal) {
        if proposal.properties["controller"] as? String == "article" {
            let viewModel = ArticleViewModel(path: proposal.url.path())
            let view = ArticleView(viewModel: viewModel)
            let controller = UIHostingController(rootView: view)
            pushViewController(controller, animated: true)
        } else {
            let visitable = VisitableViewController(url: proposal.url)
            pushViewController(visitable, animated: true)
            session.visit(visitable, options: proposal.options)
        }
    }
}

// MARK: SessionDelegate

extension TurboNavigationController: SessionDelegate {
    func session(_ session: Session, didProposeVisit proposal: VisitProposal) {
        visit(proposal)
    }

    func session(_ session: Session, didFailRequestForVisitable visitable: Visitable, error: Error) {
        print("Error visiting page: \(error.localizedDescription)")
    }

    func sessionWebViewProcessDidTerminate(_ session: Session) {
        session.reload()
    }
}
