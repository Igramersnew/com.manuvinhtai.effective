//
//  FRFView.swift
//  match3
//
//

import SwiftUI

struct FRFView: View {
    @State var det:Bool = false
    @State var role:FieRole = .init(bannImg: "", nm: "", img: "", des: "", keysf: [], ex: [])
    var body: some View {
        VStack(spacing:0){
            Image("frf_banner")
                .resizable()
                .scaledToFit()
            Image("bck")
                .resizable()
                .overlay {
                    ScrollView(.vertical,showsIndicators: false) {
                        LazyVGrid(columns: [.init()], spacing: 16) {
                            ForEach(FieRole.fieroles) { r in
                                FRFCell(name: r.nm, text: r.des, img: r.img) {
                                    role = r
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
            NavigationLink.init(destination: FRFDetView(role: role), isActive: $det) {
                EmptyView()
            }
        }
    }
}

struct FRFView_Previews: PreviewProvider {
    static var previews: some View {
        FRFView()
    }
}

struct FRFCell:View {
    let name:String
    let text:String
    let img:String
    let action:()->Void
    var body: some View {
        VStack(alignment:.leading, spacing:-13){
            RoundedRectangle(cornerRadius: 6)
                .fill(Color.black)
                .frame(width: UIScreen.main.bounds.width/4, height: 30)
            HStack{
                Image(img)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                VStack{
                    WideText(text: name, size: 18)
                        .textCase(.uppercase)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal,16)
                        .padding(.vertical,6)
                        .background{
                            RoundedRectangle(cornerRadius: 56)
                                .fill(Color.white.opacity(0.1))
                        }
                    VStack(alignment:.leading){
                        OutfitText(text: text, size: 16)
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
                                action()
                            }
                    }
                }
                .padding(.horizontal,16)
            }
            .padding(12)
            .background {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.black)
            }
        }
    }
}
