import SwiftUI

struct BottomNavigationBar: View {
    @State private var selectedTab = 0
    
    var body: some View {
        VStack(spacing: 0) {
            // Divider line
            Rectangle()
                .fill(Color.black.opacity(0.1))
                .frame(height: 1)
            
            HStack {
                // Home - positioned at x: 15
                NavigationButton(
                    icon: "house",
                    selectedIcon: "house.fill",
                    isSelected: selectedTab == 0,
                    action: { selectedTab = 0 }
                )
                .frame(width: 24, height: 24)
                
                Spacer()
                
                // Explore - positioned at x: 99 (84px from home)
                NavigationButton(
                    icon: "magnifyingglass",
                    selectedIcon: "magnifyingglass",
                    isSelected: selectedTab == 1,
                    action: { selectedTab = 1 }
                )
                .frame(width: 24, height: 24)
                
                Spacer()
                
                // Add Post - positioned at x: 183 (84px from explore)  
                NavigationButton(
                    icon: "plus.square",
                    selectedIcon: "plus.square",
                    isSelected: selectedTab == 2,
                    action: { selectedTab = 2 }
                )
                .frame(width: 24, height: 24)
                
                Spacer()
                
                // Inbox with notification - positioned at x: 267 (84px from add)
                VStack(spacing: 4) {
                    ZStack {
                        NavigationButton(
                            icon: "heart",
                            selectedIcon: "heart.fill",
                            isSelected: selectedTab == 3,
                            action: { selectedTab = 3 }
                        )
                        .frame(width: 24, height: 24)
                        
                        // Notification dot - positioned top right
                        VStack {
                            HStack {
                                Spacer()
                                Circle()
                                    .fill(Color(hex: "FE0135"))
                                    .frame(width: 4, height: 4)
                            }
                            Spacer()
                        }
                        .frame(width: 24, height: 24)
                    }
                }
                
                Spacer()
                
                // Profile with notification - positioned at x: 351 (84px from inbox)
                VStack(spacing: 4) {
                    ZStack {
                        Button(action: { selectedTab = 4 }) {
                            ZStack {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 24, height: 24)
                                    .overlay(
                                        Circle()
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                                
                                Circle()
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(width: 20, height: 20)
                                    .overlay(
                                        Image(systemName: "person.fill")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 10))
                                    )
                            }
                        }
                        
                        // Notification dot - positioned top right
                        VStack {
                            HStack {
                                Spacer()
                                Circle()
                                    .fill(Color(hex: "FE0135"))
                                    .frame(width: 4, height: 4)
                            }
                            Spacer()
                        }
                        .frame(width: 24, height: 24)
                    }
                }
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 12)
            .frame(height: 56)
            .background(Color.white)
        }
    }
}

struct NavigationButton: View {
    let icon: String
    let selectedIcon: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: isSelected ? selectedIcon : icon)
                .foregroundColor(.black)
                .font(.system(size: 24, weight: isSelected ? .semibold : .regular))
        }
    }
}

#Preview {
    VStack {
        Spacer()
        BottomNavigationBar()
    }
} 