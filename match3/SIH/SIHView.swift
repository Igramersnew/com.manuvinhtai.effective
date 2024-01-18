//
//  SIHView.swift
//  match3
//
//

import SwiftUI

struct SIHView: View {
    var body: some View {
        VStack(spacing:0){
            Image("sih_banner")
                .resizable()
                .scaledToFit()
            Image("bck")
                .resizable()
                .overlay {
                    ScrollView(.vertical,showsIndicators: false) {
                        LazyVGrid(columns: [.init()], spacing: 16) {
                            ForEach(Notor.notors) { n in
                                SIHCell(name: n.nm, text: n.text)
                            }
                        }
                        .padding(.vertical,20)
                    }
                    .padding(.horizontal,16)
                }
        }
        .ignoresSafeArea()
    }
}

struct SIHView_Previews: PreviewProvider {
    static var previews: some View {
        SIHView()
    }
}

struct SIHCell:View {
    let name:String
    let text:String
    var body: some View {
        VStack(alignment:.leading, spacing:-13){
            RoundedRectangle(cornerRadius: 6)
                .fill(Color.init(hex: 0x0C1A10))
                .frame(width: UIScreen.main.bounds.width/2.5, height: 30)
            VStack{
                WideText(text: name, size: 18, color: .init(hex: 0x00C95F))
                    .textCase(.uppercase)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,16)
                    .padding(.vertical,6)
                    .background{
                        RoundedRectangle(cornerRadius: 56)
                            .fill(Color.init(hex: 0x00C95F).opacity(0.1))
                    }
                OutfitText(text: text, size: 16)
            }
            .padding(12)
            .background {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.init(hex: 0x0C1A10))
            }
        }
    }
}
