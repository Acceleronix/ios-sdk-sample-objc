# Acceleronix iOS App SDK Sample for Objective-C
This sample demonstrates the use of Acceleronix iOS App SDK to build an IoT app from scratch. Acceleronix iOS App SDK is divided into several functional groups to give developers a clear understanding of different features, including user registration, device binding and control, and device group settings. It supports binding both cellular and WiFi/Bluetooth devices. Device control can be performed via HTTP and WebSocket.

# Prerequisites
- Xcode 12.0 and later
- iOS 12 and later

# Use the sample

1. This demo relies on CocoaPods. If it's not installed, you can run the following commands:

```
sudo gem install cocoapods
pod setup
```

2. Clone or download this demo and navigate to the folder containing the Podfile, run the following commands:

```
pod install
```

3. Register a developer account on [AcceleronixCore IoT platform](https://core.acceleronix.io) and obtain the **userDomain** and **userDomainSecret**.

4. Open QuecIoTAppSdkDemo.xworkspace file using Xcode

5. In the **LoginViewController** file, initialize the **userDomain** and **userDomainSecret** configurations. After launching, select the appropriate data center:

```
static NSString * const UserDomainCN = @"";
static NSString * const UserSecretCN = @"";
static NSString * const UserDomainEU = @"";
static NSString * const UserSecretEU = @"";
static NSString * const UserDomainNA = @"";
static NSString * const UserSecretNA = @"";
```

# References
For more information on the Acceleronix iOS App SDK, please refer to the [API documentation](https://github.com/Acceleronix/ios-sdk-sample-objc/blob/main/API_doc_ios.md).
