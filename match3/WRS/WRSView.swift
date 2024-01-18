//
//  WRSView.swift
//  match3
//
//

import SwiftUI

struct WRSView: View {
    @State var woos:Woos = .init(nm: "", img: "", des: "", woosItems: [])
    @State var det:Bool = false
    var body: some View {
        VStack(spacing:0){
            Image("wrs_banner")
                .resizable()
                .scaledToFit()
            Image("bck")
                .resizable()
                .overlay {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack{
                            ForEach(Woos.wooses) { w in
                                WRSCell(name: w.nm, text: w.des, img: w.img) {
                                    woos = w
                                    det = true
                                }
                            }
                        }
                        .padding(.vertical,20)
                    }
                    .padding(.horizontal,16)
                }
        }
        .ignoresSafeArea()
        .background {
            NavigationLink.init(destination: WRSDetView(woos: woos), isActive: $det) {
                EmptyView()
            }
        }
    }
}

struct WRSView_Previews: PreviewProvider {
    static var previews: some View {
        WRSView()
    }
}

struct WRSCell:View {
    let name:String
    let text:String
    let img:String
    let action:()->Void
    var body: some View {
        VStack(alignment:.leading, spacing:-13){
            RoundedRectangle(cornerRadius: 6)
                .fill(Color.black)
                .frame(width: UIScreen.main.bounds.width/4, height: 30)
            VStack(spacing:12){
                RoundedRectangle(cornerRadius: 56)
                    .fill(Color.white.opacity(0.1))
                    .frame(height: 38)
                    .overlay {
                        WideText(text: name, size: 16)
                            .textCase(.uppercase)
                    }
                HStack{
                    Image(img)
                    OutfitText(text: text, size: 16)
                    Image(img)
                        .rotationEffect(.degrees(180))
                }
                RoundedRectangle(cornerRadius: 56)
                    .fill(Color.init(hex: 0x111211))
                    .frame(height: 44)
                    .overlay {
                        RoundedRectangle(cornerRadius: 56)
                            .stroke(Color.init(hex: 0x00C95F), lineWidth: 1)
                    }
                    .overlay {
                        WideText(text: "start", size: 18, color: .init(hex: 0x00C95F))
                            .textCase(.uppercase)
                    }
                    .onTapGesture {
                        action()
                    }
            }
            .padding(12)
            .background {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.black)
            }
        }
    }
}
