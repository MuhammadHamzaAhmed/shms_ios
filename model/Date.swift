import Foundation

class DateData{

    public static func getDatabaseDate(year : Int, mon : Int, day : Int) -> String{
        var m = String(mon);
        if(m.count == 1){
            m = "0"+m;
        }
        var d = ""+String(day);
        if(d.count == 1){
            d = "0"+d;
        }
        return ""+String(year)+"-"+m+"-"+d;
    }
}
