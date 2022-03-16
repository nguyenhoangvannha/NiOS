import SwiftUI

struct DetailEditView: View {
    @Binding var data: Todo.Data
    var body: some View {
        Form {
            Section(header: Text("Todo Info")) {
                TextField("Title", text: $data.title)
                TextField("Description", text: $data.description)
                ThemePicker(selection: $data.theme)
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider{
    static var previews: some View {
        DetailEditView(data: .constant(Todo.Data()))
    }
}
