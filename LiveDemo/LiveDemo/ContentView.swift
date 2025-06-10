//
//  ContentView.swift
//  LiveDemo
//
//  Created by Gokulkrishna Raju on 09/06/25.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State private var selectedSize = "14\""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Header Image Section
                ZStack {
                    // Background gradient overlay
                    RoundedRectangle(cornerRadius: 25)
                        .fill(
                            LinearGradient(
                                colors: [Color.orange.opacity(0.8), Color.orange.opacity(0.3)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(height: 333)
                    
                    VStack {
                        // Navigation Header
                        HStack {
                            Button(action: {}) {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 45, height: 45)
                                    .overlay(
                                        Image(systemName: "chevron.left")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .medium))
                                    )
                            }
                            
                            Spacer()
                            
                            Button(action: {}) {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 45, height: 45)
                                    .overlay(
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.orange)
                                            .font(.system(size: 16))
                                    )
                            }
                        }
                        .padding(.horizontal, 24)
                        .padding(.top, 49)
                        
                        Spacer()
                        
                        // Food Image
                        Image("Burger")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 217)
                            .cornerRadius(15)
                    }
                }
                
                // Content Section
                VStack(alignment: .leading, spacing: 0) {
                    // Restaurant Name
                    Text("Burger Bistro")
                        .font(.custom("Sen-Bold", size: 20))
                        .foregroundColor(Color(hex: "181C2E"))
                        .padding(.horizontal, 24)
                        .padding(.top, 24)
                    
                    // Location
                    HStack(spacing: 8) {
                        Circle()
                            .fill(Color.orange)
                            .frame(width: 8, height: 8)
                        
                        Text("Rose Garden")
                            .font(.custom("Sen-Regular", size: 14))
                            .foregroundColor(Color(hex: "181C2E"))
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 7)
                    
                    // Stats Row
                    HStack(spacing: 36) {
                        // Rating
                        HStack(spacing: 8) {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color(hex: "FFBD69"))
                                .font(.system(size: 16))
                            
                            Text("4.7")
                                .font(.custom("Sen-Bold", size: 16))
                                .foregroundColor(Color(hex: "181C2E"))
                        }
                        
                        // Free Shipping
                        HStack(spacing: 8) {
                            Image(systemName: "truck.box")
                                .foregroundColor(.orange)
                                .font(.system(size: 16))
                            
                            Text("Free")
                                .font(.custom("Sen-Regular", size: 14))
                                .foregroundColor(Color(hex: "181C2E"))
                        }
                        
                        // Delivery Time
                        HStack(spacing: 8) {
                            Image(systemName: "clock")
                                .foregroundColor(.orange)
                                .font(.system(size: 16))
                            
                            Text("20 min")
                                .font(.custom("Sen-Regular", size: 14))
                                .foregroundColor(Color(hex: "181C2E"))
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 24)
                    
                    // Description
                    Text("Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.")
                        .font(.custom("Sen-Regular", size: 14))
                        .foregroundColor(Color(hex: "A0A5BA"))
                        .lineSpacing(4)
                        .padding(.horizontal, 24)
                        .padding(.top, 30)
                    
                    // Size Selection
                    VStack(alignment: .leading, spacing: 20) {
                        Text("SIZE:")
                            .font(.custom("Sen-Regular", size: 14))
                            .foregroundColor(Color(hex: "A0A5BA"))
                            .textCase(.uppercase)
                            .padding(.horizontal, 24)
                        
                        HStack(spacing: 10) {
                            SizeButton(size: "10\"", isSelected: selectedSize == "10\"") {
                                selectedSize = "10\""
                            }
                            SizeButton(size: "14\"", isSelected: selectedSize == "14\"") {
                                selectedSize = "14\""
                            }
                            SizeButton(size: "16\"", isSelected: selectedSize == "16\"") {
                                selectedSize = "16\""
                            }
                            Spacer()
                        }
                        .padding(.horizontal, 24)
                    }
                    .padding(.top, 44)
                    
                    // Ingredients Section
                    VStack(alignment: .leading, spacing: 20) {
                        Text("INGREDIENTS")
                            .font(.custom("Sen-Regular", size: 13))
                            .foregroundColor(Color(hex: "32343E"))
                        
                        // Ingredients Grid
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 19), count: 4), spacing: 27) {
                            IngredientItem(name: "Salt", imageName: "Salt")
                            IngredientItem(name: "Chicken", imageName: "Chicken")
                            IngredientItem(name: "onion\n(Alergy)", imageName: "Onion", isSmallText: true)
                            IngredientItem(name: "Garlic", imageName: "Garlic")
                            IngredientItem(name: "Pappers\n(Alergy)", imageName: "Chili pepper", isSmallText: true)
                            IngredientItem(name: "Ginger", imageName: "Ginger")
                            IngredientItem(name: "Broccoli", imageName: "broccoli")
                            IngredientItem(name: "Orange", imageName: "Orange")
                            IngredientItem(name: "Walnut", imageName: "walnut")
                        }
                        .padding(.horizontal, 24)
                    }
                    .padding(.top, 60)
                    .padding(.bottom, 40)
                }
                .background(Color.white)
                .cornerRadius(30, corners: [.topLeft, .topRight])
                .offset(y: -30)
            }
        }
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.white)
    }
}

struct SizeButton: View {
    let size: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .fill(isSelected ? Color(hex: "F0F5FA") : Color.orange)
                    .frame(width: 48, height: 48)
                
                Text(size)
                    .font(.custom(isSelected ? "Sen-Regular" : "Sen-Bold", size: 16))
                    .foregroundColor(isSelected ? Color(hex: "121223") : .white)
                    .textCase(.none)
            }
        }
    }
}

struct IngredientItem: View {
    let name: String
    let imageName: String
    var isSmallText: Bool = false
    
    var body: some View {
        VStack(spacing: 5) {
            ZStack {
                Circle()
                    .fill(Color(hex: "FFEBE4"))
                    .frame(width: 50, height: 50)
                
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .foregroundColor(.orange)
            }
            
            Text(name)
                .font(.custom("Sen-Medium", size: isSmallText ? 11 : 12))
                .foregroundColor(Color(hex: "747783"))
                .multilineTextAlignment(.center)
                .textCase(.none)
                .lineLimit(2)
                .frame(width: 50)
        }
    }
}

// Color extension for hex colors
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// RoundedCorner extension
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

#Preview {
    ContentView()
}
