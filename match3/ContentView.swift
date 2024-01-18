//
//  ContentView.swift
//  match3
//
//

import SwiftUI

struct ContentView: View {
    enum Bar: String, CaseIterable {
        case str_bar
        case sc_bar
        case role_bar
        case ws_bar
        case dt_bar
    }
    @State var bar:Bar = .str_bar
//    @State var scale:Double = 0.95
    @State var scale:Double = 1
    var body: some View {
        VStack(spacing:0){
            switch bar {
            case .str_bar:
                FKSView()
                    .scaleEffect(scale)
                    .overlay(content: {
                        Rectangle()
                            .fill(Color.black)
                            .opacity(scale == 1.1 ? 1 : 0)
                    })
                    .onAppear {
                        withAnimation(.linear.delay(0.02).speed(1.5)) {
                            scale = 1
                        }
                    }
            case .sc_bar:
                SIHView()
                    .scaleEffect(scale)
                    .overlay(content: {
                        Rectangle()
                            .fill(Color.black)
                            .opacity(scale == 1.1 ? 1 : 0)
                    })
                    .onAppear {
                        withAnimation(.linear.delay(0.02).speed(1.5)) {
                            scale = 1
                        }
                    }
            case .role_bar:
                FRFView()
                    .scaleEffect(scale)
                    .overlay(content: {
                        Rectangle()
                            .fill(Color.black)
                            .opacity(scale == 1.1 ? 1 : 0)
                    })
                    .onAppear {
                        withAnimation(.linear.delay(0.02).speed(1.5)) {
                            scale = 1
                        }
                    }
            case .ws_bar:
                WRSView()
                    .scaleEffect(scale)
                    .overlay(content: {
                        Rectangle()
                            .fill(Color.black)
                            .opacity(scale == 1.1 ? 1 : 0)
                    })
                    .onAppear {
                        withAnimation(.linear.delay(0.02).speed(1.5)) {
                            scale = 1
                        }
                    }
            case .dt_bar:
                DTMView()
                    .scaleEffect(scale)
                    .overlay(content: {
                        Rectangle()
                            .fill(Color.black)
                            .opacity(scale == 1.1 ? 1 : 0)
                    })
                    .onAppear {
                        withAnimation(.linear.delay(0.02).speed(2)) {
                            scale = 1
                        }
                    }
            }
            VStack(spacing:0){
                HStack{
                    ForEach(Bar.allCases, id: \.rawValue) { b in
                        Image(bar == b ? "\(b.rawValue).1" : b.rawValue)
                            .resizable()
                            .scaledToFit()
                            .onTapGesture {
                                guard bar != b else { return }
                                withAnimation(.linear.delay(0.015)) {
                                    scale = 1.1
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    bar = b
                                }
                            }
                    }
                }
                .background(Color.black)
                Rectangle()
                    .fill(Color.black)
                    .frame(height: 25)
            }
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8) else {
            return nil
        }
        do {
            let result = try JSONDecoder().decode([Element].self, from: data)
            self = result
        } catch {return nil}
    }
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {return "[]"}
        return result
    }
}

class KeyboardResponder: ObservableObject {
    @Published var currentHeight: CGFloat = 0
    @Published var show: Bool = false

    var keyboardWillShowNotification = NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
    var keyboardWillHideNotification = NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)

    init() {
        keyboardWillShowNotification.map { notification in
            withAnimation {
                self.show = true
            }
            return CGFloat((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0)
        }
        .assign(to: \.currentHeight, on: self)
        .store(in: &cancellableSet)

        keyboardWillHideNotification.map { _ in
            withAnimation {
                self.show = false
            }
            return CGFloat(0)
        }
        .assign(to: \.currentHeight, on: self)
        .store(in: &cancellableSet)
    }

    private var cancellableSet: Set<AnyCancellable> = []
}

import Combine
