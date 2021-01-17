//
//  LoginFormController.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 13.01.2021.
//

import UIKit

class LoginFormController: UIViewController {

    @IBOutlet var scrollView: UIScrollView?
    @IBOutlet var loginInput: UITextField?
    @IBOutlet var passwordInput: UITextField?
    @IBOutlet var signInBtn: UIButton?
    
    private var keyboardShown = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTapGestureRecognizer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addKeyboardObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeKeyboardObservers()
    }
    
    // Добавляет обзерверы на появление/скрытие клавиатуры
    private func addKeyboardObservers() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        guard !keyboardShown else { return }
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        scrollView?.contentInset.bottom += keyboardFrame.height
        keyboardShown = true
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        guard keyboardShown else { return }
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? CGRect else {
            return
        }
        scrollView?.contentInset.bottom -= keyboardFrame.height
        keyboardShown = false
    }
    
    // Удаляет обзерверы клавиатуры
    private func removeKeyboardObservers() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // Скрытие клавиатуры при клике на пустое место
    private func addTapGestureRecognizer() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        view.addGestureRecognizer(recognizer)
        
    }
    
    @objc private func endEditing() {
        view.endEditing(true)
    }
    
    // Авторизация
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        let auth = checkAuth()
        
        if !auth {
            showLoginError()
        }
        
        return auth
    }
    
    // Проверка логина и пароля
    private func checkAuth() -> Bool {
        guard let login = loginInput?.text,
              let passw = passwordInput?.text
        else { return false }
        
        // Позже прикрутим логику с реальными данными
        return !login.isEmpty && !passw.isEmpty ? true : false
    }
    
    // Сообщение об ошибке
    private func showLoginError() {
        let alert = UIAlertController(title: "Ошибка", message: "Неправильный логин или пароль", preferredStyle: .alert)
        let action = UIAlertAction(title: "ОК", style: .cancel, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
