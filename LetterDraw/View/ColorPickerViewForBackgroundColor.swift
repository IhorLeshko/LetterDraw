//
//  ColorPickerViewForSideMenu.swift
//  LetterDraw
//
//  Created by Ihor on 30.08.2022.
//

import SwiftUI

struct ColorPickerViewForBackgroundColor: View {
    
    let colors = [Color.red, Color.orange, Color.yellow, Color.green, Color.blue, Color.purple]
    @Binding var selectedColorForSideMenu: Color
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
                        hideSideSheet.toggle()
                    }
            }
        }
    }
}

struct ColorPickerViewForSideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerViewForBackgroundColor(selectedColorForSideMenu: .constant(.blue), hideSideSheet: .constant(false))
    }
}
