//
//  MessageBody.swift
//  StudetnLocation
//
//  Created by alexey sorochan on 04.01.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation
import UIKit

class EmailMessageBodyText {
    func emailMessageBodyText(_ latitude: Double,_ longitude: Double) -> String{
        let oldmessage = """
        <html>
          <head>
            <title>Simple Map</title>
          </head>
          <body>
            <iframe width="600" height="500" id="gmap_canvas" src="https://maps.google.com/maps?q=\(latitude)%2C%20\(longitude)&t=&z=18&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
          </body>
        </html>
        """
        
        let message = """
            ios перестало поддерживать  iframe((((
        
        """
        return message
    }
}

