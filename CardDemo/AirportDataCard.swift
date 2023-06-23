//
//  AirportDataCard.swift
//  CardDemo
//
//  Created by Ike Mattice on 5/19/23.
//

import SwiftUI

struct AirportDataCard: View {
    let isDarkMode: Bool
    
    var foregroundTextColor: Color {
        isDarkMode ? Color("Text/Dark") : Color("Text/Light")
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 9) {
            Text("Thursday, Dec 8".uppercased())
                .foregroundColor(foregroundTextColor)
                .font(.system(size: 13, weight: .semibold))
            
            VStack(alignment: .leading, spacing: 2)
            {
                Text("SEA")
                    .foregroundColor(foregroundTextColor)
                    .font(.system(size: 34, weight: .bold))
                
                HStack(spacing: 20)
                {
                    
                    HStack(spacing: 3)
                    {
                        Text("Gate")
                            .foregroundColor(foregroundTextColor)
                            .font(.system(size: 15, weight: .semibold))
                        Text("A12")
                            .foregroundColor(foregroundTextColor)
                            .font(.system(size: 15, weight: .semibold))
                    }
                    
                    HStack(spacing: 3)
                    {
                        Text("Spot")
                            .foregroundColor(foregroundTextColor)
                            .font(.system(size: 15, weight: .semibold))
                        Text("--")
                            .foregroundColor(foregroundTextColor)
                            .font(.system(size: 15, weight: .semibold))
                    }
                }
            }
            
            HStack(spacing: 14)
            {
                HStack(alignment: .center, spacing: 2)
                {
                    Text("9:45")
                        .foregroundColor(foregroundTextColor)
                        .font(.system(size: 22, weight: .bold))
                    Text("AM")
                        .foregroundColor(foregroundTextColor)
                        .font(.system(size: 15, weight: .semibold))
                        .padding(.top,5)
                }
                
                HStack(alignment: .center, spacing: 5)
                {
                    Text("17:05")
                        .foregroundColor(foregroundTextColor)
                        .font(.system(size: 22, weight: .bold))
                    Text("ZULU")
                        .foregroundColor(foregroundTextColor)
                        .font(.system(size: 15, weight: .semibold))
                        .padding(.top, 5)
                }
            }
            
            Text("NOW 9:15AM (10 MIN DELAY)")
                .foregroundColor(foregroundTextColor)
                .padding([.leading, .trailing], 8)
                .padding([.top, .bottom], 5)
                .background(Color.orange)
                .lineLimit(1)
                .font(.system(size: 13, weight: .bold))
                .cornerRadius(4)
        }
        .frame(maxWidth: .infinity, alignment: .leading)

//        .frame(maxWidth: .infinity)
//        .background(Color.yellow)
    }
}

struct AirportDataCard_Previews: PreviewProvider {
    static var previews: some View {
        AirportDataCard(isDarkMode: false)
    }
}
