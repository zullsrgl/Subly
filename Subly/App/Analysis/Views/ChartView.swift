//
//  ChartView.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 1.04.2026.
//

import SwiftUI
import Charts

struct ChartView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("MONTHLY SPENDING")
                .font(.system(size: 14, weight: .bold))
                .foregroundStyle(.gray.opacity(0.8))
            
            HStack(alignment: .firstTextBaseline){
                Text("$")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(Color(Colors.white))
                
                Text("2,324")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundStyle(Color(Colors.white))
            }
            
            HStack {
                Image(systemName: "arrow.up")
                    .resizable()
                    .foregroundStyle(Color(Colors.secondary500))
                    .frame(width: 10, height: 10)
                
                Text("$10 vs last monht")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(Color(Colors.secondary500))
            }
            .padding(.all, 6)
            .background(RoundedRectangle(cornerRadius: 12)
                .fill(Color(Colors.gray100).opacity(0.5)))
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(Colors.gray700), lineWidth: 1))
            
            Chart {
                SectorMark(angle: .value("Type", 40),
                           innerRadius: .ratio(0.8),
                           angularInset: 2)
                .foregroundStyle(Color(uiColor: Colors.secondary500))
                .cornerRadius(5)
                
                SectorMark(
                    angle: .value("Type", 60),
                    innerRadius: .ratio(0.8)
                )
                .foregroundStyle(.gray.opacity(0.3))
                
            }
            .frame(height: 200)
            .chartBackground { proxy in
                VStack {
                    Text("Top Category").font(.caption).foregroundStyle(.gray)
                    Text("40%").font(.headline).bold()
                }
            }
            
        }
    }
}

#Preview {
    ChartView()
}
