//
//  ChallengeMoonshot.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/16.
//

import SwiftUI

struct ChallengeMoonshot: View {
    
    private let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    private let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
                    Image(mission.image)
                        .resizable()
                        //这将自动导致图像按比例缩放以填充其容器，在本例中为44x44。
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        Text(mission.formattedLaunchDate)
                    }
                }
            }
            .navigationBarTitle("Moonshot")
        }
    }
}

struct ChallengeMoonshot_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeMoonshot()
    }
}
