//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by NADEZDA IVANOVA on 24.02.2022.
//

import UIKit


class ProfileHeaderView: UIView {
/*
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Joker"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Smile"
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     lazy var textField: UITextField = {
        let textField = UITextField()
        textField.isHidden = false
        textField.backgroundColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 12
        return textField
    }()
    
     lazy var statusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.setTitle("Set status", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
20
    
    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawSelf()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    private func drawSelf() {
    
        self.addSubview(self.statusButton)
        self.addSubview(self.textField)
        self.addSubview(self.infoStackView)
    
        self.infoStackView.addArrangedSubview(self.labelsStackView)
        self.labelsStackView.addArrangedSubview(self.nameLabel)
        self.labelsStackView.addArrangedSubview(self.statusLabel)

        
        NSLayoutConstraint.activate([
   

            infoStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            infoStackView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 150),
            infoStackView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16),

            
            statusButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
            statusButton.rightAnchor.constraint(equalTo: infoStackView.rightAnchor),
            statusButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 14),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            
            textField.leftAnchor.constraint(equalTo: infoStackView.rightAnchor, constant: 15),
            textField.rightAnchor.constraint(equalTo: infoStackView.rightAnchor),
            textField.topAnchor.constraint(equalTo: infoStackView.bottomAnchor, constant: 10),
            textField.heightAnchor.constraint(equalToConstant: 40)

        ].compactMap({ $0 }))
    }
    
  
    
   */
}


/*
 Уважаемые студенты!

 Дипломный проект проект технически загружаем точно также, как и домашнее задание.

 Формат сдачи: ссылка на репозиторий и архив с файлами проекта (обязательно)

 В дипломной работе вам нужно доработать существующий проект ВК.
 Экран с логинкой:

 Реализовать проверку на пустые поля логина и пароля. Если одно из полей пустое, то при нажатии на кнопку к этому полю должно применяться действие. Например: изменение цвета фона, рамки или подергивание.
 Реализовать проверку на количество введенных символов пароля. Если меньше определенного количество, то под полем с паролеме должен появиться UILabel с предупреждением.
 Установить стандартный логин и пароль. В случае ввода некорректных данных выбрасывать UIAlertController с предупреждением.
 Задача со ★:

 Реализовать проверку валидности email адреса. К примеру статья
 Экран с профилем:

 При нажатии на кнопку Set status необходимо реализовать проверку на пустой UITextFiled с установкой статуса, по аналогии с логинкой.
 При нажатии на UILabel с лайками количество лайков должно увеличиваться.
 При нажатии на картинку с постом должна презентоваться View с детальным описанием этого поста. При этом в UILabel с количеством просмотров должен быть увеличен счетчик просмотром на 1.
 Задача со ★:

 Реализовать возможность удаления ячейки с постом по свайпу.
 Экран с коллекцией фото.
 При однократном нажатии на ячейку с фото реализовать анимацию, по аналогии с анимацией из последнего задания.
 */
