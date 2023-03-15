//
//  PurchaseView.swift
//  PizzaMaker
//
//  Created by Daniel Jilg on 15.03.23.
//

import SwiftUI

struct PurchaseView: View {
    @AppStorage("isPurchased") private var isPurchased = false
    
    var body: some View {
        VStack {
            if isPurchased {
                VStack {
                    Text("Thank you so much 🍕")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding()
                    
                    Text("You are now subscribed to Pizza Maker Pro, with all its glorious features such as TBA, TBD, and TBC!")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    
                
                Text("Return to the settings to continue your pizza journey.")
                        .font(.footnote)
                    .multilineTextAlignment(.center)
                    .padding()
                    
                    Spacer()
                }
            }
            
            else {
                Text("Upgrade to Pro version")
                    .font(.title)
                    .padding()
                
                Text("Choose a pricing option:")
                    .font(.headline)
                    .padding()
                
                PricingOptionView(price: "$4.99", duration: "1 month")
                PricingOptionView(price: "$9.99", duration: "6 months")
                PricingOptionView(price: "$19.99", duration: "1 year")
                
                Spacer()
            }
        }
    }
}

struct PricingOptionView: View {
    @AppStorage("isPurchased") private var isPurchased = false
    
    let price: String
    let duration: String
    
    var body: some View {
        Button.init {
            isPurchased = true
        } label: {
            VStack {
                Text(price)
                    .font(.title)
                Text(duration)
                    .font(.subheadline)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .padding(.horizontal)
        }
    }
}

struct PurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseView()
    }
}
