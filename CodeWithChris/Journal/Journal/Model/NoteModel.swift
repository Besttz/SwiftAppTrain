//
//  NoteModel.swift
//  Journal
//
//  Created by ZhangTommy on 10/8/20.
//  Copyright © 2020 Tommy Zhang. All rights reserved.
//

import Foundation
import Firebase

protocol NoteModelProtocol {
    func getNotes(notes:[Note])
}

class NoteModel {
    var delegate:NoteModelProtocol?
    let db = Firestore.firestore()
    
    func getNotes()  {
        var notes = [Note]()
        db.collection("Note").getDocuments { (snapshot, error) in
            if  snapshot != nil && error == nil  {
                for doc in snapshot!.documents {
                    let data  = doc.data()
                    let n = Note(docId: data["docId"] as! String, title: data["title"] as! String, body: data["body"] as! String, isStarred: data["isStarred"] as! Bool, createdAt: Timestamp.dateValue(data["createdAt"] as! Timestamp)(), lastUpdatedAt: Timestamp.dateValue(data["lastUpdatedAt"] as! Timestamp)())
                    
                    notes.append(n)
                }
            } // End of getDocuments
            
            self.delegate?.getNotes(notes: notes)
        }
    }
    
    func deleteNotes(note:Note) {
        db.collection("Note").document(note.docId).delete()
    }
    
    func save(note:Note) {
        db.collection("Note").document(note.docId).setData(noteToDic(n: note))
    }
    
    func noteToDic(n:Note) -> [String:Any] {
        var dict = [String:Any]()
        
        dict["docId"] = n.docId
        dict["title"] = n.title
        dict["body"] = n.body
        dict["createdAt"] = n.createdAt
        dict["lastUpdatedAt"] = n.lastUpdatedAt
        dict["isStarred"] = n.isStarred
        
        return dict
        
    }
}
