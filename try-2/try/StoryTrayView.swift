import SwiftUI

struct StoryTrayView: View {
    let stories = [
        StoryUser(username: "Your Story", imageName: "user-avatar", isYourStory: true),
        StoryUser(username: "mango_sickles", imageName: "story-1", isYourStory: false),
        StoryUser(username: "crunchycatluna", imageName: "story-2", isYourStory: false),
        StoryUser(username: "namhee_psd", imageName: "story-3", isYourStory: false),
        StoryUser(username: "timmythechonk", imageName: "story-4", isYourStory: false),
        StoryUser(username: "the_khaleesicat", imageName: "story-5", isYourStory: false),
        StoryUser(username: "joseph_of_water", imageName: "story-6", isYourStory: false),
        StoryUser(username: "unico_uniuni", imageName: "story-7", isYourStory: false),
        StoryUser(username: "guangdang005", imageName: "story-8", isYourStory: false),
        StoryUser(username: "steve.loves", imageName: "story-9", isYourStory: false)
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(stories, id: \.username) { story in
                    StoryAvatarView(story: story)
                }
            }
            .padding(.horizontal, 8)
            .padding(.top, 8)
            .padding(.bottom, 0)
        }
        .background(Color.white)
        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 2)
    }
}

struct StoryUser {
    let username: String
    let imageName: String
    let isYourStory: Bool
}

struct StoryAvatarView: View {
    let story: StoryUser
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                // Story Ring (Gradient) - 72x72 for non-your-story
                if !story.isYourStory {
                    Circle()
                        .stroke(
                            LinearGradient(
                                colors: [Color(hex: "C913B9"), Color(hex: "F9373F"), Color(hex: "FECD00")],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 2.5
                        )
                        .frame(width: 72, height: 72)
                }
                
                // Avatar Container - positioned properly
                Circle()
                    .fill(Color.white)
                    .frame(width: story.isYourStory ? 66 : 66.63, height: story.isYourStory ? 66 : 66.63)
                    .overlay(
                        Circle()
                            .stroke(Color(hex: "DDDDDD"), lineWidth: story.isYourStory ? 1 : 0.5)
                    )
                
                // Avatar Image - proper sizing
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: story.isYourStory ? 62 : 60, height: story.isYourStory ? 62 : 60)
                    .overlay(
                        Image(systemName: "person.fill")
                            .foregroundColor(.gray)
                            .font(.system(size: story.isYourStory ? 26 : 24))
                    )
                
                // Add Button for Your Story - positioned at bottom right
                if story.isYourStory {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            ZStack {
                                Circle()
                                    .fill(Color(hex: "1FA1FF"))
                                    .frame(width: 20, height: 20)
                                
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                                    .font(.system(size: 10, weight: .bold))
                            }
                        }
                    }
                    .frame(width: 72, height: 72)
                }
            }
            .frame(width: 72, height: 72)
            
            // Username - proper width constraints
            Text(story.username)
                .font(.system(size: 11.5, weight: .regular))
                .foregroundColor(story.isYourStory ? Color(hex: "6E6E6E") : .black)
                .frame(width: story.isYourStory ? 59.64 : 66, height: 25.75)
                .multilineTextAlignment(.center)
                .lineLimit(2)
        }
        .frame(width: story.isYourStory ? 72 : 66, height: 90)
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

#Preview {
    StoryTrayView()
} 