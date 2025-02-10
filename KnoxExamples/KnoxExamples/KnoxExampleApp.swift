//
//  EncryptedPrefsApp.swift
//  EncryptedPrefs
//
//  Created by Adam Dahan on 2024-10-21.
//

import SwiftUI
import Knox

@main
struct KnoxExampleApp: App {
    var body: some Scene {
        WindowGroup {
            SecureStoreListView(
                viewModel: SecureStoreListViewModel(
                    encryptedPlugin: Knox.EncryptedPreferencePlugin(service: "com.knoxexamples.encrypted-plugin"),
                    biometricsPlugin: Knox.BiometricsPreferencePlugin(service: "com.knoxexamples.biometrics-encrypted-plugin"),
                    secureEnclavePlugin: Knox.SecureEnclavePreferencePlugin(service: "com.knoxexamples.secureenclave-plugin"),
                    biometricsSecureEnclavePlugin: Knox.BiometricsSecureEnclavePreferencePlugin(service: "com.knoxexamples.biometrics-secureenclave-plugin")
                )
            )
        }
    }
}
