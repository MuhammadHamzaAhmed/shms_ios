
import Foundation

class Database{
    private static let SERVER="mysql-78213-0.cloudclusters.net";
    private static let PORT = 19493;
    private static let DBNAME = "shms";
    private static let USERNAME = "admin";
    private static let PASSWORD = "BAuupcgf";
    private static var url="";
    
    private static var db=Database();
    
    private let con:MySQL.Connection;
    
    private init() {
        con = MySQL.Connection()
        do{
            con.port = Database.PORT
            try con.open(Database.SERVER + ":", user: Database.USERNAME,passwd: Database.PASSWORD, dbname: Database.DBNAME)
        }catch(_){}
    }
    
    public static func getDatabase() -> Database {
        return db;
    }
    
    public func getConnection() -> MySQL.Connection{
        return con;
    }
}
