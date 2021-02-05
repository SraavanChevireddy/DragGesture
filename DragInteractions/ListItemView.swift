//
//  ListItemView.swift
//  DragInteractions
//
//  Created by Sraavan Chevireddy on 2/6/21.
//

import SwiftUI

struct ListItemView: View {
    @State var offset : CGSize = .zero
    
    var body: some View {
        VStack{
            HStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.pink)
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading){
                    Text("Master title")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Branched title")
                        .foregroundColor(.secondary)
                        .font(.callout)
                }.frame(width: .infinity,alignment: .center)
                Spacer()
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.pink)
                    .frame(width: 50, height: 50)
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.pink)
                    .frame(width: 50, height: 50)
                
            }
        }.frame(width: .infinity)
        .offset(x: offset.width)
        .onTapGesture {
            if offset != .zero{
                offset = .zero
            }else{
                print("Action items")
            }
        }
        .gesture(
            DragGesture(minimumDistance: 10)
                .onChanged({ (value) in
                    print(offset.width)
                    if offset.width > 0{}
//                    if offset.width < 100{
//                        offset = value.translation
//                    }else if offset.width < 0{
//                        offset = value.translation
//                    }
                })
                .onEnded({ (value) in
                    print("Ended")
                    if value.translation.width > 100{
                        offset = .zero
                    }
                })
        )
        .animation(.default)
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView()
    }
}
