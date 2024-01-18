//
//  FRFDetView.swift
//  match3
//
//

import SwiftUI

struct FRFDetView: View {
    let role:FieRole
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing:0){
            Image(role.bannImg)
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
            Image("bck")
                .resizable()
                .overlay {
                    ScrollView(.vertical,showsIndicators: false) {
                        VStack(spacing:16){
                            VStack{
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(Color.white.opacity(0.1))
                                    .frame(height: 44)
                                    .overlay {
                                        WideText(text: "key functions", size: 18)
                                            .textCase(.uppercase)
                                    }
                                ForEach(role.keysf, id: \.self) { k in
                                    HStack(alignment:.top){
                                        Circle()
                                            .fill(Color.white)
                                            .frame(width: 6, height: 6)
                                            .offset(y:9)
                                        OutfitText(text: k, size: 18)
                                        Spacer()
                                    }
                                }
                            }
                            .padding(12)
                            .background {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.init(hex: 0x0C1A10))
                            }
                            
                            VStack{
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(Color.white.opacity(0.1))
                                    .frame(height: 44)
                                    .overlay {
                                        WideText(text: "famous example", size: 18)
                                            .textCase(.uppercase)
                                    }
                                ForEach(Array(role.ex.enumerated()), id: \.element) { i,j in
                                    HStack(alignment:.top){
                                        OutfitText(text: j, size: 18, color: i == 0 ? .init(hex: 0x00C95F) : .white)
                                        Spacer()
                                    }
                                }
                            }
                            .padding(12)
                            .background {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.init(hex: 0x0C1A10))
                            }
                        }
                        .padding(.vertical,20)
                    }
                    .padding(.horizontal,16)
                }
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}
