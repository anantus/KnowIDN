//
//  SearchGroupView.swift
//  KnowIDN
//
//  Created by Maheswara Ananta Argono on 23/04/22.
//

import SwiftUI

struct SearchGroupView: View {
    var searchOn : String = "Provinces"
    var cultures = loadCSV(from: "Indonesian_Culture")
    @Environment(\.presentationMode) var presentationMode
    
    
    @State var searchText : String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.white.opacity(0.0)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.purple.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                Circle()
                    .foregroundColor(Color.orange.opacity(0.15))
                    .blur(radius: 20)
                    .edgesIgnoringSafeArea(.all)
                
                List(cultureSearch, id: \.self) { culture in
                    NavigationLink(destination: CultureView(filterSearch: culture, searchOn: searchOn)) {
                        Text("\(culture)")
                            .font(.title2)
                    }
                    .listRowBackground(Color.white.opacity(0.35))
                }
                .onAppear(){
                    UITableView.appearance().separatorStyle = .none
                    UITableView.appearance().backgroundColor = UIColor.clear
                    UITableViewCell.appearance().backgroundColor = UIColor.clear
                    UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .white
                    UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = .black
                }
                .searchable(text: $searchText)
                .navigationTitle(searchOn)
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Back"){
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .accentColor(Color.black)
        }
        .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    var createGroup: [String]{
        var groups : Set = Set<String>()
        
        if searchOn == "Provinces"{
            for culture in cultures{
                groups.insert(culture.provinsi)
            }
        }else{
            for culture in cultures {
                groups.insert(culture.kategori)
            }
        }
        
        let sortedGroups = groups.sorted()
        return sortedGroups
    }
    
    var cultureSearch: [String] {
        let tempGroup = createGroup
        
        return searchText == "" ? tempGroup : tempGroup.filter {
            $0.lowercased().contains(searchText.lowercased())
        }
    }
}

struct SearchGroupView_Previews: PreviewProvider {
    static var previews: some View {
        SearchGroupView()
    }
}
