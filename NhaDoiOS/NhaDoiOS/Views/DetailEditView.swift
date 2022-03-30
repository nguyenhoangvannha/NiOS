import SwiftUI

struct DetailEditView: View {
    @Binding var data: Todo.Data
    
    //@ObservedObject var todoTimer: TodoTimer
    //@EnvironmentObject var todoTimerFromEnv: TodoTimer
    var body: some View {
        Form {
            Section(header: Text("Todo Info")) {
                TextField("Title", text: $data.title)
                TextField("Description", text: $data.description)
                ThemePicker(selection: $data.theme)
                //Text(String(todoTimerFromEnv.secondsElapsed))
            }
        }

        
    }
}

struct DetailEditView_Previews: PreviewProvider{
    static var previews: some View {
        DetailEditView(data: .constant(Todo.Data())
                       //, todoTimer: TodoTimer()
        )
    }
}
