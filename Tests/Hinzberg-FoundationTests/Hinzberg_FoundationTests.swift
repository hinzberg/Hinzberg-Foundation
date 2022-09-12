import XCTest
@testable import Hinzberg_Foundation

final class Hinzberg_FoundationTests: XCTestCase
{
    func testExample() throws {
    }
    
    func testRandomNumbers()
    {
        for i:Int in 1  ..< 40
        {
            let value = Int.random(lower: i, upper: i + 10 )
            XCTAssert(value >= i && value <= i + 10)
        }
    }
    
    func testStringHelper()
    {
        let value = "The quick brown fox jumps over the lazy dog"
        
        XCTAssert(value.getIndexOf(searchString: "quick") == 4)
        XCTAssert(value.caseInsensitiveBeginsWith(searchString: "the"))
        XCTAssert(value.caseInsensitiveEndsWith(searchString:  "dog"))
        XCTAssert(value.caseInsensitiveContains(searchString: "fox"))
        
        // XCTAssert(value.substringRightOf(searchString: "lazy") == " dog") deprecated
        XCTAssert(value.substringAfter(searchString:  "lazy") == " dog")
        XCTAssert(value.substringAfter(searchString:  "LAZY", options: NSString.CompareOptions.caseInsensitive) == " dog")
        XCTAssert(value.substringAfterIncluding(searchString:  "lazy") == "lazy dog")
               
        // XCTAssert(value.substringLeftOf(searchString: "quick") == "The ") deprecated
        XCTAssert(value.substringBefore(searchString: "quick") == "The ")
        XCTAssert(value.substringBefore(searchString: "QUICK", options: NSString.CompareOptions.caseInsensitive) == "The ")
        XCTAssert(value.substringBeforeIncluding(searchString: "quick") == "The quick")
               
        XCTAssert(value.left(characterCount: 9) == "The quick");
        XCTAssert(value.right(characterCount: 8) == "lazy dog");
                
        XCTAssert(value.substringRightAfter(characterCount: 10) == "brown fox jumps over the lazy dog")
        XCTAssert(value.substringLeftBefore(characterCount: 9) == "The quick brown fox jumps over the")
    }
    
    func testStringHelper2()
    {
        let value = "The quick brown fox jumps over the lazy dog"
        XCTAssert(value.substringBetween(startString: "fox", endString: "dog") == " jumps over the lazy ")
    }
    
    
    func testArrayHelper() {
        let array = ["one", "one", "two", "two", "three", "three"]
        let unique = array.unique
        XCTAssert(unique.count == 3)
    }
}
