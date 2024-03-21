import SwiftUI

struct Video: Identifiable {
    var title: String
    var description: String
    var id: String
    var url: URL
}



struct ContentView: View {
    @State private var videos: [Video] = []
    @State private var searchText = ""
    //  let apiKey: String
    
    var body: some View {
        
        
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                    .padding()
                
                ScrollView {
                    LazyVStack(spacing: 20) {
                        ForEach(1..<10) { index in
                            NavigationLink(destination: Text("Video \(index) Detail View")) {
                                VideoItemView()
                                    .padding(.horizontal)
                            }
                        }
                    }
                    .padding(.top, 10)
                }
            }
            .navigationTitle("YouTube")
        }
    }
    
    private func fetchVideos() {
        
    }
    
    
    
    
    struct SearchBar: View {
        @Binding var text: String
        
        var body: some View {
            HStack {
                TextField("Search", text: $text)
                    .padding(8)
                    .background(Color(.systemGray5))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                Button(action: {
                    // Perform search action here
                }) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                }
                .padding(.trailing, 8)
            }
        }
    }
    
    struct VideoItemView: View {
        var body: some View {
            VStack(alignment: .leading, spacing: 10) {
                Image(systemName: "play.rectangle.fill") // Placeholder image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200) // Adjust size as needed
                    .cornerRadius(8)
                
                Text("Video Title")
                    .font(.headline)
                
                Text("Channel Name • 1M views • 1 day ago")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.vertical)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(12)
            .shadow(radius: 5)
        }
    }
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
