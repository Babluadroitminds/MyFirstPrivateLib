//
//  Vibrate.swift
//  AppsPeopleiOS
//
//  Created by Olivier Voyer on 29/08/2018.
//  Copyright © 2019 Apps People. All rights reserved.
//

import AudioToolbox

/// On the iPhone, use this function to invoke a brief vibration. On the iPod touch, does nothing.
public func vibrate() {
    AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
}
