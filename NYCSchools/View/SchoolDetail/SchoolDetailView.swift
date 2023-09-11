import SwiftUI

struct SchoolDetailView: View {
    var school: Schools
    @State private var satDetails: Bool = false
    
    var body: some View {
        ZStack {
            TopPath().fill(Color.blueBackground).customShapeModifier(-490, 2, 443)
            BottomPath().fill(Color.blueBackground).ignoresSafeArea().customShapeModifier(270, -4, 465)
            VStack(spacing: 20) {
                HeaderLogoView(title: school.schoolName)
                ImageCardView(location: school.location, phoneNumber: school.phoneNumber, website: school.website, schoolEmail: school.schoolEmail ?? "No email registered", address: school.address)
                SchoolOfferingsView(sports: school.schoolSports ?? "No Data Found")
                Button(action: {
                    satDetails.toggle()
                }, label: {
                    ReusableButtonView(text: "See SAT Details")
                }).padding(.top)
                Spacer()
            }.frame(width: 340)
                .popover(isPresented: $satDetails, content: {
                    SATSchoolInformationView(dbn: school.dbn, school: school.schoolName)
                        .presentationDetents([.fraction(0.5)])
            })
        }
    }
}

#Preview {
    SchoolDetailView(school: Schools(dbn: "", schoolName: "Clinton School Writers & Artists", location: "", phoneNumber: "", schoolEmail: "", website: "", extracurricularActivities: "", schoolSports: "", city: "", address: ""))
}
