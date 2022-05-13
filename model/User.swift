import Foundation

class User{
    
    private let userName:String;
    private let email:String;
    private var password:String="";
    
    public init(userName:String, email:String, password:String){
        self.userName = userName;
        self.email = email;
        self.password = password;
    }
    
    public func getUserName() -> String{
        return self.userName
    }
    
    public func getEmail() -> String{
        return self.email
    }
    
    public func getPassword() -> String{
        return self.password
    }
    
    public func setPassword(pass:String){
        self.password = pass
    }
    
    
}
