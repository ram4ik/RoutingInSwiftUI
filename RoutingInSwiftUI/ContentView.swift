//
//  ContentView.swift
//  RoutingInSwiftUI
//
//  Created by Ramill Ibragimov on 11.10.2020.
//

import SwiftUI

enum Route {
    case detail(String)
    case aboutUs
}

struct Navigator {
    static func navigate<T: View>(_ route: Route, content: () -> T) -> AnyView {
        
        switch route {
        case .detail(let animal):
            return AnyView(NavigationLink(
                destination: DetailsView(animal: animal)) {
                content()
            })
            
            
        case .aboutUs:
            return AnyView(NavigationLink(
                destination: AboutUsView()) {
                content()
            })
        }
    }
}

struct ContentView: View {
    let animals = ["Cat", "Mouse", "Dog"]
    
    var body: some View {
        NavigationView {
            VStack {
                List(animals, id: \.self) { animal in
                    Navigator.navigate(.detail(animal)) {
                        Text(animal)
                    }
                }.listStyle(PlainListStyle())
                
                Button(action: {
                    
                }, label: {
                    Navigator.navigate(.aboutUs) {
                        Text("Go to About View")
                    }
                })
            }
        }
    }
}

struct DetailsView: View {
    let animal: String
    
    var body: some View {
        Text(animal)
            .font(.largeTitle)
    }
}

struct AboutUsView: View {
    var body: some View {
        Text("About")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
