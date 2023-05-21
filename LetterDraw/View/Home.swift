//
//  Home.swift
//  LetterDraw
//
//  Created by Ihor on 30.08.2022.
//

import SwiftUI

struct Line {
    var points = [CGPoint]()
    var color: Color = .red
    var lineWidth: Double = 16.0
}

struct Home: View {
    @StateObject var homeData = HomeModel()
    @State private var showMenuForDrawingColor: Bool = false
    @State private var showMenuForBackgroundColor: Bool = false
    
    @State private var currentLine = Line()
    @State private var thickness: Double = 16.0
    @State private var selectedColor: Color = .red
    @State private var selectedColorForBackground: Color = .orange
    
    
    var body: some View {
        ZStack() {

            RadialGradient(gradient: Gradient(colors: [selectedColorForBackground, Color("PaletteColor")]), center: .center, startRadius: 55, endRadius: 700)
            
            VStack(spacing: 10) {
                
                ZStack {
                    GeometryReader{g in
                        
                        StrokeText(text: homeData.letterOrNumberSwitch ? homeData.letters[homeData.letterIndx] : homeData.numbers[homeData.numberIndx], width: 0.7, color: selectedColorForBackground)
                            .foregroundColor(Color("PaletteColor"))
                            .font(.system(size: g.size.height > g.size.width ? g.size.width * 1.0: g.size.height * 1.0))
                            .position(x: g.frame(in: .local).midX, y: g.frame(in: .local).midY)
                        
                        
                        Canvas { context, size in
                            
                            for line in homeData.lines {
                                var path = Path()
                                path.addLines(line.points)
                                context.stroke(path, with: .color(line.color), style: StrokeStyle(lineWidth: line.lineWidth, lineCap: .round))
                            }
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.size.width - 50, height: UIScreen.main.bounds.size.height - 170, alignment: .center)
                .gesture(
                    DragGesture(minimumDistance: 0, coordinateSpace: .local)
                        .onChanged({ value in
                            let newPoint = value.location
                            currentLine.points.append(newPoint)
                            self.homeData.lines.append(currentLine)
                        })
                        .onEnded({ value in
                            self.homeData.lines.append(currentLine)
                            self.currentLine = Line(points: [], color: currentLine.color, lineWidth: thickness)
                        })
                )
                .background(Color("PaletteColor"))
                .cornerRadius(15)
                .shadow(radius: 10)
                .shadow(radius: 10)
                
                
                //MARK: - BottomBar
                BottomBar(showSheet: $showMenuForDrawingColor, showSideSheet: $showMenuForBackgroundColor, backgroundColorToIcon: $selectedColorForBackground, drawingColorToIcon: $selectedColor)
                    .environmentObject(homeData)
            }
            .padding(.top)

            
            //MARK: - Side Menu for Selecting Drawing Color
            VStack {
                HStack {
                    ColorPickerForDrawingColorView(selectedColorForSideMenu: $selectedColor, colorToDrawindLine: $currentLine.color, hideSideSheet: $showMenuForDrawingColor)
                    Spacer()
                }
                Spacer()
            }
            .padding(.top, 120)
            .offset(x: showMenuForDrawingColor ? 0 : -60)
            .animation(.spring(), value: showMenuForDrawingColor)
            
            //MARK: - Side Menu for Selecting Background Color
            VStack {
                HStack {
                    Spacer()
                    ColorPickerViewForBackgroundColor(selectedColorForSideMenu: $selectedColorForBackground, hideSideSheet: $showMenuForBackgroundColor)
                }
                Spacer()
            }
            .padding(.top, 120)
            .offset(x: showMenuForBackgroundColor ? 0 : 60)
            .animation(.spring(), value: showMenuForBackgroundColor)
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .preferredColorScheme(.dark)
        
    }
}
