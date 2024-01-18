//
//  DTEditView.swift
//  match3
//
//

import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    var name:String
    var num:String
    var role: Role
}

struct Point: Identifiable{
    let id = UUID()
    let point:CGPoint
    let num:Int
    let role:Role
}

struct DTEditView:View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var dt:DT
    @State var coordinates:[Point] = []
    @State var size:CGSize = .zero
    @StateObject var responder:KeyboardResponder = .init()
    var body: some View {
        ZStack{
            Image("bck")
                .resizable()
                .ignoresSafeArea()
            VStack{
//                if !responder.show {
                    Image("field_img_empty")
                        .resizable()
                        .scaledToFit()
                        .saveSize(in: $size)
                        .overlay {
                            ZStack{
                                ForEach(coordinates) { c in
                                    Image("tshirt")
                                        .overlay {
                                            Text("\(dt.items.first(where: {$0.role == c.role})?.num ?? "ok")")
                                                .foregroundColor(.black)
                                        }
                                        .opacity(dt.items.contains(where: {$0.role == c.role}) ? 1 : 0)
                                        .scaleEffect(responder.show ? 0 : 1)
                                        .position(responder.show ? .init(x: size.width / 8, y: size.height / 6) : c.point)
                                }
                            }
                        }
                        .frame(maxWidth: responder.show ? UIScreen.main.bounds.width / 4 : .infinity, maxHeight: responder.show ? UIScreen.main.bounds.width / 4 : .infinity)
//                }
//                        .scaleEffect(responder.show ? 0.8 : 1)
                VStack(alignment: .leading){
                    WideText(text: "team name", size: 16)
                        .textCase(.uppercase)
                    TextField("", text: $dt.name)
                        .padding(.horizontal,16)
                        .foregroundColor(.white)
                        .font(.custom("Outfit", size: 22))
                        .frame(height: 44)
                        .background(Color.init(hex: 0x0C1A10))
                        .cornerRadius(24)
                        .overlay {
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(Color.init(hex: 0x00C95F), lineWidth: 1)
                        }
                }
                VStack(alignment: .leading){
                    HStack{
                        Rectangle()
                            .fill(Color.clear)
                            .frame(width: 26, height: 36)
                        WideText(text: "player’s name", size: 14)
                            .textCase(.uppercase)
                            .frame(height: 36)
                            .padding(.trailing,10)
                        WideText(text: "nmb", size: 14)
                            .textCase(.uppercase)
                            .frame(width: 55, height: 36)
                        WideText(text: "role", size: 14)
                            .textCase(.uppercase)
                            .frame(width: 88, height: 36)
                    }
                    ScrollView(.vertical,showsIndicators: false) {
                        ForEach(dt.items.indices,id: \.self) { index in
                            FieldView(
                                id: index,
                                value: Binding<String>(get: {
                                    guard index < dt.items.count else { return "" }
                                    return dt.items[index].name
                                }, set: { newValue in
                                    dt.items[index].name = newValue
                                }),
                                secValue: Binding<String>(get: {
                                    guard index < dt.items.count else { return "" }
                                    return dt.items[index].num
                                }, set: { newValue in
                                    dt.items[index].num = newValue
                                }),
                                role: Binding<Role>(get: {
                                    guard index < dt.items.count else { return Role.rcm }
                                    return dt.items[index].role
                                }, set: { newValue in
                                    dt.items[index].role = newValue
                                })) {
                                    dt.items.remove(at: index)
                                }
                        }
                    }
                    if !responder.show {
                        VStack{
                            RoundedRectangle(cornerRadius: 24)
                                .fill(Color.init(hex: 0x0C1A10))
                                .frame(height: 44)
                                .cornerRadius(24)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 24)
                                        .stroke(Color.init(hex: 0x00C95F), lineWidth: 1)
                                }
                                .overlay(content: {
                                    WideText(text: "add player", size: 16)
                                        .textCase(.uppercase)
                                })
                                .onTapGesture {
                                    if dt.items.count < 11 {
                                        dt.items.append(.init(name: "A", num: "05", role: .gk))
                                    }
                                }
                            RoundedRectangle(cornerRadius: 24)
                                .fill(Color.green)
                                .frame(height: 44)
                                .overlay(content: {
                                    WideText(text: "done", size: 16)
                                        .textCase(.uppercase)
                                })
                                .onTapGesture {
                                    dt.mapItems = dt.items.map({MapItem.init(point: .zero, name: $0.name, num: Int($0.num) ?? 1, role: $0.role)})
                                    for (i,j) in dt.mapItems.enumerated() {
                                        if let fwhere = dt.fpositions.first(where: {$0.key == j.role}) {
                                            dt.mapItems[i].point = fwhere.value
                                        }
                                    }
                                    dismiss.callAsFunction()
                                }
                        }
                    }
                }
            }
            .padding(.horizontal,16)
            VStack{
                HStack{
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                        .font(.system(size: 20).weight(.bold))
                        .onTapGesture {
                            dismiss.callAsFunction()
                        }
                    Spacer()
                }
                .padding(.horizontal,16)
                Spacer()
            }
        }
        .navigationBarHidden(true)
        .onChange(of: size) { newValue in
            coordinates = [
                .init(point: .init(x: size.width/2, y: size.height - 50), num: 1, role: .gk),
                .init(point: .init(x: size.width/2/2 - 27, y: size.height - 100), num: 2, role: .lb),
                .init(point: .init(x: size.width - size.width/2/2 + 30, y: size.height - 100), num: 3, role: .rb),
                .init(point: .init(x: size.width/2 - 55, y: size.height - 90), num: 4, role: .lcb),
                .init(point: .init(x: size.width/2 + 55, y: size.height - 90), num: 5, role: .rcb),
                .init(point: .init(x: size.width/2 - 50, y: size.height/2 - 20), num: 6, role: .lcm),
                .init(point: .init(x: size.width/2 + 50, y: size.height/2 - 20), num: 7, role: .rcm),
                .init(point: .init(x: size.width/2/2 - 15, y: size.height/2 - 30), num: 8, role: .lm),
                .init(point: .init(x: size.width - size.width/2/2 + 15, y: size.height/2 - 32), num: 9, role: .rm),
                .init(point: .init(x: size.width/2 - 53, y: size.height/2 - 80), num: 10, role: .lcf),
                .init(point: .init(x: size.width/2 + 53, y: size.height/2 - 80), num: 11, role: .rcf),
            ]
        }
    }
}

