//
//  ViewController.swift
//  ChangeAppIconProgrammaticallyExample
//
//  Created by John Codeos on 5/7/20.
//  Copyright © 2020 John Codeos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var changeIconSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the saved switch state
        let savedState = UserDefaults.standard.bool(forKey: "switch_state")
        savedState ? (changeIconSwitch.isOn = true) : (changeIconSwitch.isOn = false)
    }

    @IBAction func changeIconAction(_ sender: UISwitch) {
        // Check if the system allows you to change the icon
        if UIApplication.shared.supportsAlternateIcons {
            if sender.isOn {
                // Show alternative app icon (White Logo)
                UIApplication.shared.setAlternateIconName("WhiteLogo") { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("App Icon changed!")
                    }
                }
            } else {
                // Show default app icon (Red Logo)
                UIApplication.shared.setAlternateIconName(nil)
            }
        }

        // Save the switch state
        UserDefaults.standard.set(sender.isOn, forKey: "switch_state")
    }
}
