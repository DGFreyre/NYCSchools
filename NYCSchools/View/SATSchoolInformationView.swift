import SwiftUI

struct SATSchoolInformationView: View {
    @StateObject private var vm = SATDetailViewModel()
    @Environment(\.dismiss) private var dismiss
    private var dbn: String
    
    init(dbn: String) {
        self.dbn = dbn
    }
    
    var body: some View {
        VStack {
            ForEach(vm.satInfo, id: \.self) { info in
                Text(info.schoolName)
            }
        }.onAppear{
            vm.fetchSATData(dbn)
        }.alert(isPresented: $vm.showAlert) { 
            Alert(title: Text(vm.responseMessage),
                  message: Text("Please, pick another"),  dismissButton: .cancel(Text("Ok"), action: {
                dismiss()
            }))
        }
    }
}

#Preview {
    SATSchoolInformationView(dbn: "01M450")
}
