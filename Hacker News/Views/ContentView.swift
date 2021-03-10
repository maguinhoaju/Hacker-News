//
//  ContentView.swift
//  Hacker News
//
//  Created by Carlos Magno de França Veiga on 09/03/21.
//

import SwiftUI

struct ContentView: View {
    
    //Property wrapper do Design Pattern Observable
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                //cria um link de navegação para cada item da lista, adicionando o ">" no canto direito
                NavigationLink(
                    destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationBarTitle("H4ck3r News")
        }
        //no evento onAppear os posts serão carregados
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//Identifiable - protocolo que permite que a List reconheça a ordem dos objetos Post com base na propriedade "id"
//struct Post: Identifiable {
//    let id: String
//    let title: String
//}
//
//let posts = [
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "Olá"),
//    Post(id: "3", title: "Bonjour"),
//    Post(id: "4", title: "Hola")
//]
