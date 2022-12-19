//
//  NetworkService.swift
//  DesignPattern
//
//  Created by Furkan Ademoğlu on 19.12.2022.
//

import Foundation

final class NetworkService{
    static let shared = NetworkService()
    
    var user:User?
    
    private init(){
        
    }
    
    func login(email:String,password:String,completion:@escaping(Bool) -> Void){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){ [weak self] in
            if email == "test@test.com" && password=="password"{
                self?.user = User(firstName: "Furrkan", lastName: "dmgl", email: "test@test.com", age: 25)
                completion(true)
            }else{
                self?.user = nil
                completion(false)
            }
        }
        
    }
}
