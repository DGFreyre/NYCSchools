import SwiftUI

struct SATSchoolInformationView: View {
    @StateObject private var vm = SATDetailViewModel()
    @Environment(\.dismiss) private var dismiss
    private var dbn: String
    private var school: String
    
    init(dbn: String, school: String ) {
        self.dbn = dbn
        self.school = school
    }
    
    var body: some View {
        ZStack(alignment: .top){
            Color.blueSecondary.ignoresSafeArea()
            NavigationStack {
                VStack {
                    Text(school).font(.title2).padding(.bottom)
                    ForEach(vm.satInfo, id: \.self) { info in
                        VStack(spacing: 15){
                            SATRowInformationView(title: Constants.SATTitle.test, value: info.numOfSatTestTakers)
                            SATRowInformationView(title: Constants.SATTitle.readingAvg, value: info.satCriticalReadingAvgScore)
                            SATRowInformationView(title: Constants.SATTitle.mathAvg, value: info.satMathAvgScore)
                            SATRowInformationView(title: Constants.SATTitle.writingAvg, value: info.satWritingAvgScore)
                        }
                    }
                    Spacer()
                }.toolbar(content: {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            dismiss()
                        } label: {
                            Text("Done").foregroundStyle(.gray)
                        }
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        Image(Constants.blueLogo).resizable().scaledToFit().frame(width: 50)
                    }
                })
                .onAppear{
                    vm.fetchSATData(dbn)
                }.alert(isPresented: $vm.showAlert) {
                    Alert(title: Text(vm.responseMessage),
                          message: Text("Please, pick another"),  dismissButton: .cancel(Text("Ok"), action: {
                        dismiss()
                    }))
                }
            }
            
        }
    }
}

#Preview {
    SATSchoolInformationView(dbn: "01M450", school: "QUEENS GATEWAY TO HEALTH SCIENCES SECONDARY SCHOOL")
}




