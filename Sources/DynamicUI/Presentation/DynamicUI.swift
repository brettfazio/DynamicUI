import SwiftUI

public struct DynamicUI {
    
    public static func get(reference: UIModel) -> some View {
        
        return recursiveParse(reference: reference)

    }
    
}

// Private helper methods
extension DynamicUI {
    
    private static func recursiveParse(reference: UIModel) -> AnyView {
        
        guard let map = ViewMapping(rawValue: reference.name) else {
            return AnyView(EmptyView())
        }
        
        switch map {
        case .Text:
            var ret: some View {
                Text(reference.primary)
            }
            return AnyView(ret)
        case .VStack:
            var ret: some View {
                VStack {
                    ForEach(0..<reference.inner.count) { index in
                        recursiveParse(reference: reference.inner[index])
                    }
                }
            }
            return AnyView(ret)
        }
        
    }
    
}
