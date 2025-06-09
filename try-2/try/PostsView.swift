import SwiftUI

struct PostsView: View {
    let posts = [
        InstagramPost(
            id: 1,
            username: "monkeycatluna",
            userAvatar: "user-1",
            postImage: "post-1",
            likes: 100,
            caption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt...",
            timeAgo: "30 minutes ago",
            isCarousel: true,
            commentPreview: "username Amazing content!",
            totalComments: 16
        ),
        InstagramPost(
            id: 2,
            username: "monkeycatluna",
            userAvatar: "user-1",
            postImage: "post-2",
            likes: 100,
            caption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt...",
            timeAgo: "30 minutes ago",
            isCarousel: false,
            commentPreview: "username Amazing content!",
            totalComments: 16
        )
    ]
    
    var body: some View {
        LazyVStack(spacing: 1) {
            ForEach(posts) { post in
                PostView(post: post)
            }
        }
    }
}

struct InstagramPost: Identifiable {
    let id: Int
    let username: String
    let userAvatar: String
    let postImage: String
    let likes: Int
    let caption: String
    let timeAgo: String
    let isCarousel: Bool
    let commentPreview: String
    let totalComments: Int
}

struct PostView: View {
    let post: InstagramPost
    @State private var isLiked = false
    @State private var isBookmarked = false
    
    var body: some View {
        VStack(spacing: 0) {
            // User Header
            PostHeaderView(username: post.username, userAvatar: post.userAvatar)
            
            // Post Image
            PostImageView(imageName: post.postImage, isCarousel: post.isCarousel)
            
            // Post Actions and Info
            PostInfoView(
                post: post,
                isLiked: $isLiked,
                isBookmarked: $isBookmarked
            )
        }
        .background(Color.white)
    }
}

struct PostHeaderView: View {
    let username: String
    let userAvatar: String
    
    var body: some View {
        HStack(spacing: 8) {
            // Avatar with story ring - 36x36 total
            ZStack {
                Circle()
                    .stroke(
                        LinearGradient(
                            colors: [Color(hex: "C913B9"), Color(hex: "F9373F"), Color(hex: "FECD00")],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 1.5
                    )
                    .frame(width: 36, height: 36)
                
                Circle()
                    .fill(Color.white)
                    .frame(width: 32, height: 32)
                    .overlay(
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 30, height: 30)
                            .overlay(
                                Image(systemName: "person.fill")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12))
                            )
                    )
            }
            
            // Username
            Text(username)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.black)
            
            Spacer()
            
            // More Button - positioned at right edge
            Button(action: {}) {
                VStack(spacing: 2) {
                    Circle()
                        .fill(Color.black)
                        .frame(width: 3, height: 3)
                    Circle()
                        .fill(Color.black)
                        .frame(width: 3, height: 3)
                    Circle()
                        .fill(Color.black)
                        .frame(width: 3, height: 3)
                }
                .frame(width: 24, height: 24)
            }
        }
        .padding(.horizontal, 13)
        .padding(.vertical, 7)
        .frame(height: 50)
    }
}

struct PostImageView: View {
    let imageName: String
    let isCarousel: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(height: 390) // Full width post image
                .overlay(
                    Image(systemName: "photo")
                        .foregroundColor(.gray)
                        .font(.system(size: 50))
                )
            
            // Carousel indicators - positioned at bottom with proper spacing
            if isCarousel {
                VStack {
                    Spacer()
                    HStack(spacing: 6) {
                        // Active indicator
                        Circle()
                            .fill(Color(hex: "32B5FF"))
                            .frame(width: 8, height: 8)
                        
                        // Inactive indicators
                        Circle()
                            .fill(Color(hex: "C4C4C4"))
                            .frame(width: 8, height: 8)
                        Circle()
                            .fill(Color(hex: "C4C4C4"))
                            .frame(width: 8, height: 8)
                        Circle()
                            .fill(Color(hex: "C4C4C4"))
                            .frame(width: 5, height: 5)
                        Circle()
                            .fill(Color(hex: "C4C4C4"))
                            .frame(width: 3, height: 3)
                    }
                    .padding(.bottom, 17)
                }
            }
        }
    }
}

struct PostInfoView: View {
    let post: InstagramPost
    @Binding var isLiked: Bool
    @Binding var isBookmarked: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            // Action Buttons Row - exact spacing from Figma
            HStack {
                // Left actions with 12px spacing
                HStack(spacing: 12) {
                    Button(action: { isLiked.toggle() }) {
                        Image(systemName: isLiked ? "heart.fill" : "heart")
                            .foregroundColor(isLiked ? .red : .black)
                            .font(.system(size: 24, weight: .regular))
                            .frame(width: 24, height: 24)
                    }
                    
                    Button(action: {}) {
                        Image(systemName: "message")
                            .foregroundColor(.black)
                            .font(.system(size: 24, weight: .regular))
                            .frame(width: 24, height: 24)
                    }
                    
                    Button(action: {}) {
                        Image(systemName: "paperplane")
                            .foregroundColor(.black)
                            .font(.system(size: 24, weight: .regular))
                            .frame(width: 24, height: 24)
                    }
                }
                
                Spacer()
                
                // Bookmark - positioned at right
                Button(action: { isBookmarked.toggle() }) {
                    Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                        .foregroundColor(.black)
                        .font(.system(size: 24, weight: .regular))
                        .frame(width: 24, height: 24)
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .frame(height: 44)
            
            // Post Info Text - exact spacing from Figma
            VStack(alignment: .leading, spacing: 6) {
                // Likes
                Text("\(post.likes) Likes")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // Caption
                Text("\(post.username) \(post.caption) more")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.black)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // Time
                Text(post.timeAgo)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(Color(hex: "6E6E6E"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // Comment Preview Box - with proper styling
                VStack(alignment: .leading, spacing: 10) {
                    Text(post.commentPreview)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(Color.black.opacity(0.6))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("View all \(post.totalComments) comments")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(Color.black.opacity(0.4))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.black.opacity(0.07))
                .cornerRadius(10)
            }
            .padding(.horizontal, 12)
            .padding(.bottom, 24)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    PostsView()
} 