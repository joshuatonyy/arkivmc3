//
//  MapView.swift
//  arkivmc3
//
//  Created by Joshua on 25/08/23.
//

import SwiftUI

struct MapView: View {
    @State private var location: CGPoint = CGPoint(x: 0, y: 0)
    @GestureState private var fingerLocation: CGPoint? = nil
    @GestureState private var startLocation: CGPoint? = nil

    let screenSize = UIScreen.main.bounds.size

    var simpleDrag: some Gesture {
        DragGesture()
            .onChanged { value in
                let translation = value.translation
                var newLocation = startLocation ?? location
                newLocation.x += translation.width
                newLocation.y += translation.height

//                // Ensure the image doesn't move outside the screen bounds
//                newLocation.x = max(0, min(newLocation.x, screenSize.width))
//                newLocation.y = max(0, min(newLocation.y, screenSize.height))

                self.location = newLocation
            }
            .updating($startLocation) { (value, startLocation, transaction) in
                startLocation = startLocation ?? location
            }
    }

    var fingerDrag: some Gesture {
        DragGesture()
            .updating($fingerLocation) { (value, fingerLocation, transaction) in
                fingerLocation = value.location
            }
    }
    
    @State var scale = 0.5
    @State var lastScale = 1.0
    private let minScale = 0.4
    private let maxScale = 5.0
    @State private var showingSheet = false
    @State private var daerahPilih = 0
    
    var magnification: some Gesture{
        MagnificationGesture()
            .onChanged{ state in
                adjustScale(from: state)
            }
            .onEnded{ state in
                validateScaleLimits()
                lastScale = 1.0
            }
    }

    var body: some View {
        ZStack {
            Image("Map01")
                .position(location)
                .scaleEffect(scale)
            Rectangle()
                .fill(Color.white.opacity(0.001))
                .frame(width: 155, height: 155)
                .offset(x: -1400, y: -180)
                .position(location)
                .scaleEffect(scale)
                .onTapGesture {
                    if showingSheet == false {
                        daerahPilih = 1
                        showingSheet = true
                    }
                }
            Rectangle()
                .fill(Color.white.opacity(0.001))
                .frame(width: 230, height: 190)
                .offset(x: 1180, y: -180)
                .position(location)
                .scaleEffect(scale)
                .onTapGesture {
                    if showingSheet == false {
                        daerahPilih = 3
                        showingSheet = true
                    }
                }
        }
        .gesture(
            simpleDrag.simultaneously(with: magnification)
        )
        .onAppear {
            location = CGPoint(x: screenSize.width / 2, y: screenSize.height / 2)
        }
        .sheet(isPresented: $showingSheet){
            if daerahPilih == 1 {
                ModalView(namaDaerah: "Meruya Selatan", namaDaerah2: "Kembangan, Jakbar", hargaTanah: "6,9 juta")
            }
            else if daerahPilih == 3{
                ModalView(namaDaerah: "Pulo Gebang", namaDaerah2: "Cakung, Jaktim", hargaTanah: "5,1 juta")
            }
        }
    }
    
    func adjustScale(from state: MagnificationGesture.Value){
        let delta = state / lastScale
        scale *= delta
        lastScale = state
    }
    
    func getMinimumScaleAllowed() -> CGFloat {
        return max(scale, minScale)
    }
    func getMaximumScaleAllowed() -> CGFloat{
        return min(scale, maxScale)
    }
    func validateScaleLimits() {
        scale = getMinimumScaleAllowed()
        scale = getMaximumScaleAllowed()
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
