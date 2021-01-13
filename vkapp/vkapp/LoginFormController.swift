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
        addKeyboardObservers()
        addTapGestureRecognizer()
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
    
    // Кнопка Войти
    @IBAction func signInTap(_ sender: Any) {
        guard let login = loginInput?.text else { return }
        guard let passw = passwordInput?.text else { return }
        
        if !login.isEmpty && !passw.isEmpty {
            print("login: \(login). Password: \(passw)")
        }
    }
}
