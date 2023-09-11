import SwiftUI

struct SchoolRowView: View {
    private var schoolName: String
    private var schoolCity: String
    
    init(schoolName: String, schoolCity: String) {
        self.schoolName = schoolName
        self.schoolCity = schoolCity
    }
    
    var body: some View {
        HStack() {
            Text(schoolName).font(.custom("MontserratAlternates-Regular", size: 14)).foregroundStyle(Color.secondaryText)
            Spacer()
            Text(schoolCity).font(.caption).foregroundStyle(Color.blueSecondary)
            
        }.frame(width: 340, height: 40).padding()
            .background(
                RoundedRectangle(cornerRadius: 10).fill(Color.backgroundColor).shadow(color:Color.shadowColor.opacity(0.15), radius: 3, x: 0, y: 0).overlay(
                    RoundedRectangle(cornerRadius: 10).strokeBorder(Color.colorRow)
            )
        )
    }
}

#Preview {
    SchoolRowView(schoolName: "", schoolCity: "")
}
