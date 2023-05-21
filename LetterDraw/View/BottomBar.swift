//
//  BottomBar.swift
//  LetterDraw
//
//  Created by Ihor on 30.08.2022.
//

import SwiftUI

struct BottomBar: View {
    @EnvironmentObject var homeData: HomeModel
    @Binding var showSheet: Bool
    @Binding var showSideSheet: Bool
    @Binding var backgroundColorToIcon: Color
    @Binding var drawingColorToIcon: Color
    
    var body: some View {
        HStack(spacing: 20) {
            Button {
                homeData.prevLetterOrNumber()
            } label: {
                Image(systemName: "arrow.left")
                    .font(.system(size: 25))
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color("ButtonColor"))
            }
            Button {
                showSheet.toggle()
            } label: {
                Image(systemName: "paintpalette")
                    .font(.system(size: 25))
                    .frame(width: 30, height: 30)
                    .foregroundColor(drawingColorToIcon)
            }
            Button {showSideSheet.toggle()} label: {
                Image(systemName: "paintbrush.fill")
                    .foregroundColor(backgroundColorToIcon)
                    .font(.system(size: 20))
                    .padding(7)
            }
            Button {
                homeData.lines = []
            } label: {
                Image(systemName: "rectangle.dashed")
                    .font(.system(size: 25))
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color("ButtonColor"))
            }
            Button {
                homeData.change()
            } label: {
                Image(systemName: homeData.letterOrNumberSwitch ? "textformat.123" : "character")
                    .font(.system(size: 25))
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color("ButtonColor"))
            }
            Button {
                homeData.nextLetterOrNumber()
            } label: {
                Image(systemName: "arrow.right")
                    .font(.system(size: 25))
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color("ButtonColor"))
            }
        }
        .padding(.horizontal)
        .background(Color("PaletteColor"))
        .cornerRadius(15)
        .shadow(radius: 10)
        .shadow(radius: 10)
    }
}
