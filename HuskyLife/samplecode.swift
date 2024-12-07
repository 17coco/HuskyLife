//
//  samplecode.swift
//  HuskyLife
//
//  Created by Beihan  Zhou  on 11/25/24.
//
//---------------------------------------------------
//set up for textfield like ones on login screen
/*
 textfieldElement = UITextField()
 textfieldElement.placeholder = "write your place holder..."
 textfieldElement.borderStyle = .roundedRect
 textfieldElement.translatesAutoresizingMaskIntoConstraints = false
 addSubview(textfieldElement)
 */
//------------------------------------------------------
//set up for button like ones on login screen
/*
 buttonElement = UIButton(type: .system)
 buttonElement.setTitle("Title", for: .normal)
 buttonElement.backgroundColor = .black
 buttonElement.setTitleColor(.white, for: .normal)
 buttonElement.layer.cornerRadius = 20
 buttonElement.translatesAutoresizingMaskIntoConstraints = false
 addSubview(buttonElement)
 */
//---------------------------------------------------
//create plain text(label)
/*
 1. use the following function:
 func createLabel(withText text: String, isBold: Bool = false) -> UILabel {
     let label = UILabel()
     label.text = text
     label.font = isBold ? UIFont.boldSystemFont(ofSize: 18) : UIFont.systemFont(ofSize: 18, weight: .regular)
     label.textColor = .black
     label.translatesAutoresizingMaskIntoConstraints = false
     addSubview(label)
     return label
 }
 2. Label = createLabel(withText: "you text", isBold: true)// you can disable bold by setting isBold to false
 */
//create button
/*
 button = UIButton(type: .system)
 button.setTitle("your title", for: .normal)
 button.backgroundColor = .black
 button.setTitleColor(.white, for: .normal)
 button.layer.cornerRadius = 8
 button.translatesAutoresizingMaskIntoConstraints = false
 contentWrapper.addSubview(buttonSave)
 */
