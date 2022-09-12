// NDate+Extensions
//  Created by Holger Hinzberg on 27.03.16.
//  Copyright © 2016 Holger Hinzberg. All rights reserved.

import Foundation

public extension NSDate
{
    // Sample: NSDate(dateString:"2014-06-06")
    public convenience init(dateString:String)
    {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale?
        let d = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:d)
    }
    
    public static func from(year : Int, month : Int, day : Int) -> Date
    {
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        return calendar.date(from: dateComponents) ?? Date()
    }
}
