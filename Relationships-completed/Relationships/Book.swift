import Parse

class Book: PFObject, PFSubclassing {
    @NSManaged var title: String? // value
    
    /**
     ONE to MANY relationship
     - A Book has ONE Author
     - An Author can write MANY books
     */
    @NSManaged var author: Author? // relationship
    /**
     NOTE: 'back-linking'
     Property on the "many" side of the relationship points
     back to the "one"
     */
    
    static func parseClassName() -> String {
        return "Book"
    }
}
