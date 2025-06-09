//
//  ContentView.swift
//  try
//
//  Created by Gokulkrishna Raju on 09/06/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                // Top Navigation Bar
                TopNavigationBar()
                
                // Main Content with proper scrolling
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 1) {
                        // Story Tray
                        StoryTrayView()
                        
                        // Posts with 1px spacing
                        PostsView()
                    }
                }
                .frame(height: geometry.size.height - 47 - 40 - 56) // Full height minus status bar, top nav, bottom nav
                
                // Bottom Navigation Bar
                BottomNavigationBar()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .ignoresSafeArea(.all, edges: .top)
        }
    }
}

#Preview {
    ContentView()
}
