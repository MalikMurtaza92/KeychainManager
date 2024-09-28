# KeychainManager

`KeychainManager.swift` is a Swift utility designed for securely managing user credentials in the iOS Keychain. This utility helps developers easily store, retrieve, update, and delete sensitive data like passwords within an iOS app.

## Features

- **Store credentials**: Securely save account and password data.
- **Retrieve credentials**: Retrieve stored passwords for a given account.
- **Update credentials**: Update existing credentials securely.
- **Delete credentials**: Remove credentials from the Keychain.
- **Error handling**: Handle common Keychain errors such as item not found, service errors, and data conversion errors.

---

## How to Use

### 1. **Installation**

To use the `KeychainManager` in your Xcode project:

1. Download or clone the repository.
2. Drag and drop `KeychainManager.swift` into your Xcode project.
3. Use the methods provided by the `KeychainManager.shared` singleton to manage credentials.

### 2. **Basic Usage**

#### Storing Credentials

```swift
do {
    try KeychainManager.shared.storeCredential(account: "user_account", password: "user_password")
} catch {
    print("Failed to store credentials: \(error.localizedDescription)")
}
```
#### Retrieving Credentials
```swift
do {
    if let password = try KeychainManager.shared.retrieveCredential(account: "user_account") {
        print("Password: \(password)")
    }
} catch {
    print("Failed to retrieve credentials: \(error.localizedDescription)")
}
```
#### Updating Credentials
```swift 
do {
    try KeychainManager.shared.updateCredential(account: "user_account", password: "new_password")
} catch {
    print("Failed to update credentials: \(error.localizedDescription)")
}
```

#### Deleting Credentials
```swift
do {
    try KeychainManager.shared.deleteCredential(account: "user_account")
    print("Credentials deleted successfully.")
} catch {
    print("Failed to delete credentials: \(error.localizedDescription)")
}
```

# How to Import Code Snippet into Xcode

1. Open Xcode.
2. Go to the Code Snippet Library by pressing `Shift + Command + L`.
3. Drag the `.codesnippet` file into the code snippet area in Xcode.

Alternatively, you can manually add the snippet:

1. Highlight the code you want to save as a snippet in Xcode.
2. Drag the highlighted code into the snippet library.
3. Add a Title, Summary, and Completion Shortcut for quick use in your code.

## Error Handling

The `KeychainManager` uses the `KeychainError` enum to handle different error cases:

- `itemNotFound`: When the requested item is not found in Keychain.
- `serviceError`: Communication issues with Keychain.
- `conversionError`: Data conversion issues from Keychain to the required format.
- `badData`: Corrupted or invalid data retrieved from Keychain.

```swift
do {
    try KeychainManager.shared.storeCredential(account: "user_account", password: "user_password")
} catch KeychainError.itemNotFound {
    print("Item not found.")
} catch {
    print("An error occurred: \(error.localizedDescription)")
}
```

## Conclusion

The `KeychainManager.swift` offers a simple and secure way to manage credentials in your iOS apps. Whether you’re saving, updating, or retrieving sensitive data, this utility makes it straightforward while handling errors gracefully.

For developers, this code snippet is also available in Xcode for easy integration into any project.
