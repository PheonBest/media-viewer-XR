import SwiftUI

struct RichText: View, Codable {
    var richTextNodes: [RichTextNode]?

    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                VStack(alignment: .leading, spacing: 40) {
                    if let nodes = richTextNodes {
                        ForEach(nodes, id: \.self) { node in
                            ZStack(alignment: .top) {
                                node
                            }
                        }
                    }
                    Spacer(minLength: 0)
                }.padding(40)
            }.padding(.vertical, 1)
        }
    }

    private enum CodingKeys: String, CodingKey {
        case richTextNodes
    }
}

struct RichTextNode: View, Codable, Hashable {
    var type: RichTextType
    var text: String?
    var url: String?
    var children: [RichTextNode]?
    var bold: Bool = false
    var italic: Bool = false
    var underline: Bool = false
    var strikethrough: Bool = false
    var code: Bool = false
    var format: String?

    var fileExtension: String?
    var allowXRotation: Bool?
    var allowYRotation: Bool?
    var autoRotate: Bool?
    var autoRotateDirection: [Float]?

    var body: some View {
        let _ = print("RichTextNode: \(type)")
        if let text = self.text, !self.text!.isEmpty {
            switch type {
            case .text:
                applyModifiers(text: Text(text)).fixedSize(horizontal: false, vertical: true)
            default:
                EmptyView()
            }
        }
        if let children = self.children {
            switch type {
            case .list:
                if format == "unordered" {
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(children, id: \.self) { child in
                            HStack {
                                Text("•")
                                child
                            }
                        }
                    }
                } else {
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(Array(children.enumerated()), id: \.offset) { index, child in
                            HStack {
                                Text("\(index + 1).")
                                child
                            }
                        }
                    }
                }
            case .link:
                if let url = url {
                    // images
                    if url.contains(".jpg")
                        || url.contains(".png")
                        || text?.contains("[embedded-image]") == true
                        || children.first?.text?.contains("[embedded-image]") == true
                    {
                        CenteredContainer {
                            AnyView(ImageTemplateView(imageSource: url, contentMode: .fit).frame(width: 420, height: 300, alignment: .center))
                        }.frame(width: 800, height: 300, alignment: .center)
                    }
                    // video
                    else if url.contains(".mp4")
                        || url.contains(".m4v")
                        || text?.contains("[embedded-video]") == true
                        || children.first?.text?.contains("[embedded-video]") == true
                    {
                        VideoTemplateView(videoSource: url).frame(height: 300)
                    }
                    // 3D models
                    else if text?.contains("[embedded-model]") == true
                        || children.first?.text?.contains("[embedded-model]") == true
                    {
                        let fileExtension = url.contains(".usda") == true || children.first?.url?.contains(".usda") == true ? "usda" : "usdz"
                        // if text or child text contain [local], remove https:// or http:// from url
                        if text?.contains("[local]") == true || children.first?.text?.contains("[local]") == true {
                            let url = url.replacingOccurrences(of: "https://", with: "").replacingOccurrences(of: "http://", with: "")
                            let urlWithoutExtension = url.replacingOccurrences(of: ".\(fileExtension)", with: "")
                            ThreeDTemplateView(source: urlWithoutExtension, fileExtension: fileExtension, allowXRotation: true, allowYRotation: true, autoRotate: false, autoRotateDirection: [0, 0, 0]).frame(height: 500)
                        } else {
                            ThreeDTemplateView(source: url, fileExtension: fileExtension, allowXRotation: true, allowYRotation: true, autoRotate: false, autoRotateDirection: [0, 0, 0]).frame(height: 500)
                        }
                    }
                    // link
                    else if let destinationURL = URL(string: url) {
                        Link(url, destination: destinationURL)
                    }
                } else {
                    EmptyView().onAppear {
                        print("Link appeared without url")
                    }
                }
            case .paragraph:
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(children, id: \.self) { child in
                        child
                    }
                }.onAppear {
                    print("Paragraph appeared")
                }
            default:
                EmptyView().onAppear {
                    print("Unknown type: \(type)")
                }
            }
        }
    }

    @ViewBuilder
    private func applyModifiers(text: Text) -> some View {
        if bold {
            text.bold()
        } else if italic {
            text.italic()
        } else if underline {
            text.underline()
        } else if strikethrough {
            text.strikethrough()
        } else if code {
            text.font(.system(.body, design: .monospaced))
        } else {
            text
        }
    }

    private enum CodingKeys: String, CodingKey {
        case type, url, text, children, bold, italic, underline, strikethrough, code, format
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(RichTextType.self, forKey: .type)
        url = try container.decodeIfPresent(String.self, forKey: .url)
        text = try container.decodeIfPresent(String.self, forKey: .text)
        children = try container.decodeIfPresent([RichTextNode].self, forKey: .children)
        bold = try container.decodeIfPresent(Bool.self, forKey: .bold) ?? false
        italic = try container.decodeIfPresent(Bool.self, forKey: .italic) ?? false
        underline = try container.decodeIfPresent(Bool.self, forKey: .underline) ?? false
        strikethrough = try container.decodeIfPresent(Bool.self, forKey: .strikethrough) ?? false
        code = try container.decodeIfPresent(Bool.self, forKey: .code) ?? false
        format = try container.decodeIfPresent(String.self, forKey: .format)
    }

    init(type: RichTextType, url: String? = nil, text: String? = nil, bold: Bool = false, italic: Bool = false, underline: Bool = false, strikethrough: Bool = false, code: Bool = false, format: String? = nil, children: [RichTextNode]? = nil) {
        self.type = type
        self.url = url
        self.text = text
        self.children = children
        self.bold = bold
        self.italic = italic
        self.underline = underline
        self.strikethrough = strikethrough
        self.code = code
        self.format = format
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(url, forKey: .url)
        try container.encodeIfPresent(text, forKey: .text)
        try container.encode(bold, forKey: .bold)
        try container.encode(italic, forKey: .italic)
        try container.encode(underline, forKey: .underline)
        try container.encode(strikethrough, forKey: .strikethrough)
        try container.encode(code, forKey: .code)
        try container.encodeIfPresent(format, forKey: .format)
        try container.encodeIfPresent(children, forKey: .children)
    }
}

