//
//  OnBoarding.swift
//  Applets
//
//  Created by シェイミ on 17/02/2023.
//


import SwiftUI
import CoreGraphics

struct OnBoarding: View {
    @State private var offset: CGFloat = 0
    @State private var isEUButton: Bool? = nil
    @Binding var firstRun: Bool

    var body: some View {
        // Custom Pageing View
        OffsetPageTabView(offset: $offset) {
            HStack(spacing: 0) {
                ForEach(OnboardingScreen.boardingScreens) { screen in

                    VStack(spacing: 15) {
                        Image(screen.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: getScreenBounds().width - 100, height: getScreenBounds().width - 100)
                        // The following tests for small screens
                            .scaleEffect(getScreenBounds().height < 750 ? 0.9 : 1)
                            .offset(y: getScreenBounds().height < 750 ? -100 : -120)

                        VStack(alignment: .leading, spacing: 12) {
                            Text(screen.title)
                                .font(.largeTitle.bold())
                                .foregroundColor(.white)
                                .padding(.top, 20)

                            Text(screen.description)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .offset(y: -70)

                    }
                    .padding()
                    .frame(width: getScreenBounds().width)
                    .frame(maxHeight: .infinity)
                }
            }
        }
        // Main background animation
        .background(
            RoundedRectangle(cornerRadius: 50)
                .fill(.black.opacity(0.8))
            // Size the same as image size
                .frame(width: getScreenBounds().width - 100, height: getScreenBounds().width - 100)
                .scaleEffect(2)
                .rotationEffect(.init(degrees: 25))
                .rotationEffect(.init(degrees: getRotation()))
                .offset(y: -getScreenBounds().width + 20)

            , alignment: .leading
        )
        .background(Color("screen\(getIndex() + 1)"))
        .animation(.easeInOut, value: getIndex())
        .ignoresSafeArea(.container, edges: .all)
        .overlay(
            VStack {
                if offset == min(offset + getScreenBounds().width, getScreenBounds().width * 1) {
                    HStack {
                        QuestionButtonView(title: "EU",
                                           isEUButton: $isEUButton)
                        QuestionButtonView(title: "non-EU",
                                           isEUButton: $isEUButton)
                    }
                }

                HStack {
                    Button {
                        firstRun = false
                    } label: {
                        Text("Skip")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    // Indicators
                    HStack(spacing: 8) {
                        ForEach(OnboardingScreen.boardingScreens.indices, id: \.self) { index in
                            Circle()
                                .fill(.white)
                                .opacity(index == getIndex() ? 1 : 0.4)
                                .frame(width: 8, height: 8)
                                .scaleEffect(index == (getIndex()) ? 1.3 : 0.85)
                                .animation(.easeInOut, value: getIndex())
                        }
                    }
                    .frame(maxWidth: .infinity)

                    Group {
                        if offset < min(offset + getScreenBounds().width, getScreenBounds().width * 3) {

                            // This way of animating the screens needs to change, maybe do an enum for each screen. The following button will cause the Finish button to flash up for an instant before the animation, and the only way I can think of to fix it is to refactor the whole thing.
                            Button {
                                // Set Max Offset
                                // Maximum of 4 screens, so max will be 3 * width
                                offset = min(offset + getScreenBounds().width, getScreenBounds().width * 3)

                            } label: {
                                Text("Next")
                            }

                        } else {
                            Button {
                                firstRun = false
                            } label: {
                                Text("Finish")

                            }
                        }

                    }
                    .fontWeight(.semibold)
                    .foregroundColor(.white)

                }
                .padding(.top, 30)
                .padding(.horizontal, 8)
            }
            .padding()
            , alignment: .bottom
        )
    }

    // Get rotation
    func getRotation() -> Double {
        let progress = offset / (getScreenBounds().width * 4)
        let rotation = Double(progress) * 360         // Do one full rotation (can also do less)

        return rotation
    }

    // Change the background colour based on the offset
    func getIndex() -> Int {
        let progress = (offset / getScreenBounds().width).rounded()

        return Int(progress)
    }
}

// Extension of View to get screen bounds
extension View {
    func getScreenBounds() -> CGRect {
        return UIScreen.main.bounds
    }
}


struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding(firstRun: .constant(true))
        //            .preferredColorScheme(.dark)
    }
}
