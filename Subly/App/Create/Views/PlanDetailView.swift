//
//  PlanDetailView.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 31.03.2026.
//

import SwiftUI

struct PlanDetailView: View {
    @Binding var servicesPayment: String
    @Binding var selectedCurrency: String
    @Binding var selectedCycle: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("PLAN DETAIL")
                .foregroundStyle(Color(Colors.gray600))
                .font(.system(size: 16, weight: .semibold))
            
            VStack(alignment: .leading, spacing: 20){
                Text("\(selectedCycle) Cost")
                    .foregroundStyle(Color(Colors.secondary700))
                    .font(.system(size: 16, weight: .semibold))
                HStack(alignment: .firstTextBaseline, spacing: 4){
                    Text(selectedCurrency)
                        .foregroundStyle(Color(Colors.secondary500))
                        .font(.system(size: 16, weight: .bold))
                    TextField("0.00", text: $servicesPayment, prompt:
                                Text("0.00")
                        .foregroundStyle(Color(Colors.gray300))
                        .font(.system(size: 16, weight: .semibold))
                    )
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(Color(Colors.white))
                    .keyboardType(.decimalPad)
                    Spacer()
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white.opacity(0.04))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.white.opacity(0.08), lineWidth: 1)
            )
            
            HStack {
                Image(systemName: "banknote")
                    .resizable()
                    .foregroundStyle(Color(Colors.secondary500))
                    .frame(width: 20, height: 16)
                
                Text("Currency")
                    .foregroundStyle(Color(Colors.white))
                    .font(.system(size: 16, weight: .semibold))
                Spacer()
                Menu{
                    Button("USD") { selectedCurrency = "$" }
                    Button("TRY") { selectedCurrency = "₺" }
                    Button("EUR") { selectedCurrency = "€" }
                } label: {
                    HStack(spacing: 4) {
                        Text(selectedCurrency)
                        Image(systemName: "chevron.down")
                            .resizable()
                            .frame(width: 10, height: 6)
                    }
                    .foregroundStyle(Color(uiColor: Colors.secondary500))
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white.opacity(0.04))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.white.opacity(0.08), lineWidth: 1)
            )
            
            
            HStack {
                Image(systemName: "arrow.triangle.2.circlepath")
                    .resizable()
                    .foregroundStyle(Color(Colors.secondary500))
                    .frame(width: 20, height: 16)
                
                Text("Cycle")
                    .foregroundStyle(Color(Colors.white))
                    .font(.system(size: 16, weight: .semibold))
                Spacer()
                Menu{
                    Button("Weekly") { selectedCycle = "Weekly" }
                    Button("Monthly") { selectedCycle = "Monthly" }
                    Button("Yearly") { selectedCycle = "Yearly" }
                } label: {
                    HStack(spacing: 4) {
                        Text(selectedCycle)
                        Image(systemName: "chevron.down")
                            .resizable()
                            .frame(width: 10, height: 6)
                    }
                    .foregroundStyle(Color(uiColor: Colors.secondary500))
                }
            }
            .padding(.all, 12)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white.opacity(0.04))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.white.opacity(0.08), lineWidth: 1)
            )
            
        }
    }
}

#Preview {
    PlanDetailView(servicesPayment: .constant("Text"), selectedCurrency: .constant("$"), selectedCycle: .constant("Yearly"))
}
