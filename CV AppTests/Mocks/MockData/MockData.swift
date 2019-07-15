
import Foundation
@testable import CV_App

class MockData {
    func getBasicInformationData() -> Data? {
        let bundle = Bundle(for: type(of: self))
        
        guard let path = bundle.path(forResource: "basicInformation", ofType: "json") else {
            return nil
        }
        
        let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
        
        return data
    }
    
    func getInvalidInformationData() -> Data? {
        let bundle = Bundle(for: type(of: self))
        
        guard let path = bundle.path(forResource: "failBasicInformation", ofType: "json") else {
            return nil
        }
        
        let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
        
        return data
    }
    
    func getUserInformation(data: Data) -> UserInfo? {
        let model = try? JSONDecoder().decode(UserInfo.self, from: data)
        return model
    }
    
    func getCareerInformation(data: Data) -> MyCareer? {
        let model = try? JSONDecoder().decode(MyCareer.self, from: data)
        return model
    }
}
