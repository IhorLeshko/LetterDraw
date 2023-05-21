//
//  ColorPickerView.swift
//  LetterDraw
//
//  Created by Ihor on 30.08.2022.
//

import SwiftUI

struct ColorPickerForDrawingColorView: View {
    
    let colors = [Color.red, Color.orange, Color.yellow, Color.green, Color.blue, Color.purple]
    @Binding var selectedColorForSideMenu: Color
    @Binding var colorToDrawindLine: Color
    @Binding var hideSideSheet: Bool
    
    var body: some View {
        VStack {
            ForEach(colors, id: \.self) { color in
                Image(systemName: selectedColorForSideMenu == color ? Constants.Icons.recordCircleFill : Constants.Icons.circleFill)
                    .foregroundColor(color)
                    .font(.system(size: 48))
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedColorForSideMenu = color
                        colorToDrawindLine = selectedColorForSideMenu
                        hideSideSheet.toggle()
                    }
            }
        }
    }}

struct ColorListView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerForDrawingColorView(selectedColorForSideMenu: .constant(.blue), colorToDrawindLine: .constant(.blue), hideSideSheet: .constant(false))
    }
}
