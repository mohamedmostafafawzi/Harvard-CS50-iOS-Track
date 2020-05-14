//
//  NoteViewController.swift
//  Notes
//
//  Created by Mohamed Mostafa Fawzi on 2/13/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import UIKit


class NoteViewController: UIViewController {
    var note: Note!
    
    @IBOutlet var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = note.contents
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        note.contents = textView.text
        NoteManager.main.save(note: note)
    }
}
