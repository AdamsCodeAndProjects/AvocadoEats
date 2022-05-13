//
//  FactsView.swift
//  AvocadoEats
//
//  Created by adam janusewski on 5/12/22.
//

import SwiftUI

struct FactsView: View {
    
    
    // Needed to store multiple facts and photos in same design
    var fact: Fact
    
    var body: some View {
        ZStack {
            // Text
            Text(fact.content)  // changed from set text to variable texts
                .padding(.leading, 55)
                .padding(.trailing, 10)
                .padding(.vertical, 3)
                .frame(width: 300, height: 135, alignment: .center)
                .background(LinearGradient(gradient: Gradient(colors: [Color("ColorGreenMedium"), Color("ColorGreenLight")]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(12)
                .lineLimit(6)
                .multilineTextAlignment(.leading)
                .font(.footnote)
                .foregroundColor(Color.white)
            
            // Image
            Image(fact.image)  // changed from set image to variable images
                .resizable()
                .frame(width: 66, height: 66, alignment: .center)
                .clipShape(Circle())
            
            // Image styling of circles underneath
                .background(
                    Circle()
                        .fill(Color.white)
                        .frame(width: 74, height: 74, alignment: .center)
                )
                .background(
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color("ColorGreenMedium"), Color("ColorGreenLight")]), startPoint: .trailing, endPoint: .leading))
                        .frame(width: 82, height: 82, alignment: .center)
                )
                .background(
                    Circle()
                        .fill(Color("ColorAppearanceAdapt"))
                        .frame(width: 90, height: 90, alignment: .center)
                    )
                .offset(x: -150)
        }
        
    }
}

struct FactsView_Previews: PreviewProvider {
    static var previews: some View {
        FactsView(fact: factsData[0])
            .previewLayout(.fixed(width: 400, height: 220))
    }
}
