import SwiftUI

struct TextTemplateView: View {
    
    @State var content: String
    
    var body: some View {
        Text(content)
    }
}

#Preview {
    TextTemplateView(content: "Hello World")
}
