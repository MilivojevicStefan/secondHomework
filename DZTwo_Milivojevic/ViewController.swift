//
//  ViewController.swift
//  DZTwo_Milivojevic
//
//  Created by Стефан  Миливоевич on 2.4.24..
//

import UIKit

class ViewController: UIViewController {
    
    var bgcolor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
    
    lazy var backgroundImg: UIImageView = {
        $0.image = UIImage(named: "img_bg")
        
        return $0
    }(UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 156)))
    
    lazy var avatarImg: UIImageView = {
        $0.image = UIImage(named: "avatar")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 50
        return $0
    }(UIImageView(frame: CGRect(origin: CGPoint(x: 30, y: backgroundImg.frame.height + 32), size: CGSize(width: 100, height: 100))))
    
    lazy var nameLabel = createLabel(name: "Стефан Миливоевич", weight: .black, frame: CGRect(origin: CGPoint(x: avatarImg.frame.width + 46, y: backgroundImg.frame.height + 52), size: CGSize(width: 120, height: 20)))
    
    lazy var editBtn = createButton(text: "Редактировать", frame: CGRect(origin: CGPoint(x: avatarImg.frame.width + 46, y: nameLabel.frame.origin.y + 28), size: CGSize(width: 150, height: 34)))
    
    lazy var aboutLabel = createLabel(name: "Добавить описание", weight: .regular, frame: CGRect(origin: CGPoint(x: 30, y: avatarImg.frame.origin.y + 152), size: CGSize(width: 200, height: 20)))

    lazy var textField: UITextView = {
        $0.backgroundColor = bgcolor
        $0.layer.cornerRadius = 16
        $0.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        $0.font = UIFont.systemFont(ofSize: 16)
        return $0
    }(UITextView(frame: CGRect(origin: CGPoint(x: 30, y: aboutLabel.frame.origin.y + 28), size: CGSize(width: view.frame.width - 60, height: 150))))
    
    lazy var passwordLabel = createLabel(name: "Изменить пароль", weight: .regular, frame: CGRect(origin: CGPoint(x: 30, y: textField.frame.origin.y + 182), size: CGSize(width: 200, height: 20)))
    
    lazy var oldPasswordField = createField(placeholder: "Старый пароль", frame: CGRect(origin: CGPoint(x: 30, y: passwordLabel.frame.origin.y + 28), size: CGSize(width: view.frame.width - 60, height: 52)), color: bgcolor)
    
    lazy var newPasswordField = createField(placeholder: "Новый пароль", frame: CGRect(origin: CGPoint(x: 30, y: oldPasswordField.frame.origin.y + 66), size: CGSize(width: view.frame.width - 60, height: 52)), color: bgcolor)
    
    lazy var saveBtn = createButton(text: "Сохранить", frame: CGRect(origin: CGPoint(x: 30, y: view.frame.height - 107), size: CGSize(width: view.frame.width - 60, height: 55)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        [backgroundImg, avatarImg, nameLabel, editBtn, aboutLabel, textField, passwordLabel,oldPasswordField, newPasswordField, saveBtn].forEach {
            view.addSubview($0)
        }
    }

    func createLabel(name: String, weight: UIFont.Weight = .regular, frame: CGRect) -> UILabel {
        let label = UILabel()
        label.text = name
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: weight)
        label.frame = frame
        label.sizeToFit()
        
        return label
    }
    
    func createButton(text: String, frame: CGRect) -> UIButton {
        let button = UIButton()
        button.setTitle(text, for: .normal)
        button.frame = frame
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 12
        return button
        
    }
    
    func createField(placeholder: String, frame: CGRect, color: UIColor) -> UITextField {
        let field = UITextField()
        field.placeholder = placeholder
        field.frame = frame
        field.backgroundColor = color
        field.layer.cornerRadius = 16
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 32, height: 1))
        field.leftViewMode = .always
        field.isSecureTextEntry = true
        return field
    }
}

