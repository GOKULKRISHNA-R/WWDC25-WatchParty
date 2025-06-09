import SwiftUI

struct TopNavigationBar: View {
    var body: some View {
        HStack(spacing: 114) {
            // Instagram Logo
            HStack(spacing: 8) {
                Text("Instagram")
                    .font(.custom("Billabong", size: 28))
                    .foregroundColor(.black)
                    .fontWeight(.regular)
            }
            
            // Expand Stories Button
            HStack(spacing: 4) {
                Text("Expand Stories")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.black)
                
                // Stories Scroll Icon (4 circles in 2x2 grid)
                VStack(spacing: 2) {
                    HStack(spacing: 2) {
                        Circle()
                            .stroke(Color.black, lineWidth: 2.25)
                            .frame(width: 9.33, height: 9.33)
                        Circle()
                            .stroke(Color.black, lineWidth: 2.25)
                            .frame(width: 9.33, height: 9.33)
                    }
                    HStack(spacing: 2) {
                        Circle()
                            .stroke(Color.black, lineWidth: 2.25)
                            .frame(width: 9.33, height: 9.33)
                        Circle()
                            .stroke(Color.black, lineWidth: 2.25)
                            .frame(width: 9.33, height: 9.33)
                    }
                }
                .frame(width: 30, height: 30)
            }
        }
        .padding(.horizontal, 13)
        .padding(.vertical, 5)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
    }
}

#Preview {
    TopNavigationBar()
} 