//
//  APICallDemo.swift
//  SwiftUIDemos
//
//  Created by mukesh on 26/05/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import SwiftUI

struct APICallDemo: View {
    
    @ObservedObject var networkingManager = NetworkingManager()
    
    var body: some View {
        List(networkingManager.dataList.features, id: \.properties) { data in
            
            NavigationLink(destination: QuakeDetails(data: data)) {
                CellRow(data: data)
                
            }.navigationBarTitle("Quakes")
            
        }
    }
}



/*
 Wednesday, Sep 12, 2018           --> EEEE, MMM d, yyyy
 09/12/2018                        --> MM/dd/yyyy
 09-12-2018 14:11                  --> MM-dd-yyyy HH:mm
 Sep 12, 2:11 PM                   --> MMM d, h:mm a
 September 2018                    --> MMMM yyyy
 Sep 12, 2018                      --> MMM d, yyyy
 Wed, 12 Sep 2018 14:11:54 +0000   --> E, d MMM yyyy HH:mm:ss Z
 2018-09-12T14:11:54+0000          --> yyyy-MM-dd'T'HH:mm:ssZ
 12.09.18                          --> dd.MM.yy
 10:41:02.112                      --> HH:mm:ss.SSS
 */

func timeConverter(timeStamp: Double) -> String {
    
    let unixTimestamp = timeStamp / 1000 // so we can get milliseconds!
    
    let date = Date(timeIntervalSince1970: unixTimestamp)
    
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
    
    dateFormatter.locale = NSLocale.current
    dateFormatter.dateFormat = "dd MMM YY, hh:mm a"
    
    return dateFormatter.string(from: date)
    
    
}

struct APICallDemo_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

