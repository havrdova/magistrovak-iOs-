import Foundation
import SwiftUI

// MARK: - Tabs View
/// source: https://johncodeos.com/how-to-create-tabs-with-swiftui/

public struct ReversedTabsView: View {
    var fixed = true
    var tabs: [String]
    var geoWidth: CGFloat
    @Binding var selectedTab: Int

    public init(
        fixed: Bool = true,
        tabs: [String],
        geoWidth: CGFloat,
        selectedTab: Binding<Int>
    ) {
        self.fixed = fixed
        self.tabs = tabs
        self.geoWidth = geoWidth
        self._selectedTab = selectedTab
    }

    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { proxy in
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        ForEach(0 ..< tabs.count, id: \.self) { row in
                            Button(action: {
                                withAnimation {
                                    selectedTab = row
                                }
                            }, label: {
                                VStack(spacing: 0) {
                                    HStack {
                                        // Text
                                        Text(tabs[row])
                                            .font(Font.system(size: 18, weight: .semibold))
                                            .foregroundColor(Color.black)
                                            .padding(EdgeInsets(top: 10, leading: 3, bottom: 10, trailing: 15))
                                    }
                                    .frame(width: fixed ? (geoWidth / CGFloat(tabs.count)) : .none, height: 52)
//                                    // Bar Indicator
                                    Rectangle().fill(selectedTab == row ? Color.gray : Color.clear)
                                        .frame(height: 2)
                                }.fixedSize()
                            })
                                .accentColor(Color.white)
                                .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .onChange(of: selectedTab) { target in
                        withAnimation {
                            proxy.scrollTo(target)
                        }
                    }
                }
            }
        }
        .frame(height: 55)
        .onAppear(perform: {
//            UIScrollView.appearance().backgroundColor = UIColor(#colorLiteral(red: 0.6196078431, green: 0.1098039216, blue: 0.2509803922, alpha: 1))
            UIScrollView.appearance().bounces = fixed ? false : true
        })
        .onDisappear(perform: {
            UIScrollView.appearance().bounces = true
        })
    }
}

// MARK: - Reversed Tabs Preview

struct ReversedTabs_Previews: PreviewProvider {
    static var previews: some View {
        ReversedTabsView(
            fixed: true,
            tabs: ["Tab 1", "Tab 2", "Tab 3"],
            geoWidth: 375,
            selectedTab: .constant(0)
        )
    }
}
