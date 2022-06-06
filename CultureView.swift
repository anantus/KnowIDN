//
//  CultureView.swift
//  KnowIDN
//
//  Created by Maheswara Ananta Argono on 20/04/22.
//

import SwiftUI

struct CultureView: View {
    @State var filterSearch : String
    @State var searchOn : String
    var cultures = loadCSV(from: "Indonesian_Culture")
    @State var searchText : String = ""
    @Environment(\.presentationMode) var presentationMode
    
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
                    
                
                List(cultureSearch) { culture in
                        VStack(alignment: .leading) {
                            HStack {
                                Text("\(culture.entity)")
                                    .fontWeight(.bold)
                                .font(.title2)
                                Spacer()
                                Text("\(culture.kategori)")
                                    .fontWeight(.semibold)
                                    .font(.body)
                                    .foregroundColor(Color.primary)
                                    .padding(.bottom,1)
                            }
                            HStack{
                                if culture.kabupaten != "None"{
                                    Text("\(culture.kabupaten),")
                                        .foregroundColor(Color.secondary)
                                }
                                Text("\(culture.provinsi)")
                                    .foregroundColor(Color.secondary)
                            }
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
                .navigationTitle(barTitle)
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
    
    var cultureSearch: [Culture] {
        var tempCultures = cultures
        if searchOn == "Provinces"{
            tempCultures =  cultures.filter {
                $0.provinsi.lowercased().contains(filterSearch.lowercased())
            }
        }
        
        else if searchOn == "Categories"{
            tempCultures =  cultures.filter {
                $0.kategori.lowercased().contains(filterSearch.lowercased())
            }
        }
        
        return searchText == "" ? tempCultures : tempCultures.filter {
            $0.entity.lowercased().contains(searchText.lowercased())
        }
    }
    
    var barTitle: String {
        if filterSearch == ""{
            return "All Cultural Entity"
        }
        else{
            return filterSearch
        }
    }
}

struct CultureView_Previews: PreviewProvider {
    static var previews: some View {
        CultureView(filterSearch: "", searchOn: "")
    }
}
