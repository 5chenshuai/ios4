//: Playground - noun: a place where people can play
import UIKit
import Foundation



let time = Date()
func transformDate(date:Date,zone:Int = 0) -> String
{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy年MM月dd日EEEE aa hh:mm"
    if zone >= 0{
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC+\(zone):00")
    }else{
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC\(zone):00")
    }
    let dateTime = dateFormatter.string(from: date)
    return dateTime
}
let t1 = transformDate(date: time, zone: 8)
print(t1)
let t2 = transformDate(date: time, zone: 9)
print(t2)
let t3 = transformDate(date: time,zone: -5)
print(t3)
let t4 = transformDate(date: time)
print(t4)












var str = "Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS."

let indexstart = str.index(str.startIndex,offsetBy:5)

let indexend = str.index(str.startIndex,offsetBy:19)
print(str.substring(with: indexstart..<indexend))

let str1 = str.replacingOccurrences(of: "OS", with: "")

let fileManager = FileManager.default

if var docPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first{
    print("dcshh")
    docPath.appendPathComponent("test.txt")
    
    let dic = ["北京":t1,"东京":t2,"纽约":t3,"伦敦":t4,"字符串":str1] as AnyObject
    
    dic.write(toFile: docPath.path, atomically: true)
    
    
}



enum MyError:Error {
    case Zero
    case NotURL
}

guard let weatherUrl = URL(string: "http://www.weather.com.cn/data/cityinfo/101010100.html") else{
    throw MyError.NotURL
}
let jsondata = try! Data(contentsOf: weatherUrl)

let json = try! JSONSerialization.jsonObject(with: jsondata, options: .allowFragments)
guard let dic = json as? [String:Any] else{
    throw MyError.NotURL
}
guard let weather = dic["weatherinfo"] as? [String:String] else{
    throw MyError.NotURL
}

let temp1 = weather["temp1"]
let temp2 = weather["temp2"]

var url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!

let imageUrl = URL(string: "http://pic5.photophoto.cn/20071228/0034034901778224_b.jpg")!
let imageData = try? Data(contentsOf: imageUrl)
url.appendPathComponent("mypic.jpg")
try? imageData?.write(to: url)
let image = UIImage(data: imageData!)
print(url.path)















