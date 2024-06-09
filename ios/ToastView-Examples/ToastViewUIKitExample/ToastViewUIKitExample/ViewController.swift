//
//  ViewController.swift
//  ToastViewUIKitExample
//
//  Created by Adam Dahan on 2024-06-03.
//

import UIKit
import ToastView

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let tableView = UITableView()
    enum ToastType: Int, CaseIterable {
        case darkModeAlert, toastFromTop, toastFromBottom, toastFromTopWithAnimation, toastFromBottomWithAnimation, toastWithCustomBorder, toastWithCustomFont, toastWithNoEmoji, primaryAlert, secondaryAlert, successAlert, dangerAlert, warningAlert, infoAlert

        var description: String {
            switch self {
            case .darkModeAlert: return "Dark Mode Capable Alert"
            case .toastFromTop: return "Toast from top with fade"
            case .toastFromBottom: return "Toast from bottom w emoji"
            case .toastFromTopWithAnimation: return "Toast from top w Animation"
            case .toastFromBottomWithAnimation: return "Toast from bottom w / Rotating border"
            case .toastWithCustomBorder: return "Toast with Custom Border"
            case .toastWithCustomFont: return "Toast with image from url"
            case .toastWithNoEmoji: return "Toast with large image"
            case .primaryAlert: return "Primary Alert"
            case .secondaryAlert: return "Secondary Alert"
            case .successAlert: return "Success Alert"
            case .dangerAlert: return "Danger Alert"
            case .warningAlert: return "Warning Alert"
            case .infoAlert: return "Info Alert"
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Toast Examples"
        setupTableView()
    }

    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ToastType.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let toastType = ToastType(rawValue: indexPath.row) {
            cell.textLabel?.text = toastType.description
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let toastType = ToastType(rawValue: indexPath.row) else { return }
        
        switch toastType {
        case .darkModeAlert:
            showDarkModeAlert()
        case .toastFromTop:
            showToastFromTop()
        case .toastFromBottom:
            showToastFromBottom()
        case .toastFromTopWithAnimation:
            showToastFromTopWithAnimation()
        case .toastFromBottomWithAnimation:
            showToastFromBottomWithAnimation()
        case .toastWithCustomBorder:
            showToastWithCustomBorder()
        case .toastWithCustomFont:
            showToastWithCustomFont()
        case .toastWithNoEmoji:
            showToastWithNoEmoji()
        case .primaryAlert:
            showPrimaryAlert()
        case .secondaryAlert:
            showSecondaryAlert()
        case .successAlert:
            showSuccessAlert()
        case .dangerAlert:
            showDangerAlert()
        case .warningAlert:
            showWarningAlert()
        case .infoAlert:
            showInfoAlert()
        }
    }

    private func showDarkModeAlert() {
        let currentTraitCollection = self.traitCollection
        
        let lightConfiguration = ToastViewConfigurationBuilder()
            .setBackgroundColor(.white)
            .setForegroundColor(.black)
            .setPosition(.bottom)
            .setAnimationOptions(ToastViewAnimationOptions(duration: 0.3))
            .setBorderOptions(ToastViewBorderOptions(borderWidth: 1, borderColor: .black))
            .setFontOptions(ToastViewFontOptions(font: UIFont.systemFont(ofSize: 16)))
            .setEmojiOptions(ToastViewEmojiOptions(icon: "🌞", font: UIFont.systemFont(ofSize: 24)))
            .setShadowOptions(ToastViewShadowOptions(color: .gray, opacity: 0.5, offset: CGSize(width: 0, height: 2), radius: 4))
            .build()
        
        let darkConfiguration = ToastViewConfigurationBuilder()
            .setBackgroundColor(.black)
            .setForegroundColor(.white)
            .setCornerRadius(10)
            .setBorderOptions(ToastViewBorderOptions(borderWidth: 1, borderColor: .white))
            .setFontOptions(ToastViewFontOptions(font: UIFont.systemFont(ofSize: 16)))
            .setImageOptions(ToastViewImageOptions(url: URL(string: "https://images.photowall.com/products/60880/skateboard-park.jpg?h=699&q=85")!, size: .large, cornerRadius: 10))
            .setShadowOptions(ToastViewShadowOptions(color: .white, opacity: 0.5, offset: CGSize(width: 0, height: 2), radius: 4))
            .build()
        
        let configuration: ToastViewConfiguration
        if currentTraitCollection.userInterfaceStyle == .dark {
            configuration = darkConfiguration
        } else {
            configuration = lightConfiguration
        }
        
        ToastView.show(text: "This is a toast message!", configuration: configuration)
    }
    
    private func showToastFromTop() {
        let config = ToastViewConfigurationBuilder()
            .setEmojiOptions(ToastViewEmojiOptions(icon: "🚀"))
            .build()
        ToastView.show(
            text: "This is a toast message.",
            configuration: config
        )
    }
    
    private func showToastFromBottom() {
        let config = ToastViewConfigurationBuilder()
            .setPosition(.bottom)
            .setEmojiOptions(ToastViewEmojiOptions(icon: "📱", font: UIFont.systemFont(ofSize: 48.0)))
            .build()
        ToastView.show(
            text: "This is a much longer toast message.",
            configuration: config
        )
    }
    
    private func showToastFromTopWithAnimation() {
        let config = ToastViewConfigurationBuilder()
            .setAnimationOptions(ToastViewAnimationOptions(duration: 0.7))
            .setEmojiOptions(ToastViewEmojiOptions(icon: "📱", font: UIFont.systemFont(ofSize: 48.0)))
            .build()
        ToastView.show(
            text: "This is a much longer toast message.",
            configuration: config
        )
    }
    
    private func showToastFromBottomWithAnimation() {
        let config = ToastViewConfigurationBuilder()
            .setPosition(.bottom)
            .setAnimationOptions(ToastViewAnimationOptions(duration: 0.7))
            .setRotatingBorderOptions(ToastViewRotatingBorderOptions())
            .build()
        ToastView.show(text: "This is a toast message", configuration: config)
    }
    
    private func showToastWithCustomBorder() {
        let config = ToastViewConfigurationBuilder()
            .setBorderOptions(ToastViewBorderOptions(borderColor: .systemYellow))
            .build()
        ToastView.show(text: "Checkout my new border", configuration: config)
    }
    
    private func showToastWithCustomFont() {
        let config = ToastViewConfigurationBuilder()
            .setFontOptions(ToastViewFontOptions(font: .systemFont(ofSize: 24)))
            .setRotatingBorderOptions(ToastViewRotatingBorderOptions())
            .setImageOptions(ToastViewImageOptions(url: URL(string: "https://img.freepik.com/free-vector/pride-gradient-1_78370-282.jpg")!, size: .small, cornerRadius: 2))
            .build()
        ToastView.show(text: "Image loaded", configuration: config)
    }
    
    private func showToastWithNoEmoji() {
        let config = ToastViewConfigurationBuilder()
            .setBackgroundColor(.white)
            .setForegroundColor(.black)
            .setRotatingBorderOptions(ToastViewRotatingBorderOptions(strokeWidth: 10.0))
            .setImageOptions(ToastViewImageOptions(url: URL(string: "https://img.freepik.com/free-vector/pride-gradient-1_78370-282.jpg")!, size: .large, cornerRadius: 10))
            .build()
        ToastView.show(
            text: "This is a rainbow toast message with a large image",
            configuration: config
        )
    }
    
    private func showPrimaryAlert() {
        let config = ToastViewConfigurationBuilder()
            .setImageOptions(ToastViewImageOptions(image: UIImage(named: "adam"), size: .small))
            .build()
        ToastView.alert(
            type: .primary,
            text: "This is a primary alert—check it out!",
            configuration: config
        )
    }

    private func showSecondaryAlert() {
       ToastView.alert(type: .secondary, text: "This is a secondary alert—check it out!")
    }

    private func showSuccessAlert() {
       ToastView.alert(type: .success, text: "This is a success alert—check it out!")
    }

    private func showDangerAlert() {
       ToastView.alert(type: .danger, text: "Having trouble connecting to server")
    }

    private func showWarningAlert() {
       ToastView.alert(type: .warning, text: "This is a warning alert—check it out!")
    }

    private func showInfoAlert() {
        let config = ToastViewConfigurationBuilder()
            .setPosition(.bottom)
            .setAnimationOptions(ToastViewAnimationOptions())
            .setRotatingBorderOptions(ToastViewRotatingBorderOptions(strokeWidth: 5.0, colors: [ToastViewAlertType.info.foregroundColor]))
            .build()
        ToastView.alert(type: .info, text: "This is an info alert—check it out!", configuration: config)
    }
}

