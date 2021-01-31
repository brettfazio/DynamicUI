import SwiftUI

public struct DynamicUI: View {
    
    @Binding var reference: UIModel
    @Binding var model: DynamicVMProtocol
    
    public var body: some View {
        make(reference: reference)
    }
    
    public func make(reference: UIModel) -> some View {
        return recursiveParse(reference: reference)
    }
    
}

// Private helper methods
extension DynamicUI {
    
    private func recursiveParse(reference: UIModel) -> AnyView {
        
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
                    parseInner(reference: reference)
                }
            }
            return AnyView(ret)
        case .Button:
            var ret: some View {
                Button(action: {
                    model.didPress(id: reference.primary)
                }, label: {
                    parseInner(reference: reference)
                })
            }
            return AnyView(ret)
        }
        
    }
    
    private func parseInner(reference: UIModel) -> AnyView {
        var ret: some View {
            ForEach(0..<reference.inner.count) { index in
                recursiveParse(reference: reference.inner[index])
            }
        }
        return AnyView(ret)
    }
    
}