struct CenteredContainer: View {
    var content: () -> AnyView

    var body: some View {
        GeometryReader { geometry in
            VStack {
                self.content()
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

#Preview {
    RichText(richTextNodes: [
        RichTextNode(type: .link, url: "https://Immersive.usda", children: [
            RichTextNode(type: .text, text: "[embedded-model][local]"),
        ]),
        RichTextNode(type: .link, url: "https://jumpshare.com/embed/rVtNbopZsisDcgr1Lsg6", children: [
            RichTextNode(type: .text, text: "[embedded-video]"),
        ]),
//        RichTextNode(type: .paragraph, children: [
//            RichTextNode(type: .text, text: "Hello World1"),
//            RichTextNode(type: .text, text: "Hello World2"),
//            RichTextNode(type: .text, text: "Hello World3"),
//            RichTextNode(type: .text, text: "Hello World4"),
//            RichTextNode(type: .text, text: "Hello World5"),
//            RichTextNode(type: .text, text: "Hello World6"),
//        ]),
//        RichTextNode(type: .text, text: "------------------------------"),
//        RichTextNode(type: .list, format: "unordered", children: [
//            RichTextNode(type: .text, text: "Step 1"),
//            RichTextNode(type: .text, text: "Step 2"),
//        ]),
//        RichTextNode(type: .list, format: "ordered", children: [
//            RichTextNode(type: .text, text: "Step 1"),
//            RichTextNode(type: .text, text: "Step 2"),
//        ]),
//        RichTextNode(type: .link, url: "https://www.google.com", children: [
//            RichTextNode(type: .text, text: "Link to google.com"),
//        ]),
//        RichTextNode(type: .link, url: "https://embed-ssl.wistia.com/deliveries/cc8402e8c16cc8f36d3f63bd29eb82f99f4b5f88/accudvh5jy.mp4", children: [
//            RichTextNode(type: .text, text: "MyVideo"),
//        ]),
//        RichTextNode(type: .link, url: "https://ichef.bbci.co.uk/news/2048/cpsprodpb/F03E/production/_110520516_meantemps4-nc.png", children: [
//            RichTextNode(type: .text, text: "Rising Temperatures"),
//        ]),
    ])
}
