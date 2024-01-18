//
//  WRSFullView.swift
//  match3
//
//

import SwiftUI
import Combine

struct WRSFullView: View {
    let woosItem: WoosItem
    @Environment(\.dismiss) var dismiss
    @State var timer:Timer.TimerPublisher = Timer.publish(every: 1, on: .main, in: .common)
    @State var cancel:Cancellable? = nil
    @State var sec:Int = 0
    @State var off:Bool = true
    var body: some View {
        VStack(spacing:0){
            Image(woosItem.img)
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
                    VStack{
                        VStack{
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.white.opacity(0.1))
                                .frame(height: 44)
                                .overlay {
                                    WideText(text: "4 sets of 8 reps", size: 18)
                                        .textCase(.uppercase)
                                }
                            ForEach(woosItem.sts, id: \.self) { w in
                                HStack(alignment:.top){
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 6, height: 6)
                                        .offset(y:9)
                                    OutfitText(text: w, size: 18)
                                    Spacer()
                                }
                            }
                        }
                        .padding(12)
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.init(hex: 0x0C1A10))
                        }
                        Spacer()
                        RoundedRectangle(cornerRadius: 32)
                            .fill(Color.black)
                            .frame(height: 52)
                            .overlay {
                                HStack{
                                    HStack{
                                        Image(systemName: "clock")
                                            .foregroundColor(.white)
                                        OutfitText(text: "\(Double(sec).asString(style: .positional))", size: 16)
                                    }
                                    Spacer()
                                    RoundedRectangle(cornerRadius: 32)
                                        .fill(off ? Color.init(hex: 0x00C95F) : .red)
                                        .frame(width:UIScreen.main.bounds.width/2)
                                        .overlay(content: {
                                            WideText(text: off ? "start" : "stop", size: 18)
                                                .textCase(.uppercase)
                                        })
                                        .onTapGesture {
                                            if off {
                                                timer = Timer.publish(every: 1, on: .main, in: .common)
                                                cancel = timer.connect()
                                            } else {
                                                cancel?.cancel()
                                            }
                                            withAnimation {
                                                off.toggle()
                                            }
                                        }
                                }
                                .padding(4)
                                .padding(.leading,12)
                            }
                    }
                    .padding(.horizontal,16)
                    .padding(.vertical,20)
                }
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .onAppear {
            sec = woosItem.time*60
        }
        .onReceive(timer) { _ in
            if sec != 0 {
                sec -= 1
            } else {
                cancel?.cancel()
                withAnimation {
                    off = true
                }
                sec = woosItem.time*60
            }
        }
    }
}

extension Double {
  func asString(style: DateComponentsFormatter.UnitsStyle) -> String {
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.hour, .minute, .second, .nanosecond]
    formatter.unitsStyle = style
    return formatter.string(from: self) ?? ""
  }
}
