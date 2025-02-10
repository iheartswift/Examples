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
                    encryptedPlugin: Knox.EncryptedPreferencePlugin(),
                    biometricsPlugin: Knox.BiometricsPreferencePlugin(),
                    secureEnclavePlugin: Knox.SecureEnclavePreferencePlugin(),
                    biometricsSecureEnclavePlugin: Knox.BiometricsSecureEnclavePreferencePlugin()
                )
            )
        }
    }
}