struct FieldView: View {
    let id:Int
    @Binding var value: String
    @Binding var secValue: String
    @Binding var role:Role
    let onDelete: () -> Void
    
    var body: some View {
        HStack {
            HStack{
                WideText(text: "\(id + 1)", size: 20)
                    .minimumScaleFactor(0.5)
                    .frame(width: 26)
                TextField("", text: $value)
                    .padding(.horizontal,10)
                    .foregroundColor(.white)
                    .font(.custom("Outfit", size: 18))
                    .frame(height: 36)
                    .background(Color.init(hex: 0x0C1A10))
                    .cornerRadius(20)
                TextField("", text: $secValue)
                    .padding(.horizontal,10)
                    .foregroundColor(.white)
                    .font(.custom("Outfit", size: 18))
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                    .frame(width: 55, height: 36)
                    .background(Color.init(hex: 0x0C1A10))
                    .cornerRadius(20)
                Menu {
                    ForEach(Role.allCases, id: \.self) { r in
                        Button(r.full, action: {role = r})
                    }
                } label: {
                    OutfitText(text: role.capital, size: 18)
                        .padding(.horizontal,10)
                        .multilineTextAlignment(.center)
                        .frame(width: 88, height: 36)
                        .background(Color.init(hex: 0x0C1A10))
                        .cornerRadius(20)
                }

            }
            Button(action: {
                onDelete()
            }, label: {
                Image(systemName: "multiply")
                    .foregroundColor(.red)
            })
        }
    }
}
