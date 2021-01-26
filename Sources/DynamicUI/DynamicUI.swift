import SwiftUI

public struct DynamicUI {
    
    public static func get(reference: [String : Any]) -> some View {
        
        if reference.isEmpty {
            
            var ret: some View  {
                EmptyView()
            }
            
            return AnyView(ret)
        }else {
            var ret: some View  {
                VStack {
                    Text("Dyn")
                    Text("SwiftUI")
                }
            }

            return AnyView(ret)
        }
        

    }
    
}
