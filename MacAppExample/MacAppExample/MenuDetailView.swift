//
//  MenuDetailView.swift
//  MacAppExample
//
//  Created by Nitin Bhatt on 10/3/20.
//  Copyright © 2020 Test. All rights reserved.
//

import SwiftUI

extension String {
    func toUpperCase() -> String {
        return localized.uppercased(with: .current)
    }
    private var localized : String {
        return NSLocalizedString( self, comment:"")
    }
}

struct MenuDetailView: View {
    var passedData : ContactDetails
    @State var showCaptureImageView: Bool = false
    @State var image: Image? = nil

    
    var body: some View {
        GeometryReader { proxy in
           
            
        Form{
            Section(header:Text("PERSONAL DETAILS").foregroundColor(Color.white).font(.system(size: 20))){
                HStack{
                    VStack{
                        Image(self.passedData.images).resizable().aspectRatio(contentMode: .fill).frame(width: 150, height: 150, alignment: .center)//.clipShape(Circle())
                        Button(action: {
                            self.showCaptureImageView.toggle()

                        }) {
                        Text("Upload Image").foregroundColor(Color.white).font(.system(size: 20,weight: .bold))
                        }.frame(width: 150, height: 40).background(Color.black)
                    }
                    
                    VStack(alignment: .leading){
                        HStack{
                            Text("NAME : ").font(.system(size: 20,weight: .bold))
                            Text(self.passedData.name.toUpperCase()).font(.system(size: 18))
                        }.padding()
                        
                        HStack{
                                  Text("DATE OF BIRTH : ").font(.system(size: 20,weight: .bold))
                                  Text(self.passedData.dob).font(.system(size: 20))
                        }.padding()
                       
                        HStack{
                            Text("PHONE NUMBER : ").font(.system(size: 20,weight: .bold))
                            Text(self.passedData.number).font(.system(size: 20))
                        }.padding()
                    }
                }.frame(width:proxy.size.width - 100).padding()//.background(Color.red)
            }
            
            Section(header:Text("JOB TITLE").foregroundColor(Color.white).font(.system(size: 20))){
                Text(self.passedData.job).font(.system(size: 20)).padding(5)
            }
            
           Section(header:Text("ADDRESS").foregroundColor(Color.white).font(.system(size: 20))){
                Text(self.passedData.address).font(.system(size: 20)).padding(5)
           }
            
           Section(header:Text("NOTES").foregroundColor(Color.white).font(.system(size: 20))){
            VStack(alignment: .leading){
               Text(self.passedData.notes).font(.system(size: 20)).padding(5)
                Spacer()
            }.frame(height: 150)
           }
        }
    }
        
     
    }
}

//struct MenuDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuDetailView(passedData: "")
//    }
//}
