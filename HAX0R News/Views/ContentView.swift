//
//  ContentView.swift
//  HAX0R News
//
//  Created by Amged on 4/8/22.
//

import SwiftUI

struct ContentView: View {
    
  @ObservedObject  var networkManager = NetworkManager()
    var body: some View {
        
        NavigationView{
            List(networkManager.posts) { post in
                NavigationLink {
                    DetailView(url: post.url)
                } label: {
                    HStack {
                        Text("\(post.points)")
                        
                        Text(post.title)
                    }
                }
            }
            
            // MARK: - Navigationview title
            .navigationBarTitle("H4X0R News")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}





//let posts = [
//  Post(id: "1", title: "Hello"),
//  Post(id: "2", title: "Bonjour"),
//  Post(id: "3", title: "Hola"),
//]
