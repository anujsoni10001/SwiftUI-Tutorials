//
//  ContentView.swift
//  SwiftUI-Tutorials
//
//  Created by Anuj Soni on 09/03/22
import SwiftUI

extension Image{

func ImageModifier() -> some View{
        self.resizable()
        .scaledToFit()
}
    
func IconModifier() -> some View{
    self.ImageModifier()
    .frame(maxWidth:128)
    .foregroundColor(.purple)
    .opacity(0.5)
}
    
}

struct ContentView: View {

private let imageURL = "https://credo.academy/credo-academy@3x.png"

var body: some View {
    
// MARK: - 1 Basics
//AsyncImage(url:URL(string:imageURL))
    
// MARK: - 2 Scale
//AsyncImage(url: URL(string:imageURL), scale: 3)

// MARK: - 3 Placeholder
//
//    AsyncImage(url:URL(string:imageURL)){image in
//    image.ImageModifier()
//    } placeholder: {
//        Image(systemName:"photo.circle.fill")
//        .IconModifier()
//    }.padding(40)
//}
    
// MARK: - 4 Phase

//    AsyncImage(url:URL(string:imageURL)) {phase in
//    switch phase{
//    case .success(let image) : image.ImageModifier()
//    // No Image is Loaded
//    case .empty : Image(systemName:"ant.circle.fill").IconModifier()
//    //Image failed to load with an error
//    case .failure(_): Image(systemName:"photo.circle.fill").IconModifier()
//    @unknown default: ProgressView()
//
//    }
//}.padding(40)

// MARK: - 5 Animation
//
    AsyncImage(url:URL(string:imageURL),transaction: Transaction(animation:.spring(response:0.5, dampingFraction: 0.6, blendDuration: 0.25)))  {phase in
    switch phase{
    case .success(let image) : image.ImageModifier()
//        .transition(.move(edge:.trailing)) //offset
        //.transition(.slide) //offset
            .transition(.scale) //scaling
        // No Image is Loaded
        case .empty : Image(systemName:"photo.circle.fill").IconModifier()
        //Image failed to load with an error
        case .failure(_): Image(systemName:"ant.circle.fill").IconModifier()
        @unknown default: ProgressView()

        }
    }.padding(40)

}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}







