//
//  AppRouter.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 16.10.2022.
//

import Foundation
import UIKit

open class AppRouter {

    public static var shared = AppRouter()
    
    public static var window: UIWindow {
        return shared.window
    }

    open var window: UIWindow {
        return windowProvider()
    }
    open var windowProvider: () -> UIWindow

    public convenience init() {
        self.init(windowProvider: WindowProvider.dynamic.window)
    }

    public init(windowProvider: @escaping () -> UIWindow) {
        self.windowProvider = windowProvider
    }

    func start() {
        let viewController = OnboardingPageRouter.setupModule()
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

    public enum WindowProvider {
        case `static`(UIWindow)
        case dynamic

        func window() -> UIWindow {
            switch self {
            case .static(let window):
                return window
            case .dynamic:
                guard let delegate = UIApplication.shared.delegate else { fatalError("no appDelegate found") }
                if let windowProperty = delegate.window {
                    if let window = windowProperty {
                        return window
                    } else {
                        let newWindow = UIWindow(frame: UIScreen.main.bounds)
                        delegate.perform(#selector(setter: UIApplicationDelegate.window), with: newWindow)
                        newWindow.makeKeyAndVisible()
                        return newWindow
                    }
                } else {
                    // swiftlint:disable:next line_length
                    guard let window = UIApplication.shared.keyWindow else { fatalError("delegate doesn't implement window property and no UIApplication.sharedApplication().keyWindow available") }
                    return window
                }
            }
        }
    }
}
