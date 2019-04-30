//
//  LMTPushNotificationService.swift
//  TriplyServiceKit
//
//  Created by Jonanthan Lam on 4/29/19.
//  Copyright © 2019 Limitless Studios. All rights reserved.
//

import UserNotifications

public class LMTPushNotificationService {
    public func prepare(for application: UIApplication) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .sound, .alert]) { (isGranted, error) in
            guard isGranted else { return }
            
            DispatchQueue.main.async {
                application.registerForRemoteNotifications()
            }
        }
    }
}
