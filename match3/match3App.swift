//
//  match3App.swift
//  match3
//
//

import SwiftUI

@main
struct match3App: App {
    @StateObject var container: Container = .init()
    @AppStorage("logic_core") var logicCore:Bool = false
    @State var logic:Bool = false
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var settings = Settings()
    private var force: Bool {
        settings.status == .menu && settings.privacyURL == nil
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                Group {
                    contentView
                }
                .fullScreenCover(isPresented: isOnboardingFinished) {
                    WorkView(url: settings.privacyURL ?? PrivacyAndTerms.getMainURL(includeParams: true))
                        .ignoresSafeArea()
                }
            }
            .environmentObject(settings)
        }
    }
    
    private var isOnboardingFinished: Binding<Bool> {
        .init {
            settings.status == .main || settings.privacyURL != nil
        } set: { _ in
           
        }

    }
    
    var contentView: some View {
            NavigationView {
                VStack{
                    if logic || logicCore {
                        ContentView()
                            .transition(.slide)
                            .onAppear {
                                logicCore = true
                            }
                    } else {
                        BefView(logic: $logic)
                    }
                }
            }
            .navigationViewStyle(.stack)
            .preferredColorScheme(.dark)
            .environmentObject(container)
            .onAppear {
                print("core \(logicCore)")
            }
    }
}

struct BefView: View {
    @State var ind:Int = 1
    @Binding var logic:Bool
    var body: some View {
        ZStack{
            Image("bck")
                .resizable()
            VStack{
                Spacer()
                if ind == 1 {
                    Image("cr1")
                        .resizable()
                        .scaledToFit()
                        .transition(.scale)
                } else if ind == 2 {
                    Image("cr2")
                        .resizable()
                        .scaledToFit()
                        .transition(.scale)
                } else if ind == 3 {
                    Image("cr3")
                        .resizable()
                        .scaledToFit()
                        .transition(.scale)
                }
                Spacer()
                VStack{
                    RoundedRectangle(cornerRadius: 56)
                        .fill(Color.init(hex: 0x111211))
                        .frame(height: 56)
                        .overlay {
                            RoundedRectangle(cornerRadius: 56)
                                .stroke(Color.init(hex: 0x00C95F), lineWidth: 1)
                        }
                        .overlay {
                            WideText(text: "skip", size: 19, color: .init(hex: 0x00C95F))
                                .textCase(.uppercase)
                        }
                        .onTapGesture {
                            withAnimation {
                                logic = true
                            }
                        }
                    RoundedRectangle(cornerRadius: 56)
                        .fill(Color.init(hex: 0x00C95F))
                        .frame(height: 56)
                        .overlay {
                            WideText(text: "next", size: 19)
                                .textCase(.uppercase)
                        }
                        .onTapGesture {
                            if ind != 3 {
                                withAnimation {
                                    ind += 1
                                }
                            } else {
                                withAnimation {
                                    logic = true
                                }
                            }
                        }
                }
                Spacer()
            }
            .padding(.horizontal,16)
        }
        .ignoresSafeArea()
    }
}
