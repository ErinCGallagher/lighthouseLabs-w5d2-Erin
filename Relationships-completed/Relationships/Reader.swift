import Parse

class Reader: PFObject, PFSubclassing {
    @NSManaged var name: String? // value
    
    static func parseClassName() -> String {
        return "Reader"
    }
    
    /**
     MANY to MANY relationship:
     - A Book can be read by MANY Readers
     - A Reader can read Many Books
     */
    
    var hasRead: PFRelation<PFObject> {
        return relation(forKey: "hasRead")
    }
}
