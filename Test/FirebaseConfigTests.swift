//
//  FirebaseConfigTests.swift
//  edXTests
//
//  Created by Saeed Bashir on 8/28/18.
//  Copyright © 2018 edX. All rights reserved.
//

import Foundation

@testable import edX

class FirebaseConfigTests: XCTestCase {

    func testNoFirebaseConfig() {
        let config = OEXConfig(dictionary:[:])
        XCTAssertFalse(config.firebaseConfig.enabled)
        XCTAssertFalse(config.firebaseConfig.analyticsEnabled)
        XCTAssertFalse(config.firebaseConfig.cloudMessagingEnabled)
        XCTAssertEqual(config.firebaseConfig.apiKey, "")
        XCTAssertEqual(config.firebaseConfig.clientID, "")
        XCTAssertEqual(config.firebaseConfig.gcmSenderID, "")
        XCTAssertEqual(config.firebaseConfig.googleAppID, "")
        
    }

    func testEmptyFirebaseConfig() {
        let config = OEXConfig(dictionary:["FIREBASE":[:]])
        XCTAssertFalse(config.firebaseConfig.enabled)
        XCTAssertFalse(config.firebaseConfig.analyticsEnabled)
        XCTAssertFalse(config.firebaseConfig.cloudMessagingEnabled)
        XCTAssertEqual(config.firebaseConfig.apiKey, "")
        XCTAssertEqual(config.firebaseConfig.clientID, "")
        XCTAssertEqual(config.firebaseConfig.gcmSenderID, "")
        XCTAssertEqual(config.firebaseConfig.googleAppID, "")
    }

    func testFirebaseConfig() {
        let GCM_SENDER_ID = "608417025925"
        let API_KEY = "Zhk6QiW7EbQW0WxJ5mzzZV9hDN8xEo"
        let CLIENT_ID = "6i9smf15pi4baevepjrsscmbht9bg2ah.apps.googleusercontent.com"
        let GOOGLE_APP_ID = "608417025925:ios:c04089bb49270266"
        let configDictionary = [
            "FIREBASE" : [
                "ENABLED": true,
                "ANALYTICS_ENABLED": true,
                "CLOUD_MESSAGING_ENABLED": true,
                "GCM_SENDER_ID": GCM_SENDER_ID,
                "API_KEY": API_KEY,
                "CLIENT_ID": CLIENT_ID,
                "GOOGLE_APP_ID": GOOGLE_APP_ID
            ]
        ]

        let config = OEXConfig(dictionary: configDictionary)
        XCTAssertTrue(config.firebaseConfig.enabled)
        XCTAssertTrue(config.firebaseConfig.analyticsEnabled)
        XCTAssertTrue(config.firebaseConfig.cloudMessagingEnabled)
        XCTAssertEqual(config.firebaseConfig.apiKey, API_KEY)
        XCTAssertEqual(config.firebaseConfig.clientID, CLIENT_ID)
        XCTAssertEqual(config.firebaseConfig.gcmSenderID, GCM_SENDER_ID)
        XCTAssertEqual(config.firebaseConfig.googleAppID, GOOGLE_APP_ID)
    }

    func testFirebaseDisableConfig() {
        let configDictionary = [
            "FIREBASE" : [
                "ENABLED": false,
                "ANALYTICS_ENABLED": true,
                "CLOUD_MESSAGING_ENABLED": true
            ]
        ]

        let config = OEXConfig(dictionary: configDictionary)
        XCTAssertFalse(config.firebaseConfig.enabled)
        XCTAssertFalse(config.firebaseConfig.analyticsEnabled)
        XCTAssertFalse(config.firebaseConfig.cloudMessagingEnabled)
    }

    func testFirebaseDisableAnalytics() {
        let configDictionary = [
            "FIREBASE" : [
                "ENABLED": true,
                "ANALYTICS_ENABLED": false,
            ]
        ]

        let config = OEXConfig(dictionary: configDictionary)
        XCTAssertTrue(config.firebaseConfig.enabled)
        XCTAssertFalse(config.firebaseConfig.analyticsEnabled)
        XCTAssertFalse(config.firebaseConfig.cloudMessagingEnabled)
    }

    func testFirebaseDisableCloudMessaging() {
        let configDictionary = [
            "FIREBASE" : [
                "ENABLED": true,
                "CLOUD_MESSAGING_ENABLED": true,
            ]
        ]

        let config = OEXConfig(dictionary: configDictionary)
        XCTAssertTrue(config.firebaseConfig.enabled)
        XCTAssertFalse(config.firebaseConfig.analyticsEnabled)
        XCTAssertTrue(config.firebaseConfig.cloudMessagingEnabled)
    }
}
