//
//  ContentView.swift
//  Memorize
//
//  Created by Mason Francis on 1/14/22.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["💩", "🌚", "🔥", "🍕", "😡", "🦨", "🦀", "🐼", "🎫", "🌮", "🌶", "💋", "👻", "🥺", "😍", "🚢", "😤", "😱", "🥸", "🤘", "✈️", "🌪", "🍎", "🚗"]
    
    let faceEmojis = ["😀", "😅", "😂", "🥲", "😇", "😉", "😍", "🥰", "😘", "😜", "🤓", "😎", "🥸", "🤩", "🥳", "😔", "☹️", "😫", "🥺", "😡"]
    
    let transportationEmojis = ["🚗", "🚕", "🚎", "🚑", "🛻", "🚜", "🛴", "🚲", "🛵", "🏍", "🚠", "🚃", "✈️", "🚀", "🚁", "⛵️", "🚢", "🛶", "🛸", "🦼"]
    
    let foodEmojis = ["🍎", "🍊", "🍋", "🍌", "🥥", "🌶", "🥕", "🥨", "🧀", "🥓", "🧇", "🥩", "🍔", "🍟", "🍕", "🌮", "🍝", "🍤", "🍭", "🍿"]
    
    @State var emojiCount = 20
        
    var body: some View {
        
        
        VStack {
            Text("Memorize!").font(.largeTitle)

            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }

                }
            }
            
            .foregroundColor(.red)
            Spacer()
            HStack {
                faces
                Spacer()
                transportation
                Spacer()
                food
            }
            .font(.largeTitle)
            .padding(.horizontal)
            
        }
            
            .padding(.horizontal)
        
        
    }
    
    var faces: some View {
        Button(action: {
            emojis = faceEmojis.shuffled()
        }, label: {
            VStack{
                Image(systemName: "face.smiling").font(.largeTitle)
                Text("Faces").font(.title3)
            }
        })
    }
    
    var transportation: some View {
        Button(action: {
            emojis = transportationEmojis.shuffled()
        }, label: {
            VStack{
                Image(systemName: "tram").font(.largeTitle)
                Text("Transportation").font(.title3)
            }
        })
    }
    
    var food: some View {
        Button(action: {
            emojis = foodEmojis.shuffled()
        }, label: {
            VStack{
                Image(systemName: "mouth").font(.largeTitle)
                Text("Food").font(.title3)
            }
        })
    }
}

struct CardView: View{
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape
                    .fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 20)
                    .fill()
            }
            
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark).previewInterfaceOrientation(.portraitUpsideDown)
        ContentView().preferredColorScheme(.light)
    }
}
