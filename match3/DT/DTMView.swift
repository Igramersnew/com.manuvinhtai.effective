//
//  DTMView.swift
//  match3
//
//

import SwiftUI

struct DTMView: View {
    @EnvironmentObject var container:Container
    @State var toMap:Bool = false
    @State var map:SavedMap = .init(name: "", date: .init(), mapItems: [])
    var body: some View {
        ZStack{
            Image("bck")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Image("dt")
                    .resizable()
                    .scaledToFit()
                    .padding(.top, 35)
                HStack(spacing:6){
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 2, height: 18)
                    WideText(text: "Dream team maker", size: 24)
                }
                    .frame(maxWidth: .infinity, alignment: .leading)
                ScrollView(.vertical,showsIndicators: false) {
                    VStack{
                        if container.savedMaps.isEmpty {
                            VStack{
                                    WideText(text: "build your dream team", size: 16)
                                        .textCase(.uppercase)
                                        .padding(.horizontal,6)
                                        .padding(.vertical,4)
                                        .background {
                                            RoundedRectangle(cornerRadius: 4)
                                                .fill(Color.white.opacity(0.1))
                                        }
                                
                                OutfitText(text: "Choose players for your lineup across positions. Craft a formidable squad by picking your favorite football stars. Get started now and unleash the power of your dream team", size: 18)
                                    .foregroundColor(.white)
                                    .lineSpacing(3)
                                    .multilineTextAlignment(.center)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(12)
                            .background {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.init(hex: 0x0C1A10))
                            }
                        } else {
                            ForEach(container.savedMaps) { map in
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.init(hex: 0x0C1A10))
                                    .frame(height: 51)
                                    .overlay(content: {
                                        HStack{
                                            WideText(text: map.name, size: 16)
                                                .lineLimit(1)
                                                .padding(.horizontal,6)
                                                .padding(.vertical,4)
                                                .background {
                                                    RoundedRectangle(cornerRadius: 4)
                                                        .fill(Color.white.opacity(0.1))
                                                }
                                            Spacer()
                                            WideText(text: map.date.ddmmhh, size: 16)
                                        }
                                        .padding(.horizontal,10)
                                    })
                                    .onTapGesture {
                                        self.map = map
                                        toMap = true
                                    }
                            }
                        }
                    }
                }
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color.green)
                    .frame(height: 44)
                    .overlay(content: {
                        WideText(text: container.savedMaps.isEmpty ? "start" : "make a new team", size: 16)
                            .textCase(.uppercase)
                    })
                    .padding(.bottom, 20)
                    .onTapGesture {
                        self.map = .init(name: "", date: .init(), mapItems: [])
                        toMap = true
                    }
            }
            .padding(.horizontal,16)
        }
        .background{
            NavigationLink.init(destination: DTView(map: map), isActive: $toMap) {
                EmptyView()
            }
        }
    }
}

struct DTMView_Previews: PreviewProvider {
    static var previews: some View {
        DTMView()
    }
}

extension Date {
    var ddmmhh: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy"
        return formatter.string(from: self)
    }
}
