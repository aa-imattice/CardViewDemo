//
//  CardView.swift
//  CardDemo
//
//  Created by Ike Mattice on 5/19/23.
//

import SwiftUI

struct CardView<Content: View>: View {
    let title: String?
    let systemImageName: String?
    let accessibiltyLabel: String?
    let contentAlignment: HorizontalAlignment
    let isDarkMode: Bool
    let cornerRadius: CGFloat = 10
    
    let content: ()-> Content
    
    var backgroundColor: Color {
        isDarkMode ? Color("Background/Dark"): Color("Background/Light")
    }
    
    var body: some View {
        VStack(alignment: contentAlignment) {
            cardTitle
            content()
        }
        .padding()
        .background(backgroundColor)
        .cornerRadius(cornerRadius)
    }
    
    @ViewBuilder
    var cardTitle: some View {
        if let title, let systemImageName {
            Label {
                Text(title)
                    .foregroundColor(isDarkMode ? Color("Text/Dark"): Color("Text/Light"))
                    .font(.system(size: 13, weight: .semibold))
                    .accessibilityIdentifier(accessibiltyLabel ?? "")
            } icon: {
                Image(systemName: systemImageName)
                    .foregroundColor(isDarkMode ? Color("Text/Dark"): Color("Text/Light"))
                    .font(.system(size: 13, weight: .semibold))
            }
            .frame(maxHeight: 16)
        }
    }
    
    init(
        title: String,
        systemImageName: String,
        accessibiltyLabel: String? = nil,
        isDarkMode: Bool,
        contentAlignment: HorizontalAlignment = .leading,
        content: @escaping () -> Content
    ) {
        self.title = title
        self.systemImageName = systemImageName
        self.accessibiltyLabel = accessibiltyLabel
        self.isDarkMode = isDarkMode
        self.contentAlignment = contentAlignment
        self.content = content
    }
    
    init(
        isDarkMode: Bool,
        contentAlignment: HorizontalAlignment = .leading,
        content: @escaping () -> Content
    ) {
        self.title = nil
        self.systemImageName = nil
        self.accessibiltyLabel = nil
        self.isDarkMode = isDarkMode
        self.contentAlignment = contentAlignment
        self.content = content
    }

}

// MARK: - Previews
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(
            title: "DEPARTURE",
            systemImageName: "airplane.departure",
            accessibiltyLabel: nil,
            isDarkMode: false) {
                AirportDataCard(isDarkMode: false)
            }
            .previewDisplayName("With Title")
            .previewLayout(.sizeThatFits)
        
        CardView(isDarkMode: false) {
            Text("Hello World")
        }
        .previewDisplayName("Without Title")
        .previewLayout(.sizeThatFits)
    }
}
