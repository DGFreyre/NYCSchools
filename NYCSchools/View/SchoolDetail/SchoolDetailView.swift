import SwiftUI

struct SchoolDetailView: View {
    var school: Schools
    @State private var satDetails: Bool = false
    
    var body: some View {
        ZStack {
            TopPath().fill(Color.blueBackground).customShapeModifier(-460, 2, 413)
            BottomPath().fill(Color.blueBackground).customShapeModifier(210, -4, 445)
            VStack(spacing: 25) {
                Image(Constants.blueLogo).resizable().scaledToFit().frame(width: 150)
                Text(school.schoolName).font(.custom("MontserratAlternates-Regular", size: 20))
                ImageCardView(location: school.location, phoneNumber: school.phoneNumber, website: school.website, schoolEmail: school.schoolEmail ?? "No email registered")
                SchoolRequirementsView(sports: school.schoolSports ?? "No Data Found")
                Button(action: {
                    satDetails.toggle()
                }, label: {
                    Text("See SAT Details").foregroundStyle(Color.white).background(
                        RoundedRectangle(cornerRadius: 10).fill(Color.blueSecondary).frame(width: 340,height: 40))
                })
            }.frame(width: 340)
                .popover(isPresented: $satDetails, content: {
                    SATSchoolInformationView(dbn: school.dbn)
                        .presentationDetents([.fraction(0.75)])
                })
        }
    }
}

#Preview {
    SchoolDetailView(school: Schools(dbn: "", schoolName: "Clinton School Writers & Artists", location: "", phoneNumber: "", schoolEmail: "", website: "", extracurricularActivities: "", schoolSports: "", city: ""))
}




struct SchoolRequirementsView: View {
    private var sports: String
    init(sports: String) {
        self.sports = sports
    }
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text("Schools Sports:").font(.custom("ZillaSlab-Medium", size: 18))
                Spacer()
            }
            Text(sports)
        }.multilineTextAlignment(.leading).padding(.horizontal).foregroundStyle(Color.secondaryTextColor).frame(width: 340, height: 100).background(RoundedRectangle(cornerRadius: 10).fill(Color.backgroundColor).shadow(color:Color.black.opacity(0.15), radius: 4))
    }
}


struct ImageCardView: View {
    private var location: String
    private var phoneNumber: String
    private var website: String
    private var schoolEmail: String
    
    init(location: String, phoneNumber: String, website: String, schoolEmail: String) {
        self.location = location
        self.phoneNumber = phoneNumber
        self.website = website
        self.schoolEmail = schoolEmail
    }
    var body: some View {
        VStack {
            Image("school").resizable().scaledToFit().mask(RoundedCornersMask(corners: [.topRight, .bottomRight], radius: 20))
            VStack(spacing:8){
                HStack{
                    Image(systemName: "location.circle")
                    Text(location)
                    Spacer()
                }
                Divider()
                HStack{
                    Image(systemName: "phone.circle")
                    Text(phoneNumber)
                    Spacer()
                }
                Divider()
                HStack{
                    Image(systemName: "network")
                    Link(website, destination: URL(string: "https://\(website)")!)
                    Spacer()
                }
                Divider()
                HStack{
                    Image(systemName: "envelope.circle")
                    Text(schoolEmail)
                    Spacer()
                }
            }
            .padding(.vertical)
            .foregroundStyle(Color.gray).frame(width: 300, height: 140)
        }.background(RoundedRectangle(cornerRadius: 20).fill(Color.backgroundColor).shadow(color:Color.black.opacity(0.15), radius: 4))
    }
}
