import Foundation

struct Schools: Codable, Hashable {
    
    let dbn: String
    let schoolName: String
    let location: String
    let phoneNumber: String
    let schoolEmail: String?
    let website: String
    let extracurricularActivities: String?
    let schoolSports: String?
    let requirement1_1: String?
    let requirement2_1: String?
    let requirement3_1: String?
    let requirement4_1: String?
    let requirement5_1: String?
    let city: String
    
    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case location
        case phoneNumber = "phone_number"
        case schoolEmail = "school_email"
        case website
        case extracurricularActivities = "extracurricular_activities"
        case schoolSports = "school_sports"
        case requirement1_1
        case requirement2_1
        case requirement3_1
        case requirement4_1
        case requirement5_1
        case city
      
    }
}
