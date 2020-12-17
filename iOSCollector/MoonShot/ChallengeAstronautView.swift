//
//  ChallengeAstronautView.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/16.
//

import SwiftUI

struct ChallengeAstronautView: View {
    let astronaut: Astronaut
    
    private let allMissions: [Mission] = Bundle.main.decode("missions.json")
    
    private func getAttendMissions(_ missions:[Mission]) -> [Mission] {
        var attendMission = [Mission]()
        
        for mission in missions {
            for item in mission.crew {
                if item.name == self.astronaut.id {
                    attendMission.append(mission)
                }
            }
        }
        return attendMission
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    VStack {
                        Image(self.astronaut.id)
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width)

            
                        Text(self.astronaut.description)
                            .padding()
                            .layoutPriority(1)
                
                    }
                    
                    Spacer()
                    
                    ForEach(getAttendMissions(self.allMissions),id:\.id) { mission in
                        HStack(alignment: .bottom){
                            Image(mission.image)
                                .resizable()
                                //这将自动导致图像按比例缩放以填充其容器，在本例中为44x44。
                                .scaledToFit()
                                .frame(width:44,height:44)
                            
                            VStack(alignment: .leading) {
                                Text(mission.displayName)
                                    .font(.headline)
                                Text(mission.formattedLaunchDate)
                            }
                            Spacer()
                        }
                        .padding()
                    }
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}

struct ChallengeAstronautView_Previews: PreviewProvider {
    
    private static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    private static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        NavigationView {
            ChallengeAstronautView(astronaut: astronauts.randomElement()!)
        }
    }
}
