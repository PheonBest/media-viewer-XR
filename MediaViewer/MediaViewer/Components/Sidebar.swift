import SwiftUI

struct Sidebar: View {
    @State var width = CGFloat(110)
    @State var height = CGFloat(110)

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(AREAS.allCases) { area in
                        SidebarItem(area: area, width: width, height: height).listRowInsets(EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2))
                    }
                }
                .frame(minWidth: width, maxWidth: width)
                .listStyle(.plain)
                .background(Color(.black).opacity(0.2))
            }
        }.frame(maxWidth: width, maxHeight: .infinity)
    }
}

struct SidebarItem: View {
    @EnvironmentObject var areaState: AreaState

    let area: AREAS
    let width: CGFloat
    let height: CGFloat

    var body: some View {
        Button(action: {
            areaState.switchArea(area)
        }, label: {
            VStack {
                Image(systemName: area.iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .foregroundColor(.accentColor)

                Text(area.rawValue)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 12, weight: .semibold, design: .default))
                    .textCase(.uppercase)
            }.frame(minWidth: width * 0.7, maxWidth: width * 0.7, minHeight: height * 0.7, maxHeight: height * 0.7)
        }).frame(minWidth: width * 0.8, maxWidth: width * 0.8, minHeight: height * 0.8, maxHeight: height * 0.8)
            .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    Sidebar().environmentObject(AreaState()).environmentObject(MediaState())
}
