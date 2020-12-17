//
//  MissionView.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/14.
//

import SwiftUI

struct MissionView: View {
    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let astronauts: [CrewMember]
    
    let mission: Mission
    
    init(mission: Mission, astronauts: [Astronaut]) {
        self.mission = mission

        var matches = [CrewMember]()

        for member in mission.crew {
            if let match = astronauts.first(where: { $0.id == member.name }) {
                matches.append(CrewMember(role: member.role, astronaut: match))
            } else {
                fatalError("Missing \(member)")
            }
        }

        self.astronauts = matches
    }
    
    var body: some View {
        
        //GeometryReader来获取精确的尺寸以充分利用我们的空间
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.7)
                        .padding(.top)
                    
                    Text("Mission time: \(self.mission.formattedLaunchDate)")
                        .font(.headline)
                        .padding()
                    
                    Text(self.mission.description)
                        .padding()
                    
                    Spacer(minLength: 25)
                    
                    ForEach(self.astronauts, id: \.role) { crewMember in
                        NavigationLink(destination: ChallengeAstronautView(astronaut: crewMember.astronaut)) {
                            HStack {
                                Image(crewMember.astronaut.id)
                                    .resizable()
                                    .frame(width: 83, height: 60)
                                    .clipShape(Capsule())
                                    .overlay(Capsule().stroke(Color.primary, lineWidth: 1))

                                VStack(alignment: .leading) {
                                    Text(crewMember.astronaut.name)
                                        .font(.headline)
                                    Text(crewMember.role)
                                        .foregroundColor(.secondary)
                                }

                                Spacer()
                            }.padding(.horizontal)
                            
                        //让SwiftUI将导航链接的内容呈现为一个普通按钮，不对图像或文本应用颜色
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
        .navigationBarTitle(Text(mission.displayName), displayMode: .inline)
    }
}

struct MissionView_Previews: PreviewProvider {
    
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions.randomElement()!,astronauts: astronauts)
    }
}
