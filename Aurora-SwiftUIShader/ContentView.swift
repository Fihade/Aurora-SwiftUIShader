//
//  ContentView.swift
//  Aurora-SwiftUIShader
//
//  Created by fihade on 6/19/23.
//

import SwiftUI

struct ContentView: View {
    
    let start = Date()
    
    var body: some View {
        TimelineView(.animation) { context in
            RoundedRectangle(cornerRadius: 0)
                .aurora(seconds: context.date.timeIntervalSince1970 - self.start.timeIntervalSince1970)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}

extension View {
    func aurora(seconds: Double) -> some View {
        let function = ShaderFunction(
            library: .default,
            name: "aurora"
        )
        let shader = Shader(function: function, arguments: [.boundingRect, .float(seconds)])
        return self.colorEffect(shader, isEnabled: true)
    }
}
