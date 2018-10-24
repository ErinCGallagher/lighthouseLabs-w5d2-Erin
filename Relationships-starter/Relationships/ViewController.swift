import UIKit
import Parse

/**
 Demo View Controller which creates data for a Parse database
 and queries it for insights.
 The query results are printed to the terminal.
 */
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Commented out so as not to duplicate sample data in Parse
//        createSampleData()
//        sleep(5)
        
        // Query #1: Find the which books were written by J. K. Rowling
        findBooksWrittenByAuthor(named: "J. K. Rowling")
        
        // Query #2: Find which books Shannon, the reader, has read
        findBooksReadByReader(named: "Shannon")
        
        // Query #3: Find which readers have read the book "The Color Purple"
        findReadersWhoReadBook(titled: "The Color Purple")
    }
    
    // Query #1: Find Books Written by Auhtor (One to Many)
    private func findBooks(by author: Author?) {
        guard let author = author else { return }
        
        // TODO: Implement Query Below

    }
    
    // Query #2: Find Books read by Reader (Many to Many)
    private func booksRead(by reader: Reader?) {
        guard let reader = reader else { return }
        
        // TODO: Implement Query Below
    }
    
    // Query #3: Find which readers have read a Book (Many to Many)
    private func readersHaveRead(_ book: Book?) {
        guard let book = book else { return }
        
        // TODO: Implement Query Below
        
    }
    
    
    
    /** Helper Query Functions Below */
    
    //helper function to retrieve an Author object given a name
    private func findBooksWrittenByAuthor(named: String) {
        PFQuery(className: Author.parseClassName())
            .whereKey("name", equalTo: named)
            .findObjectsInBackground { (results, error) in
                if let authors = results as? [Author] {
                    self.findBooks(by: authors.first)
                }
        }
    }
    
    //helper function to retrieve a Book object given a title
    private func findReadersWhoReadBook(titled: String) {
        PFQuery(className: Book.parseClassName())
            .whereKey("title", equalTo: titled)
            .findObjectsInBackground { (results, error) in
                if let books = results as? [Book] {
                    self.readersHaveRead(books.first)
                }
        }
    }
    
    //helper function to retrieve a Reader object given a name
    private func findBooksReadByReader(named: String) {
        PFQuery(className: Reader.parseClassName())
            .whereKey("name", equalTo: named)
            .findObjectsInBackground { (results, error) in
                if let readers = results as? [Reader] {
                    self.booksRead(by: readers.first)
                }
        }
    }
    
    /**
     Create sample Parse data for Demo:
     - 3 Auhtors
     - 4 Books
     - 3 Readers
    */
    private func createSampleData() {
        /** Author #1 */
        let author1 = Author()
        author1.name = "Stephen King"
        
        
        let book1 = Book()
        book1.title = "It"
        book1.author = author1
        book1.saveInBackground()
        
        /** Author #2 */
        let author2 = Author()
        author2.name = "Alice Walker"
        
        let book2 = Book()
        book2.title = "The Color Purple"
        book2.author = author2
        book2.saveInBackground()
        
        /** Author #3 */
        let author3 = Author()
        author3.name = "J. K. Rowling"
        
        let book3 = Book()
        book3.title = "Harry Potter and the Sorcerer's Stone"
        book3.author = author3
        book3.saveInBackground()
        
        let book4 = Book()
        book4.title = "Fantastic Beasts: The Crimes of Grindelwald"
        book4.author = author3
        book4.saveInBackground()
        
        
        /** Readers */
        let reader1 = Reader()
        reader1.name = "Erin"
        
        let reader2 = Reader()
        reader2.name = "Mike"
        
        let reader3 = Reader()
        reader3.name = "Shannon"
        
        DispatchQueue.global(qos: .userInteractive).asyncAfter(deadline: .now() + 1) {
            // reader1 has read book 1 & book 2
            reader1.hasRead.add(book1)
            reader1.hasRead.add(book2)
            reader1.saveInBackground() //save relationship data
        }
        
        DispatchQueue.global(qos: .userInteractive).asyncAfter(deadline: .now() + 1) {
            // reader2 has read book 3
            reader2.hasRead.add(book3)
            reader2.saveInBackground() //save relationship data
        }
        
        DispatchQueue.global(qos: .userInteractive).asyncAfter(deadline: .now() + 1) {
            // reader3 has read book 1, book 2, book 3, book 4
            reader3.hasRead.add(book1)
            reader3.hasRead.add(book2)
            reader3.hasRead.add(book3)
            reader3.hasRead.add(book4)
            reader3.saveInBackground() //save relationship data
        }
    }
}

