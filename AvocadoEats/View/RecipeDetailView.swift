//
//  RecipeDetailView.swift
//  AvocadoEats
//
//  Created by adam janusewski on 5/13/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    
    @State private var pulsate: Bool = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                
                Group {
                    // TITLE
                    Text(recipe.title)
                        .font(.system(.largeTitle, design: .serif))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("ColorGreenAdapt"))
                        .padding(.top, 10)
                    
                    // RATING
                    RecipeRatingView(recipe:recipe)
                    
                    // COOKING
                    RecipeCookingView(recipe: recipe)
                    
                    // INGREDIENTS
                    Text("Ingredients".uppercased())
                        .fontWeight(.bold)
                        .modifier(titleModifier())
                    
                    VStack(alignment: .leading, spacing: 5) {
                        ForEach(recipe.ingredients, id: \.self) { item in
                            VStack(alignment: .leading, spacing: 5) {
                                Text(item)
                                    .font(.footnote)
                                    .multilineTextAlignment(.leading)
                                Divider()
                            }
                        }
                    }
                    
                    // INSTRUCTIONS
                    Text("Instructions".uppercased())
                        .fontWeight(.bold)
                        .modifier(titleModifier())
                    
                    ForEach(recipe.instructions, id: \.self) { item in
                        VStack(alignment: .center, spacing: 5) {
                            // Chevron image and modifiers
                            Image(systemName: "chevron.down.circle")
                                .resizable()
                                .frame(width: 42, height: 42, alignment: .center)
                                .imageScale(.large)
                                .font(Font.title.weight(.ultraLight))
                                .foregroundColor(Color("ColorGreenAdapt"))
                            
                            // Each Step for the Recipe
                            Text(item)
                                .lineLimit(nil)
                                .multilineTextAlignment(.center)
                                .font(.system(.body, design: .serif))
                                .frame(minHeight: 100)
                        }
                    }
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
            }
        }
        .edgesIgnoringSafeArea(.top)
        .overlay(
            HStack {
                Spacer()
                VStack {
                    
                    Button(action: {
                        // ACTION NEEDED!!!!!!!!!!!!!!
                    }, label: {
                        Image(systemName: "chevron.down.circle.fill")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .shadow(color: Color(red: 0, green: 0, blue: 0), radius: 10, x: 8, y: 8)
                            .opacity(self.pulsate ? 1 : 0.6)
                            .scaleEffect(self.pulsate ? 1.2 : 0.8, anchor: .center)
                            .animation(Animation.easeOut(duration: 1.5).repeatForever(autoreverses: true), value: pulsate)
                })
                    .padding(.trailing, 20)
                    .padding(.top, 24)
                    Spacer()
                }
            }
        )
        .onAppear() {
            self.pulsate.toggle()
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: recipesData[0])
    }
}
