
import ObjectMapper

class Task: Mappable {
    
    var id: String
    var number: Int
    var description: String
    
    init() {
        id = ""
        number = 0
        description = ""
    }
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        number <- map["number"]
        description <- map["description"]
    }
    
}
