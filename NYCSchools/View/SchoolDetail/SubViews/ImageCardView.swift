

import SwiftUI

struct ImageCardView: View {
    private var location: String
    private var phoneNumber: String
    private var website: String
    private var schoolEmail: String
    private var address: String
    
    init(location: String, phoneNumber: String, website: String, schoolEmail: String, address: String) {
        self.location = location
        self.phoneNumber = phoneNumber
        self.website = website
        self.schoolEmail = schoolEmail
        self.address = address
    }
    var body: some View {
        VStack {
            Image("school").resizable().mask(RoundedCornersMask(corners: [.topRight, .bottomRight], radius: 20))
            VStack(spacing:8){
                LinkView(urlPath: "\(Constants.urlLocation)\(location)", url: address, icon: Constants.iconLocation).multilineTextAlignment(.leading)
                Divider()
                LinkView(urlPath: Constants.urlPhone, url: phoneNumber, icon: Constants.iconPhone)
                Divider()
                LinkView(urlPath: "https://\(website)", url: website , icon: Constants.iconWebsite)
                Divider()
                LinkView(urlPath: Constants.urlMail, url: schoolEmail, icon: Constants.iconMail)
            }
            .padding([.vertical,.horizontal])
            .foregroundStyle(Color.gray)
        }.background(RoundedRectangle(cornerRadius: 20).fill(Color.backgroundColor).shadow(color:Color.black.opacity(0.15), radius: 4))
    }
}






