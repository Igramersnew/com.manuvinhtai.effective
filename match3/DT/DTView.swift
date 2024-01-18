//
//  DTView.swift
//  match3
//
//

import SwiftUI
import SpriteKit

class DT: ObservableObject {
    @Published var name:String = ""
    @Published var showEdit:Bool = false
    @Published var items:[Item] = [
        .init(name: "A", num: "25", role: .gk),
        .init(name: "B", num: "25", role: .lb),
        .init(name: "C", num: "25", role: .rb)
    ]
    @Published var mapItems:[MapItem] = []
    @Published var fpositions:[Role:CGPoint] = [:]
    @Published var rebuildScene:Bool = false
}

struct SavedMap:Identifiable,Codable {
    let id = UUID()
    let name:String
    let date:Date
    let mapItems:[MapItem]
    static let savedmaps:[SavedMap] = [
        .init(name: "ala",
              date: Date(),
              mapItems: [
                .init(point: .zero, name: "1", num: 22, role: .rcb),
                .init(point: .zero, name: "1", num: 22, role: .rcb),
                .init(point: .zero, name: "1", num: 22, role: .rcb),
                .init(point: .zero, name: "1", num: 22, role: .rcb),
                .init(point: .zero, name: "1", num: 22, role: .rcb),
                .init(point: .zero, name: "1", num: 22, role: .rcb),
                .init(point: .zero, name: "1", num: 22, role: .rcb),
                .init(point: .zero, name: "1", num: 22, role: .rcb),
                .init(point: .zero, name: "1", num: 22, role: .rcb),
                .init(point: .zero, name: "1", num: 22, role: .rcb),
                .init(point: .zero, name: "1", num: 22, role: .rcb)
              ])
    ]
}

struct WideText:View {
    let text:String
    let size:CGFloat
    let color:Color
    init(text: String, size: CGFloat, color: Color = .white) {
        self.text = text
        self.size = size
        self.color = color
    }
    var body: some View {
        Text(text)
            .foregroundColor(color)
            .font(.custom("Audiowide", size: size))
    }
}
struct OutfitText:View {
    let text:String
    let size:CGFloat
    let color:Color
    init(text: String, size: CGFloat, color: Color = .white) {
        self.text = text
        self.size = size
        self.color = color
    }
    var body: some View {
        Text(text)
            .foregroundColor(color)
            .font(.custom("Outfit", size: size))
    }
}

struct DTView: View {
    @State var scene:DTScene?
    @StateObject var dt: DT = DT()
    @EnvironmentObject var container:Container
    @Environment(\.dismiss) var dismiss
    let map:SavedMap
    var body: some View {
        ZStack{
            SpriteView(scene: scene ?? .init(.init()))
                .ignoresSafeArea()
            VStack{
                HStack{
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                        .font(.system(size: 20).weight(.bold))
                        .padding([.leading,.trailing,.bottom],16)
                        .background(Color.gray.opacity(0.03))
                        .onTapGesture {
                            print("tappp")
                            dismiss.callAsFunction()
                        }
                    Spacer()
                }
                WideText(text: dt.name, size: 40)
                    .lineLimit(1)
                    .padding(.horizontal,16)
                Spacer()
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color.init(hex: 0x0C1A10))
                    .frame(height: 44)
                    .cornerRadius(24)
                    .overlay {
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(Color.init(hex: 0x00C95F), lineWidth: 1)
                    }
                    .overlay(content: {
                        WideText(text: "edit", size: 16)
                            .textCase(.uppercase)
                    })
                    .padding(.horizontal,16)
                    .onTapGesture {
                        dt.showEdit = true
                    }
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color.green)
                    .frame(height: 44)
                    .overlay(content: {
                        WideText(text: "save team", size: 16)
                            .textCase(.uppercase)
                    })
                    .padding(.horizontal,16)
                    .onTapGesture {
                        if let index = container.savedMaps.firstIndex(where: {$0.id == map.id}) {
                            print("re added")
                            container.savedMaps[index] = .init(name: dt.name.isEmpty ? "No name" : dt.name, date: Date(), mapItems: dt.mapItems)
                        } else {
                            print("new added")
                            container.savedMaps.append(.init(name: dt.name.isEmpty ? "No name" : dt.name, date: Date(), mapItems: dt.mapItems))
                        }
                        dismiss.callAsFunction()
                    }
            }
        }
        .fullScreenCover(isPresented: $dt.showEdit, content: {
            DTEditView(dt: dt)
        })
        .onAppear {
            print("uf")
            dt.name = map.name
            if !map.mapItems.isEmpty {
                dt.mapItems = map.mapItems
                dt.items = dt.mapItems.map({.init(name: $0.name, num: String($0.num), role: $0.role)})
            }
            scene = .init(dt)
        }
        .navigationBarHidden(true)
        .onChange(of: dt.showEdit) { newValue in
            if newValue == false {
                dt.rebuildScene = true
            }
        }
    }
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

struct SizeCalculator: ViewModifier {
    @Binding var size: CGSize
    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .onAppear {
                            size = proxy.size
                        }
                }
            )
    }
}

extension View {
    func saveSize(in size: Binding<CGSize>) -> some View {
        modifier(SizeCalculator(size: size))
    }
}
