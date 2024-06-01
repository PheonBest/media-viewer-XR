import SwiftUI

struct MediaPicker: View {
    @EnvironmentObject var mediaState: MediaState
    @State private var selectedReaderMedium: ReaderMedium?

    @State private var myError: MyError?

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                MediaPickerContent(selectedReaderMedium: $selectedReaderMedium, myError: $myError)
                    .frame(width: geometry.size.width, height: geometry.size.height * (1 - 0.4))
                    .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)

                MediumInfo(readerMedium: $selectedReaderMedium, myError: $myError)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.4)
                    .background(Color.gray.opacity(0.4))
            }.errorAlert($myError)
        }
    }

    struct MediaPickerContent: View {
        @EnvironmentObject var areaState: AreaState
        @EnvironmentObject var mediaState: MediaState
        @Binding var selectedReaderMedium: ReaderMedium?
        @Binding var myError: MyError?
        @State var tags: [Medium.Tag] = []
        @State var languages: [Medium.Language] = []
        @State private var isFetching = false

        var items: [GridItem] = Array(repeating: .init(.adaptive(minimum: 200)), count: 3)
        var body: some View {
            VStack {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        SearchBar(text: $mediaState.searchText, width: 200, height: 40)
                        SelectValue(name: "Language", selectedValue: $mediaState.locale, values: languages.map { $0.value }, labels: languages.map { $0.name }, width: 120, height: 40)
                        SelectValue(name: "Read", selectedValue: $mediaState.readFilter, values: ["All", "Read", "Unread"], width: 120, height: 40, showDefault: true)
                        SelectValue(name: "Archived", selectedValue: $mediaState.archivedFilter, values: ["All", "Archived", "Not Archived"], width: 170, height: 40, showDefault: true)
                        Button(action: {
                            Task {
                                if !isFetching {
                                    isFetching = true
                                    do {
                                        try mediaState.media = await MediumService.fetchMedia(searchText: mediaState.searchText, tags: mediaState.tags, readFilter: mediaState.readFilter, archivedFilter: mediaState.archivedFilter, locale: mediaState.locale)
                                    } catch let error as MyError {
                                        self.myError = MyError(error: error, title: "Error fetching Media")
                                        print(myError!.toString())
                                    }
                                    isFetching = false
                                }
                            }
                        }) {
                            Image(systemName: "arrow.clockwise.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                        }
                        .buttonBorderShape(.roundedRectangle)
                        .buttonStyle(.bordered)
                        .disabled(isFetching)
                        ImmersiveSceneButton()
                    }
                    MultiSelectTags(tags: $tags, selectedTags: $mediaState.tags, width: 200, height: 40).frame(width: nil, height: 40)
                }.padding(EdgeInsets(top: 20, leading: 10, bottom: 0, trailing: 10))
                    .zIndex(1)

                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: items, alignment: .center, spacing: 25) {
                        ForEach(Array(mediaState.media.enumerated()), id: \.offset) { _, medium in
                            MediumTile(Medium: medium, isSelected: medium == mediaState.selectedMedium)
                                .onTapGesture {
                                    if let mediumId = medium.id {
                                        Task {
                                            mediaState.selectedMedium = medium
                                            do {
                                                let response = try await ReaderMediumService.getReaderMedium(readerId: Config.strapiUserId, mediumId: mediumId)
                                                if let response = response {
                                                    selectedReaderMedium = response
                                                }
                                            } catch let error as MyError {
                                                self.myError = MyError(error: error, title: "Error fetching ReaderMedium")
                                                print(myError!.toString())
                                            }
                                        }
                                    }
                                }
                                .onKeyPress(.return) {
                                    Task {
                                        if let mediumId = medium.id, mediaState.selectedMedium?.id != mediumId {
                                            do {
                                                try mediaState.selectedMedium = await MediumService.fetchMedium(id: mediumId)
                                                mediaState.selectedPageIndex = 0
                                                areaState.switchArea(.CONTENT_VIEW)
                                            } catch let error as MyError {
                                                self.myError = MyError(error: error, title: "Error fetching Medium")
                                                print(myError!.toString())
                                            }
                                        }
                                    }
                                    return .handled
                                }
                        }
                    }
                    .padding()
                }
            }.onAppear {
                Task {
                    do {
                        let response = try await Api.get("/api/tags", as: ApiResponseArray<Medium.Tag>.self)
                        if let response = response {
                            self.tags = response.getData()
                        }
                    } catch let error as MyError {
                        self.myError = MyError(error: error, title: "Error fetching Tags")
                        print(myError!.toString())
                    }
                    do {
                        let response = try await Api.get("/api/languages", as: ApiResponseArray<Medium.Language>.self)
                        if let response = response {
                            self.languages = response.getData()
                        }
                    } catch let error as MyError {
                        self.myError = MyError(error: error, title: "Error fetching Languages")
                        print(myError!.toString())
                    }
                }
            }
        }
    }

    struct MediumTile: View {
        var Medium: Medium
        var isSelected: Bool

        var body: some View {
            VStack {
                Image(uiImage: Medium.cover?.getData().getImage() ?? UIImage(named: "404.png")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 150)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.blue, lineWidth: isSelected ? 2 : 0)
                    )

                Text(Medium.title)
                    .multilineTextAlignment(.center)
                    .padding(.top, 4)
            }
            .padding(8)
        }
    }

    struct MediumInfo: View {
        @EnvironmentObject var areaState: AreaState
        @EnvironmentObject var mediaState: MediaState
        @Binding var readerMedium: ReaderMedium?
        @Binding var myError: MyError?

        func getLanguages() -> [String] {
            var languages: [String] = []
            if let medium = mediaState.selectedMedium {
                languages.append(medium.locale)
                if let localizations = medium.localizations {
                    for localization in localizations.getData() {
                        languages.append(localization.locale)
                    }
                }
            }
            return languages
        }

        var body: some View {
            Group {
                if let medium = mediaState.selectedMedium, let readerMedium = readerMedium {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(medium.title)
                                .font(.headline)
                                .fontWeight(.semibold)
                                .lineLimit(nil)

                            if let info = medium.info {
                                Text("Published, \(DateFormatter.localizedString(from: info.getData().releaseDate.date, dateStyle: .medium, timeStyle: .none))").foregroundColor(Color.white.opacity(0.7))
                            } else {
                                Text("Published, -").foregroundColor(Color.white.opacity(0.7))
                            }

                            HStack {
                                Image(systemName: "person.fill")
                                Text("Authors: \(medium.authors?.getData().map { $0.name }.joined(separator: ", ") ?? "")")
                            }

                            HStack {
                                Image(systemName: "tag.fill")
                                if let tags = medium.tags {
                                    ForEach(tags.getData()) { tag in
                                        TagView(tag: tag)
                                    }
                                }
                            }

                            HStack {
                                Image(systemName: "globe")
                                Text("Language: \(getLanguages().joined(separator: ", "))")
                            }

                            Button(action: {
                                Task {
                                    let data = [
                                        "data": [
                                            "read": !(readerMedium.read ?? false)
                                        ]
                                    ]
                                    do {
                                        let jsonData = try JSONSerialization.data(withJSONObject: data, options: [.fragmentsAllowed])
                                        if let readerMediumId = readerMedium.id {
                                            let response = try await Api.put("/api/reader-mediums/\(readerMediumId)", body: jsonData, as: ApiResponse<ReaderMedium>.self)
                                            if let response = response {
                                                self.readerMedium = response.getData()
                                            }
                                        }
                                    } catch let error as MyError {
                                        self.myError = MyError(error: error, title: "Error updating ReaderMedium")
                                        print(myError!.toString())
                                    } catch { print("Error updating read property: \(error)") }
                                }
                            }) {
                                HStack {
                                    Image(systemName: readerMedium.read ?? false ? "checkmark.circle.fill" : "circle")
                                    Text("Read")
                                }
                            }

                            Button(action: {
                                Task {
                                    let data = [
                                        "data": [
                                            "archived": !(readerMedium.archived ?? false)
                                        ]
                                    ]
                                    do {
                                        let jsonData = try JSONSerialization.data(withJSONObject: data, options: [.fragmentsAllowed])
                                        if let readerMediumId = readerMedium.id {
                                            let response = try await Api.put("/api/reader-mediums/\(readerMediumId)", body: jsonData, as: ApiResponse<ReaderMedium>.self)
                                            if let response = response {
                                                self.readerMedium = response.getData()
                                            }
                                        }
                                    } catch let error as MyError {
                                        self.myError = MyError(error: error, title: "Error updating ReaderMedium")
                                        print(myError!.toString())
                                    } catch { print("Error updating archived property: \(error)") }
                                }
                            }) {
                                HStack {
                                    Image(systemName: readerMedium.archived ?? false ? "checkmark.circle.fill" : "circle")
                                    Text("Archived")
                                }
                            }

                            Button(action: {
                                areaState.switchArea(.CONTENT_VIEW)
                                mediaState.selectedPageIndex = 0
                                mediaState.selectedMedium = medium
                            }, label: {
                                Text("Open")
                            })
                        }
                        .padding()
                        ScrollView {
                            VStack {
                                RichText(richTextNodes: medium.description).frame(maxWidth: .infinity, alignment: .leading)
                            }.padding()
                        }
                    }.frame(maxWidth: .infinity, alignment: .leading).padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                }
            }
        }
    }

    struct TagView: View {
        var tag: Medium.Tag

        var body: some View {
            Text(tag.name)
                .font(.caption)
                .padding(6)
                .foregroundColor(.white)
                // .background(Color(tag.color ?? UIColor.gray))
                .cornerRadius(8)
        }
    }

    struct SearchBar: View {
        @Binding var text: String
        @State private var searching = false
        var width: CGFloat
        var height: CGFloat

        var body: some View {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white)
                TextField("", text: $text, onEditingChanged: { edit in
                    self.searching = edit
                })
                .frame(width: width - 100)
                .foregroundColor(.white)
                .overlay(
                    HStack {
                        Text("Search...")
                            .foregroundColor(searching ? .gray : .white)
                            .opacity(text.isEmpty ? 1 : 0)
                        Spacer()
                    }
                )
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
            .frame(width: width, height: height)
            .foregroundColor(.white)
            .cornerRadius(50)
            .background(RoundedRectangle(cornerRadius: 50).stroke(searching ? Color.white : Color.clear, lineWidth: 8).fill(Color.white).opacity(0.2))
        }
    }

    struct SelectValue: View {
        var name: String
        @Binding var selectedValue: String
        var values: [String]
        var labels: [String]?
        var width: CGFloat
        var height: CGFloat
        var showDefault: Bool = false
        var defaultValue: String = "All"

        var body: some View {
            ZStack {
                Menu {
                    ForEach(Array(values.enumerated()), id: \.offset) { index, item in
                        Button {
                            self.selectedValue = item
                        } label: {
                            if let labels = labels {
                                Text(labels[index])
                            } else {
                                Text(item)
                            }
                        }
                    }
                } label: {
                    if let labels = labels, let valueIndex = values.firstIndex(of: selectedValue) {
                        Text(selectedValue == defaultValue ? showDefault ? "\(self.name): \(labels[valueIndex])" : self.name : labels[valueIndex])
                            .frame(width: width, height: height)
                    } else {
                        Text(selectedValue == defaultValue ? showDefault ? "\(self.name): \(selectedValue)" : self.name : selectedValue)
                            .frame(width: width, height: height)
                    }
                }

                selectedValue != defaultValue ? Button {
                    self.selectedValue = defaultValue
                } label : {
                    Image(systemName: "xmark.circle.fill").resizable().frame(width: 22, height: 22).padding(4)
                }
                .buttonStyle(PlainButtonStyle())
                .offset(
                    x: width / 2 - 11
                ).zIndex(1): nil
            }
        }
    }

    struct MultiSelectTags: View {
        @EnvironmentObject var mediaState: MediaState
        @Binding var tags: [Medium.Tag]
        @Binding var selectedTags: [Medium.Tag]
        @State private var isDropdownVisible = false
        var width: CGFloat
        var height: CGFloat

        var body: some View {
            GeometryReader { _ in
                VStack {
                    HStack {
                        HStack {
                            Button(action: {
                                isDropdownVisible.toggle()
                            }) {
                                Text("Select Tags")
                                    .cornerRadius(8)
                                    .frame(width: width, height: height)
                            }
                            Spacer()
                        }.frame(width: width + 70, height: height + 10)
                        HStack {
                            ForEach(Array(selectedTags.enumerated()), id: \.offset) { _, item in
                                Button(action: {
                                    if let index = self.selectedTags.firstIndex(of: item) {
                                        if index < self.selectedTags.count {
                                            self.selectedTags.remove(at: index)
                                            mediaState.tags = selectedTags
                                        }
                                    }
                                }) {
                                    Text(item.name)
                                        .padding()
                                        .cornerRadius(8)
                                    Image(systemName: "xmark.circle.fill").resizable().frame(width: 22, height: 22).padding(4)
                                }
                                .buttonStyle(.bordered)
                                // .tint(Color(item.color ?? UIColor.gray))
                            }
                        }.frame(maxWidth: .infinity, alignment: .leading)
                    }.frame(maxWidth: .infinity, maxHeight: .infinity)

                    if isDropdownVisible {
                        ZStack {
                            Rectangle()
                                .frame(width: 1280, height: 720)
                                .opacity(0.001)
                                .layoutPriority(-1)
                                .onTapGesture {
                                    isDropdownVisible.toggle()
                                }

                            VisualEffectView(effect: UIBlurEffect(style: .light))

                            ScrollView {
                                ForEach(self.tags, id: \.self) { item in
                                    MultipleSelectionRow(
                                        title: item.name,
                                        isSelected: self.selectedTags.contains(item)
                                    ) {
                                        if self.selectedTags.contains(item) {
                                            self.selectedTags.removeAll(where: { $0 == item })
                                        } else {
                                            self.selectedTags.append(item)
                                        }
                                        mediaState.tags = selectedTags
                                    }
                                }.padding(10)
                                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                            }
                        }
                        .cornerRadius(8)
                        .shadow(radius: 5)
                        .offset(x: -1.735 * width, y: 0) // Position the menu below the button
                        .frame(width: width, height: 300)
                    }
                }
            }
        }
    }

    struct VisualEffectView: UIViewRepresentable {
        var effect: UIVisualEffect?
        func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
        func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
    }

    struct MultipleSelectionRow: View {
        var title: String
        var isSelected: Bool
        var action: () -> Void

        var body: some View {
            Button(action: self.action) {
                HStack {
                    Text(self.title)
                    Spacer()
                    if self.isSelected {
                        Image(systemName: "checkmark")
                    }
                }.padding(14)
            }.buttonStyle(PlainButtonStyle()).cornerRadius(3)
        }
    }
}

#Preview(windowStyle: .automatic) {
    MediaPicker().environmentObject(AreaState()).environmentObject(MediaState())
}
