import Parse

class Author: PFObject, PFSubclassing {
    @NSManaged var name: String? // value
    
    static func parseClassName() -> String {
        return "Author"
    }
}
