//
//  WRSDetView.swift
//  match3
//
//

import SwiftUI

struct WRSDetView: View {
    @Environment(\.dismiss) var dismiss
    let woos:Woos
    @State var woosItem:WoosItem = .init(nm: "", img: "", sts: [], time: 0)
    @State var full:Bool = false
    var body: some View {
        ZStack{
            Image("bck")
                .resizable()
            VStack{
                Image("\(woos.img).1")
                    .resizable()
                    .scaledToFit()
                    .overlay {
                        VStack{
                            HStack{
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20).weight(.bold))
                                    .padding([.leading,.trailing,.bottom],16)
                                    .padding(.top,76)
                                    .background(Color.gray.opacity(0.03))
                                    .onTapGesture {
                                        print("tappp")
                                        dismiss.callAsFunction()
                                    }
                                Spacer()
                            }
                            Spacer()
                        }
                    }
                ScrollView(.vertical,showsIndicators: false) {
                    LazyVGrid(columns: [.init()], spacing: 12) {
                        ForEach(woos.woosItems) { i in
                            HStack{
                                Image(i.img)
                                    .resizable()
                                    .frame(width: 154, height: 96)
                                    .cornerRadius(8)
                                VStack{
                                    WideText(text: i.nm, size: 18)
                                        .textCase(.uppercase)
                                        .multilineTextAlignment(.center)
                                        .padding(8)
                                        .frame(maxWidth: .infinity)
                                        .background {
                                            RoundedRectangle(cornerRadius: 6)
                                                .fill(Color.white.opacity(0.1))
                                        }
                                    RoundedRectangle(cornerRadius: 56)
                                        .fill(Color.init(hex: 0x111211))
                                        .frame(height: 44)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 56)
                                                .stroke(Color.init(hex: 0x00C95F), lineWidth: 1)
                                        }
                                        .overlay {
                                            Image(systemName: "arrow.right")
                                                .foregroundColor(Color.init(hex: 0x00C95F))
                                                .font(.system(size: 16).weight(.bold))
                                        }
                                        .onTapGesture {
                                            woosItem = i
                                            full = true
                                        }
                                }
                            }
                            .padding(12)
                            .background {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.init(hex: 0x0C1A10))
                            }
                        }
                    }
                    .padding(.vertical,20)
                }
                .padding(.horizontal,16)
            }
        }
        .background {
            NavigationLink.init(destination: WRSFullView(woosItem: woosItem), isActive: $full) {
                EmptyView()
            }
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}
