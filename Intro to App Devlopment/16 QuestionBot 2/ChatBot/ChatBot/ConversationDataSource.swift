import Foundation
class ConversationDataSource {
    
    /// The number of Messages in the conversation
    var messageCount:Int {
        return msgs.count
    }
//    var msgs = [Message]()
    var msgs = [openingLine]
    
    /// Add a new question to the conversation
    func add(question: String) {
        print("Asked to add question: \(question)")
        let msg = Message(date: Date(), text: question, type: .question)
        msgs.append(msg)
        
    }
    
    /// Add a new answer to the conversation
    func add(answer: String) {
        print("Asked to add answer: \(answer)")
        let msg = Message(date: Date(), text: answer, type: .answer)
        msgs.append(msg)
    }
    
    /// The Message at a specific point in the conversation
    func messageAt(index: Int) -> Message {
        print("Asking for message at index \(index)")
        return msgs[index]
    }
}
