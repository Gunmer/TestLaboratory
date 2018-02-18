
import ObjectMapper

class Task: Mappable {
    
    var number: Int
    var description: String
    
    init() {
        number = 0
        description = ""
    }
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        number <- map["number"]
        description <- map["description"]
    }
    
}
