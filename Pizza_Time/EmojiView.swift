//
//  EmojiView.swift
//  Pizza_Time
//
//  Created by Matthew Zahar on 4/17/20.
//  Copyright © 2020 mzahar. All rights reserved.
//

import SwiftUI

struct EmojiView: View {
    let rating: Int16
    var body: some View {
        switch rating {
        case 1:
            return Text("🤮")
        case 2:
            return Text("🙁")
        case 3:
            return Text("😐")
        case 4:
            return Text("🙂")
        default :
            return Text("🤩")
        }
    }
}

struct EmojiView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiView(rating: 3)
    }
}
