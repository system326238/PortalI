import SwiftUI

struct GamePlayView: View {
    @EnvironmentObject private var game: PortalInvasionGameModel
    @State private var moveVector: CGSize = .zero
    @State private var firing = false

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("SCORE \(game.score)")
                    .foregroundStyle(.white)
                Spacer()
                Text("XP \(game.profileXp)  LV \(game.currentLevel)")
                    .foregroundStyle(.yellow)
            }
            .padding(.horizontal)
            .padding(.top, 12)

            ZStack {
                RoundedRectangle(cornerRadius: 18)
                    .fill(LinearGradient(colors: [Color(hex: "02131E"), Color(hex: "211638")], startPoint: .top, endPoint: .bottom))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(
                        VStack {
                            Spacer()
                            HStack {
                                touchPad
                                Spacer()
                                fireButton
                            }
                            .padding(20)
                        }
                    )

                Text("PORTAL//INVASION")
                    .font(.system(size: 16, weight: .bold, design: .monospaced))
                    .foregroundStyle(.cyan)
                    .padding(.top, 18)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(LinearGradient(colors: [.black, Color(hex: "0A1830")], startPoint: .top, endPoint: .bottom).ignoresSafeArea())
    }

    private var touchPad: some View {
        ZStack {
            Circle()
                .fill(Color.white.opacity(0.08))
                .frame(width: 120, height: 120)
            Circle()
                .fill(Color.cyan.opacity(0.35))
                .frame(width: 54, height: 54)
                .offset(x: moveVector.width * 22, y: moveVector.height * 22)
        }
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { value in
                    let clampedX = max(-1, min(1, value.translation.width / 34))
                    let clampedY = max(-1, min(1, value.translation.height / 34))
                    moveVector = CGSize(width: clampedX, height: clampedY)
                }
                .onEnded { _ in
                    moveVector = .zero
                }
        )
    }

    private var fireButton: some View {
        Button(action: { firing.toggle() }) {
            Text(firing ? "FIRING" : "FIRE")
                .font(.system(size: 18, weight: .bold, design: .monospaced))
                .foregroundStyle(.black)
                .frame(width: 88, height: 88)
                .background(
                    Circle().fill(firing ? Color.yellow : Color(red: 1, green: 0.5, blue: 0.6))
                )
        }
        .buttonStyle(.plain)
    }
}
