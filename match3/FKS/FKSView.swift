//
//  FKSView.swift
//  match3
//
//

import SwiftUI

struct FKSView: View {
    @State var index:Int = 0
    var keystr:KeyStr{
        KeyStr.keystrs[index]
    }
    var body: some View {
        VStack(spacing:0){
            Image("fks_banner")
                .resizable()
                .scaledToFit()
            Image("bck")
                .resizable()
                .overlay {
                    VStack{
                        ScrollView(.vertical,showsIndicators: false) {
                            VStack(spacing:24){
                                VStack{
                                    WideText(text: keystr.nm, size: 18)
                                        .multilineTextAlignment(.center)
                                        .textCase(.uppercase)
                                        .padding(.horizontal,16)
                                        .padding(.vertical,6)
                                        .background{
                                            RoundedRectangle(cornerRadius: 56)
                                                .fill(Color.white.opacity(0.1))
                                        }
                                    VStack(alignment: .leading,spacing: 4){
                                        WideText(text: "Strategy", size: 16, color: .init(hex: 0x00C95F))
                                            .textCase(.uppercase)
                                        OutfitText(text: keystr.str, size: 16)
                                            .padding(.bottom,16)
                                        WideText(text: "Example", size: 16, color: .init(hex: 0x00C95F))
                                            .textCase(.uppercase)
                                        OutfitText(text: keystr.ex, size: 16)
                                    }

                                }
                                .frame(maxWidth: .infinity)
                                .padding(16)
                                .background {
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.init(hex: 0x0C1A10))
                                }
                                .padding(.horizontal,16)
                                .padding(.top,20)
                                HStack{
                                    RoundedRectangle(cornerRadius: 56)
                                        .fill(Color.init(hex: 0x111211))
                                        .frame(height: 44)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 56)
                                                .stroke(Color.init(hex: 0x00C95F), lineWidth: 1)
                                        }
                                        .overlay {
                                            Image(systemName: "arrow.left")
                                                .foregroundColor(Color.init(hex: 0x00C95F))
                                                .font(.system(size: 16).weight(.bold))
                                        }
                                        .onTapGesture {
                                            guard index != 0 else { return }
                                            withAnimation {
                                                index -= 1
                                            }
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
                                            guard index != KeyStr.keystrs.count-1 else {return}
                                            withAnimation {
                                                index += 1
                                            }
                                        }
                                }
                                .padding(.horizontal,16)
                            }
                        }
                    }
                }
        }
        .ignoresSafeArea()
    }
}

struct FKSView_Previews: PreviewProvider {
    static var previews: some View {
        FKSView()
    }
}
