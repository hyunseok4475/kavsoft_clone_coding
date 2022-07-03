//
//  ContentView.swift
//  kav-SearchBar
//
//  Created by 송현석 on 2022/07/01.
//

import SwiftUI

struct ContentView: View {
    
    @State var datas = ["Hello", "Hi", "Welcome", "World", "swift"]
    @State var txt = ""
    var body: some View {
        VStack {
            searchView(txt: $txt)
            
            List(datas.filter{ txt == "" ? true : $0.localizedCaseInsensitiveContains(txt)}, id: \.self ) { i in
                
                Text(i).fontWeight(.heavy)
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//UIViewRepresentable 는 UIView 를 swiftUI에서 사용할 수 있게 해준다.
struct searchView: UIViewRepresentable {
    
    @Binding var txt: String
    
    func makeCoordinator() -> Coordinator {
        return searchView.Coordinator(parent1: self)
    }
    
    
    func makeUIView(context: UIViewRepresentableContext<searchView>) -> UISearchBar {
        
        let searchBar = UISearchBar()
        searchBar.barStyle = .default
        searchBar.autocapitalizationType = .none
        searchBar.delegate = context.coordinator
        return searchBar
        
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<searchView>) {
        
    }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        
        var parent: searchView!
        
        init(parent1: searchView) {
            parent = parent1
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            
            parent.txt = searchText
            
        }/Volumes/QXD3000_Pro/Parking_Shock/PAK_2022_04_02_16_39_06_F.MP4
        
    }
    
    
}
