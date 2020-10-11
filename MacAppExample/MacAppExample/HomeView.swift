//
//  HomeView.swift
//  MacAppExample
//
//  Created by Nitin Bhatt on 10/2/20.
//  Copyright © 2020 Test. All rights reserved.
//

import SwiftUI

struct ContactDetails: Identifiable {
    let id = UUID()
    let name:String
    let number: String
    let images: String
    let address: String
    let job: String
    let dob:String
    let notes:String
}

struct HomeView: View {
    @State var selection:Int = 0
    
    var items = [ContactDetails(name: "Nitin", number: "123456799", images: "user", address: "California, USA",job: "Software Developer",dob:"1, Jan 1980",notes: "I have a appointement with him on 25 Oct."), ContactDetails(name: "Vivek", number: "123456786", images: "user", address: "Montreal, Canada",job: "Sales Manager",dob:"2, Feb 1989",notes: "Tomorrow we have a meeting."),ContactDetails(name: "Vincen", number: "123456783", images: "user", address: "Sydney, Australia",job: "Designer",dob:"7, Feb 1999",notes: "Need to update him about our new project."),ContactDetails(name: "Anne", number: "123456785", images: "user", address: "London, England",job: "Painter",dob:"17, June 2000",notes: "Need to send her a invoice."),ContactDetails(name: "Rudra", number: "123456784", images: "user", address: "Delhi, India",job: "Yoga Teacher",dob:"27, Sep 1995",notes: "I have a appointement with him on 2 November.")]
        
    init() {
           UITableView.appearance().backgroundColor = .black
           UITableViewCell.appearance().selectionStyle = .none
       }
    
    var body: some View {
                      NavigationView {
                        List{
                            Section(header: Text("CONTACT").foregroundColor(Color.red).font(.system(size: 20))) {
                             ForEach(self.items, id: \.id) { result in
                                NavigationLink(destination:MenuDetailView(passedData: result)){
                                      HStack {
                                        Text("\(result.name)").foregroundColor(Color.white).font(.system(size: 18,weight: .bold))
                                    }}
                                }
                            }
                            .listRowBackground(Color.black)
                        }.listStyle(GroupedListStyle())
                        .navigationBarTitle("", displayMode: .inline)
                      }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


