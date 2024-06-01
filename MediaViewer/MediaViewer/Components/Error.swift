import Foundation
import SwiftUI

class MyError: LocalizedError {
    let message: String?
    let title: String?
    let type: String?
    let dismissButton: String?

    init(message: String? = nil, type: String? = nil, title: String? = nil, dismissButton: String? = nil) {
        self.message = message
        self.type = type
        self.title = title
        self.dismissButton = dismissButton
    }

    init(error: MyError, message: String? = nil, type: String? = nil, title: String? = nil, dismissButton: String? = nil) {
        if let message = message { self.message = message } else { self.message = error.message }
        if let type = type { self.type = type } else { self.type = error.type }
        if let title = title { self.title = title } else { self.title = error.title }
        if let dismissButton = dismissButton { self.dismissButton = dismissButton } else { self.dismissButton = error.dismissButton }
    }

    func toString() -> String {
        var str = ""
        if let type = type { str += "\(type): " }
        if let title = title { str += "\(title): " }
        if let message = message { str += "\(message)" }
        return str
    }

    var errorDescription: String? {
        return toString()
    }

    var localizedDescription: String? {
        return toString()
    }

    var failureReason: String? {
        return toString()
    }
}

extension MyError {
    static func basic(_ message: String, title: String? = nil) -> MyError {
        return MyError(message: message, type: "Runtime Error", title: title)
    }
}

struct ErrorAlert: ViewModifier {
    @Binding var error: MyError?
    var isShowingError: Binding<Bool> {
        Binding {
            error != nil
        } set: { _ in
            error = nil
        }
    }

    func body(content: Content) -> some View {
        content
            .alert(isPresented: isShowingError) {
                Alert(
                    title: Text(error?.title ?? "Error"),
                    message: Text(error?.message ?? "Unknown Error"),
                    dismissButton: .default(Text(error?.dismissButton ?? "OK"))
                )
            }
    }
}

extension View {
    func errorAlert(_ error: Binding<MyError?>) -> some View {
        modifier(ErrorAlert(error: error))
    }

    func errorAlert(_ error: MyError?) -> some View {
        modifier(ErrorAlert(error: .constant(error)))
    }
}
