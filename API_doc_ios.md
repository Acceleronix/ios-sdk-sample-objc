### IoT SDK API Introduction  

#### QuecIotSdk

#### Initialize SDK
```
//Other interface functions can be executed normally after this interface is executed

typedef NS_ENUM(NSUInteger, QuecCloudServiceType) { //Cloud service type
    QuecCloudServiceTypeChina = 0, //China
    QuecCloudServiceTypeEurope,    //Europe
    QuecCloudServiceTypeNorthAmerica,    //North America
};

- (void)startWithUserDomain:(NSString *)userDomain userDomainSecret:(NSString *)userDomainSecret cloudServiceType:(QuecCloudServiceType)cloudServiceType;
```

|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| userDomain |	Yes|User domain, generated when creating APP on DMP platform	| 
| userDomainSecret |	Yes|User domain secret, generated when creating APP on DMP platform	| 
| cloudServiceType |	Yes|Cloud service type, specifies which cloud service to connect to| 


#### Initialize SDK via Configuration (Can be used for private deployment)
```
//Other interface functions can be executed normally after this interface is executed

- (void)startWithConfig:(QuecPublicConfig *)config;
```

|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| config |	Yes| Configuration for initializing SDK	| 


#### Change debug mode

```
//Debug mode can be enabled during development to print logs for analysis.
- (void)setDebugMode:(BOOL)debugMode;

```

|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| debugMode |	Yes|Changes debug status	| 

#### Set country code

[List of countries supported by cloud services](https://iot-docs.acceleronix.io/introduction/page-05.html

```
//For example, China is entered as "86"
- (void)setDebugMode:(BOOL)debugMode;

```

|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| debugMode |	Yes|Changes debug status	| 


#### Account management related (QuecUserKit)
####   Set token expiration callback
```
- (void)setTokenInvalidCallBack:(void(^)(void))callBack;

```

|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| callBack |	No|Token expiration callback| 

####   Get token
```
- (NSString *)getToken;

```

|Parameter| Mandatory|Description|	
| --- | --- | --- | 

#### Get list of countries
```
- (void)getNationalityListWithSuccess:(void(^)(NSArray *list))success failure:(void(^)(NSError *error))failure;

```

|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	| 

#### Get list of time zones

```
- (void)getTimezoneListWithSuccess:(void(^)(NSArray *list))success failure:(void(^)(NSError *error))failure;

```


|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	| 

#### Get list of languages

```
- (void)getLanguageListWithSuccess:(void(^)(NSArray *list))success failure:(void(^)(NSError *error))failure;

```

|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	| 

#### Query whether a phone number is registered

```
- (void)queryPhoneIsRegister:(NSString *)phone internationalCode:(NSString *)internationalCode success:(void(^)(BOOL isRegister))success failure:(void(^)(NSError *error))failure;

```


|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| phone |	Yes|Phone number| 
| internationalCode |	No|International code, default is domestic| 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	| 

#### Email password login

```
- (void)loginByEmail:(NSString *)email password:(NSString *)password success:(void(^)())success failure:(void(^)(NSError *error))failure;

```


|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| email |	Yes|Email| 
| password |	Yes|Password| 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	| 

#### Email password registration

```
- (void)registerByEmail:(NSString *)email code:(NSString *) code password:(NSString *)password nationality:(NSInterger) nationality lang:(NSInterger)lang timezone:(NSInterger) timezone success:(void(^)())success failure:(void(^)(NSError *error))failure;

```


|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| email |	Yes|Email| 
| code |	Yes|Verification code| 
| password |	Yes|Password| 
| nationality |	No|Country| 
| lang |	No|Language| 
| timezone |	No|Time zone| 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	| 

#### Send email verification code

```
- (void)sendEmailWithType:(QuecEmailCodeType)type email:(NSString *)email success:(void(^)(void))success failure:(void(^)(NSError *error))failure;

```


|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| email |	Yes|Email| 
| type |Yes| QuecEmailCodeType type| 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	| 

#### Phone number password login

```
- (void)loginByPhone:(NSString *)phone password:(NSString *)password internationalCode:(NSString *)internationalCode  success:(void(^)())success failure:(void(^)(NSError *error))failure;

```



|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| phone |	Yes|Phone number| 
| internationalCode |	No|International code, default is domestic| 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	| 

#### Phone number verification code login

```
- (void)loginWithMobile:(NSString *)mobile code:(NSString *) code internationalCode:(NSString *)internationalCode  success:(void(^)())success failure:(void(^)(NSError *error))failure;

```


|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| mobile |	Yes|Phone number	| 
| password |	Yes|Password	| 
| internationalCode |	No|International code, default is domestic	| 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	| 

#### Phone number password registration

```
- (void)registerByPhone:(NSString *)phone code:(NSString *) code password:(NSString *)password internationalCode:(NSString *)internationalCode nationality:(NSInterger) nationality lang:(NSInterger)lang timezone:(NSInterger) timezone success:(void(^)())success failure:(void(^)(NSError *error))failure;

```


|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| phone |	Yes|Phone number| 
| code |	Yes|Verification code| 
| password |	Yes|Password| 
| internationalCode |	No|International code, default is domestic| 
| nationality |	No|Country| 
| lang |	No|Language| 
| timezone |	No|Time zone| 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|

#### Send phone verification code

```
- (void)sendVerifyCodeByPhone:(NSString *)phone
            internationalCode:(NSString *)internationalCode
                         type:(QuecVerifyCodeType)type
                         ssid:(NSString *)ssid
                         stid:(NSString *)stid
                      success:(void(^)(void))success failure:(void(^)(NSError *error))failure;

```


|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| phone |	Yes|Phone number| 
| internationalCode |Yes| International code| 
| type |Yes| QuecVerifyCodeType type| 
| ssid |No| Use type, can be omitted| 
| stid |No| Use type, can be omitted| 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	| 

#### Validate international phone number format

```
- (void)validateInternationalPhone:(NSString *)phone internationalCode:(NSString *)internationalCode success:(void(^)(NSDictionary *data))success failure:(void(^)(NSError *error))failure;

```


|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| phone |	Yes|Phone number| 
| internationalCode |Yes| International code| 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	| 

#### Validate SMS verification code

```
- (void)validateSmsCode:(NSString *)phone smsCode:(NSString *)smsCode internationalCode:(NSString *)internationalCode type:(NSInteger)type success:(void(^)())success failure:(void(^)(NSError *error))failure;

```

|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| phone |	Yes|Phone number| 
| smsCode |	Yes|Verification code| 
| internationalCode |	No|International code| 
| type |No| Whether the verification code is invalid after verification, 1: invalid, 2: not invalid, default 1| 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	| 


#### Modify phone number

```
- (void)updatePhone:(NSString *)newPhone newInternationalCode:(NSString *)newInternationalCode newPhoneCode:(NSString *)newPhoneCode oldPhone:(NSString *)oldPhone oldInternationalCode:(NSString *)oldInternationalCode oldPhoneCode:(NSString *)oldPhoneCode success:(void(^)())success failure:(void(^)(NSError *error))failure;

```

|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| newPhone |	Yes|New phone number| 
| newInternationalCode |	Yes|New phone number international code| 
| newPhoneCode |	Yes|New phone number verification code received| 
| oldPhone |	Yes|Original phone number| 
| oldInternationalCode |	Yes|Original phone number international code| 
| oldPhoneCode |	Yes|Original phone number verification code received| 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|

#### Modify user address

```
- (void)updateUserAddress:(NSString *)address success:(void(^)(void))success failure:(void(^)(NSError *error))failure;

```

|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| address |	No| Address | 
| headImage |	No|Avatar| 
| lang |	No|Language| 
| nationality |	No|Country| 
| nikeName |	No|Nickname| 
| sex |	No|Gender 0: male, 1: female, 2: confidential|
| timezone |	No|Time zone|  
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|


#### Modify user avatar

```
- (void)updateUserHeadIcon:(UIImage *)headImage success:(void(^)(void))success failure:(void(^)(NSError *error))failure;

```


|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| headImage |	Yes|Avatar| 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|


#### Modify language

```
- (void)updateLangWithLangId:(NSInteger)langId success:(void(^)(void))success failure:(void(^)(NSError *error))failure;

```


|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| langId |	Yes|Language ID|  
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|

#### Modify user nickname

```
- (void)updateUserNickName:(NSString *)nikeName success:(void(^)(void))success failure:(void(^)(NSError *error))failure;

```


|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| nikeName |	Yes|Nickname|  
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|

#### Modify user gender

```
- (void)updateUserSex:(NSInteger)sex success:(void(^)(void))success failure:(void(^)(NSError *error))failure;

```


|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| sex |	Yes|Gender 0: male, 1: female, 2: confidential|  
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|

#### Modify user time zone

```
- (void)updateUserTimeZoneWithTimeZoneId:(NSInteger)timeZoneId success:(void(^)(void))success failure:(void(^)(NSError *error))failure;

```

|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| timeZoneId |	Yes|Time zone ID|  
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|

#### Modify user country

```
- (void)updateUserNationLityWithNationalityId:(NSInteger)nationalityId success:(void(^)(void))success failure:(void(^)(NSError *error))failure;

```


|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| nationalityId |	Yes|Country ID|  
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|

#### Modify password

```
- (void)updatePassword:(NSString *)newPassword oldPassword:(NSString *)oldPassword success:(void(^)())success failure:(void(^)(NSError *error))failure;

```

|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| newPassword |	Yes| New password | 
| oldPassword |	Yes|Original password|  
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|

#### Delete user

```
- (void)deleteUser:(NSInterger)type success:(void(^)())success failure:(void(^)(NSError *error))failure;

```


|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| type |	No| Delete type: 1- immediate deletion, 2- deletion after 7 days, default 7 days after deletion |
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|

#### Read user information

```
- (void)getUserInfoWithSuccess:(void(^)(NSDictionary *data))success failure:(void(^)(NSError *error))failure;

```

|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|

#### User logout

```
- (void)logoutWithParams:(NSDictionary *)params success:(void(^)(void))success failure:(void(^)(NSError *error))failure;

```


|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| params |	No|Information to clear when logging out, such as deviceId (push ID)| 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|

#### User reset password via phone number and verification code

```
- (void)resetPasswordByPhone:(NSString *)phone code:(NSString *)code internationalCode:(NSString *)internationalCode password:(NSString *)password success:(void(^)(void))success failure:(void(^)(NSError *error))failure;

```


|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| code |	Yes|Verification code	|
| phone |	No|Phone number	|
| internationalCode |	No|International code, used together with phone number, default is domestic	|
| password |	No|Password for user reset, if not entered, default is 12345678 for successful callback	|
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|

#### User reset password via email and verification code

```
- (void)resetPasswordByEmail:(NSString *)email code:(NSString *)code internationalCode:(NSString *)internationalCode password:(NSString *)password success:(void(^)(void))success failure:(void(^)(NSError *error))failure;

```


|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| code |	Yes|Verification code	|
| email |	No|Email	|
| internationalCode |	No|International code, used together with phone number, default is domestic	|
| password |	No|Password for user reset, if not entered, default is 12345678 for successful callback	|
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|



#### One-key login via local phone number

```
- (void)oneKeyLoginByAppid:(NSString *)appid
                     msgid:(NSString *)msgid
               strictcheck:(NSString *)strictcheck
                systemtime:(NSString *)systemtime
                 appSecret:(NSString *)appSecret
                loginToken:(NSString *)loginToken
                   version:(NSString *)version
                   success:(void(^)(void))success
                   failure:(void(^)(NSError *error))failure;

```


|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| appid |	Yes|Appid applied for China Mobile Open Platform	|
| msgid |	Yes|uuid	|
| strictcheck |	No|0: No strong verification of server IP whitelist, 1: Strong verification of server IP whitelist	|
| systemtime |	No|System time yyyyMMddHHmmssSSS	|
| appSecret |	Yes|AppSecret applied for China Mobile Open Platform	|
| loginToken |	Yes|Token returned by China Mobile SDK after obtaining permission	|
| version |	Yes|Version	|
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|




#### Delete message

```
- (void)deleteMessageByMsgId:(NSString *)msgId language:(NSString *)language success:(void(^)(void))success failure:(void(^)(NSError *error))failure;

```


|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| msgId |	Yes|List of read message IDs separated by commas	|
| language |	No|Voice	|
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|


#### Query user types of received push messages

```
- (void)getReceiveMessagePushTypeWithSuccess:(void(^)(NSString *result))success failure:(void(^)(NSError *error))failure;

```

|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|


#### Read message

```
- (void)readMessageByMsgIdList:(NSString *)msgIdList msgType:(int)msgType success:(void(^)(NSDictionary *resultDict))success failure:(void(^)(NSError *error))failure;

```

|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| msgIdList |	No|List of read message IDs separated by commas, if not passed, all messages will be read| 
| msgType |	No|1: device notification, 2: device alarm, 3: device failure, 4: system message; any combination of received message types can be used, multiple types separated by commas| 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|



#### Set message type

```
- (void)setReceiveMessagePushTypeByMsgType:(NSString *)msgType success:(void(^)(void))success failure:(void(^)(NSError *error))failure;

```

|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| msgType |	Yes|1: device notification, 2: device alarm, 3: device failure, 4: system message; any combination of received message types can be used, multiple types separated by commas| 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|



#### Query message list

```
- (void)getUserMessageListByPageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize msgType:(NSInteger)msgType isRead:(BOOL)isRead deviceKey:(NSString *)deviceKey productKey:(NSString *)productKey success:(void(^)(NSArray<QuecUserMessageListModel *> *list, NSInteger total))success failure:(void(^)(NSError *error))failure;

```

|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| pageNumber |	No|List page to query, default 1	| 
| pageSize |	No|Page size to query, default 10	| 
| msgType |	No|1: device notification, 2: device alarm, 3: device failure, 4: system message; any combination of received message types can be used, multiple types separated by commas| 
| isRead |	No|Whether read	| 
| deviceKey |	No|device key	| 
| productKey |	No|product key	| 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|


#### Check if user is logged in

```
- (void)checkUserLoginState:(void(^)(BOOL isLogin))completion;

```

|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| completion |	Yes|Callback| 


#### Query whether email is registered

```
- (void)checkEmailRegister:(NSString *)email
                   success:(void(^)(BOOL isRegister))success
                   failure:(void(^)(NSError *error))failure;

```

|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|

#### Third-party user login

```
- (void)loginByAuthCode:(NSString *)authCode success:(void(^)(void))success failure:(void(^)(NSError *error))failure;

```

|Parameter| Mandatory|Description|	
| --- | --- | --- | 
| authCode |	Yes|authCode| 
| success |	No|Callback for successful login| 
| failure |	No|Callback for failed login| 

#### Device-related (QuecDeviceKit)
#### Get device list
```
- (void)getDeviceListWithPageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize success:(void(^)(NSArray<QuecDeviceModel *> *list, NSInteger total)) success failure:(QuecErrorBlock)failure;
```

|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| pageNumber |     No|Current page, default 1st page    | 
| pageSize |     No|Page size, default 10 items    | 
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    | 

#### Get device list
```
- (void)getDeviceListWithParams:(QuecDeviceListParamsModel *)params success:(void(^)(NSArray<QuecDeviceModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;

```

|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| params |     No| QuecDeviceListParamsModel type  | 
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    | 


#### Get device list - search by device name
```
- (void)getDeviceListByDeviceName:(NSString *)deviceName pageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize success:(void(^)(NSArray<QuecDeviceModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;
```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| deviceName |     No|Device name    |
| pageNumber |     No|Current page, default 1st page    | 
| pageSize |     No|Page size, default 10 items    | 
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    | 




#### Bind device via SN

```
- (void)bindDeviceBySerialNumber:(NSString *)serialNumber productKey:(NSString *)productKey deviceName:(NSString *)deviceName success:(void(^)())success failure:(void(^)(NSError *error))failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| serialNumber |     Yes|Device SN    | 
| productKey |     Yes|product key|
| deviceName |     No|Device name    |
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    | 

#### Bind device via authCode (Can be used for binding wifi/wifi+BLE devices)

```
- (void)bindDeviceByAuthCode:(NSString *)authCode productKey:(NSString *)productKey deviceKey:(NSString *)deviceKey deviceName:(NSString *)deviceName success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| authCode |     Yes|Device authCode    | 
| productKey |     Yes|product key    | 
| deviceKey |     Yes|device key|
| deviceName |     No|Device name    |
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    | 

####   Bind device via authCode + password (Can be used for binding bluetooth devices)

```
- (void)bindDeviceByAuthCode:(NSString *)authCode productKey:(NSString *)productKey deviceKey:(NSString *)deviceKey password:(NSString *)password deviceName:(NSString *)deviceName success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| authCode |     Yes|Device authCode    | 
| productKey |     Yes|product key    | 
| deviceKey |     Yes|device key|
| password |     Yes|Device password|
| deviceName |     No|Device name    |
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    | 


#### Unbind device

```
- (void)unbindDeviceWithDeviceKey:(NSString *)deviceKey productKey:(NSString *)productKey success:(void(^)())success failure:(void(^)(NSError *error))failure;

```

|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| deviceKey |     Yes|device key    | 
| productKey |     Yes|product key|
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    | 

#### Rename device

```
- (void)updateDeviceName:(NSString *)deviceName productKey:(NSString *)productKey deviceKey:(NSString *)deviceKey success:(void(^)())success failure:(void(^)(NSError *error))failure;

```

|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| deviceName |     Yes|Device name    | 
| productKey |     Yes|product key|
| deviceKey |     Yes|device key|
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    | 

#### Get device information via DK+PK

```
- (void)getDeviceInfoByDeviceKey:(NSString *)deviceKey productKey:(NSString *)productKey success:(void(^)(QuecDeviceModel *deviceModel))success failure:(void(^)(NSError *error))failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| deviceKey |     Yes|device key|
| productKey |     Yes|product key|
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    | 

#### Get product TSL

```
- (void)getProductTSLWithProductKey:(NSString *)productKey success:(void(^)(QuecProductTSLModel *tslModel))success failure:(void(^)(NSError *error))failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| productKey |     Yes|product key|
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    | 

#### Get device business attributes

```
- (void)getDeviceBusinessAttributesWithProductKey:(NSString *)productKey deviceKey:(NSString *)deviceKey gatewayPk:(NSString *)gatewayPk gatewayDk:(NSString *)gatewayDk codeList:(NSString *)codeList type:(NSString *)type success:(void (^)(QuecProductTSLInfoModel *tslInfoModel))success failure:(QuecErrorBlock)failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| productKey |     Yes|product key|
| deviceKey |     Yes|device key|
| gatewayDk |     No|Device Key of gateway|
| gatewayPk |     No|Product Key of gateway|
| codeList |     No|Identifier of attributes to query|
| type |     No|1: Query basic attributes of device, 2: Query model attributes, 3: Query location information; query types can be single or multiple, if multiple types of attributes are needed, use commas to separate|
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    |

#### Get device history trajectory

```
- (void)getLocationHistoryWithProductKey:(NSString *)productKey deviceKey:(NSString *)deviceKey startTimestamp:(NSInteger)startTimestamp endTimestamp:(NSInteger)endTimestamp gatewayDk:(NSString *)gatewayDk gatewayPk:(NSString *)gatewayPk locateTypes:(NSString *)locateTypes success:(void(^)(NSArray<QuecLocationHistoryModel *> *list))success failure:(QuecErrorBlock)failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| productKey |     Yes|product key|
| deviceKey |     Yes|device key|
| startTimestamp |     Yes| Start time (milliseconds since 1970) |
| endTimestamp |     Yes| End time (milliseconds since 1970) |
| gatewayDk |     No|Device Key of gateway|
| gatewayPk |     No|Product Key of gateway|
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    | 



#### Get device attribute chart list

```
- (void)getPropertyChartListWithProductKey:(NSString *)productKey deviceKey:(NSString *)deviceKey startTimestamp:(NSInteger)startTimestamp endTimestamp:(NSInteger)endTimestamp attributeCode:(NSString *)attributeCode gatewayDk:(NSString *)gatewayDk gatewayPk:(NSString *)gatewayPk countType:(NSInteger)countType timeGranularity:(NSInteger)timeGranularity success:(void(^)(NSArray *dataArray))success failure:(QuecErrorBlock)failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| productKey |     Yes|product key|
| deviceKey |     Yes|device key|
| startTimestamp |     Yes| Start time (milliseconds since 1970) |
| endTimestamp |     Yes| End time (milliseconds since 1970) |
| attributeCode |     No| Identifier of model attributes to query, multiple attributes separated by commas |
| gatewayDk |     No|Device Key of gateway|
| gatewayPk |     No|Product Key of gateway|
| countType |     No|Aggregation type (default 3): 1-maximum, 2-minimum, 3-average, 4-difference |
| timeGranularity |     No|Granularity of statistical time (default 2): 1-month, 2-day, 3-hour, 4-minute, 5-second |
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    | 


#### Get device attribute trend data

```
- (void)getPropertyStatisticsPathWithProductKey:(NSString *)productKey deviceKey:(NSString *)deviceKey currentTimestamp:(NSInteger)currentTimestamp attributeCode:(NSString *)attributeCode gatewayDk:(NSString *)gatewayDk gatewayPk:(NSString *)gatewayPk countType:(NSInteger)countType timeGranularities:(NSString *)timeGranularities success:(void(^)(NSArray *dataArray))success failure:(QuecErrorBlock)failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| productKey |     Yes|product key|
| deviceKey |     Yes|device key|
| currentTimestamp |     No| Current time (milliseconds since 1970) |
| attributeCode |     No| Identifier of model attributes to query, multiple attributes separated by commas |
| gatewayDk |     No|Device Key of gateway|
| gatewayPk |     No|Product Key of gateway|
| countType |     No|Aggregation type (default 3): 1-maximum, 2-minimum, 3-average, 4-difference |
| timeGranularity |     No|Granularity of statistical time (default 2): 1-month, 2-day, 3-hour, 4-minute, 5-second |
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    |


#### Get device attribute data list

```
- (void)getPropertyDataListWithProductKey:(NSString *)productKey deviceKey:(NSString *)deviceKey startTimestamp:(NSInteger)startTimestamp endTimestamp:(NSInteger)endTimestamp attributeCode:(NSString *)attributeCode gatewayDk:(NSString *)gatewayDk gatewayPk:(NSString *)gatewayPk pageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize success:(void(^)(NSArray<QuecPropertyDataListModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| productKey |     Yes|product key|
| deviceKey |     Yes|device key|
| startTimestamp |     Yes| Start time (milliseconds since 1970) |
| endTimestamp |     Yes| End time (milliseconds since 1970) |
| attributeCode |     No| Identifier of model attributes to query, multiple attributes separated by commas |
| gatewayDk |     No|Device Key of gateway|
| gatewayPk |     No|Product Key of gateway|
| pageNumber |     No|Current page, default 1|
| pageSize |     No|Page size, default 10 items|
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    | 



#### Create scheduled task

```
- (void)addCornJobWithCornJobModel:(QuecCornJobModel *)cornJobModel success:(void(^)(NSDictionary *data))success failure:(QuecErrorBlock)failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| cornJobModel |     Yes|QuecCornJobModel type|

#### Modify scheduled task

```
- (void)setCronJobWithCornJobModel:(QuecCornJobModel *)cornJobModel success:(void(^)(NSDictionary *data))success failure:(QuecErrorBlock)failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| cornJobModel |     Yes|QuecCornJobModel type|

#### Query scheduled tasks under device

```
- (void)getCronJobListWithDeviceKey:(NSString *)deviceKey productKey:(NSString *)productKey type:(NSString *)type pageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize success:(void(^)(NSArray<QuecCornJobModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| productKey |     Yes|product key|
| deviceKey |     Yes|device key|
| type |     No|Type of scheduled task, once: execute once, day-repeat: repeat every day, custom-repeat: custom repeat, multi-section: multi-section execution, random: random execution, delay: countdown (倒计时) |
| pageNumber |     No|Page number for paging, default: 1|
| pageSize |     No|Page size for paging, default: 10|
| success |     No|success block|
| failure |     No|failure block|


#### Query scheduled task details

```
- (void)getCronJobInfoWithRuleId:(NSString *)ruleId success:(void(^)(QuecCornJobModel *cornJobModel))success failure:(QuecErrorBlock)failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| ruleId |     Yes|ID of scheduled task|
| success |     No|success block|
| failure |     No|failure block|


#### Batch delete scheduled tasks

```
- (void)batchDeleteCronJobWithParams:(NSDictionary *)params success:(void(^)(NSDictionary *data))success failure:(QuecErrorBlock)failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| params |     Yes|{ruleIdList:[String scheduled task ID array]}|
| success |     No|success block|
| failure |     No|failure block|

#### Query number of scheduled tasks under product

```
- (void)getProductCornJobLimitWithProductKey:(NSString *)productKey success:(void(^)(NSInteger limit))success failure:(QuecErrorBlock)failure;
```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| productKey |     Yes|product key|
| success |     No|success block|
| failure |     No|failure block|


#### Bind device via authCode
 To be compatible with old methods, a return parameter has been added, which can be used for binding wifi/wifi+BLE devices

```
- (void)bindWifiDeviceByAuthCode:(NSString *)authCode productKey:(NSString *)productKey deviceKey:(NSString *)deviceKey deviceName:(NSString *)deviceName success:(void(^)(NSDictionary *dictionary))success failure:(QuecErrorBlock)failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| authCode |     Yes|Device authCode|
| productKey |     Yes|product key|
| deviceKey |     Yes|device key|
| deviceName |     No|Device name|
| success |     No|success block|
| failure |     No|failure block|


####   Query whether user can bind this device

```
- (void)getDeviceInfoByBindingByFid:(NSString *)fid productKey:(NSString *)productKey success:(void(^)(NSDictionary *dictionary))success failure:(QuecErrorBlock)failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| fid |     No|Family fid|
| productKey |     Yes|product key|
| success |     No|success block|
| failure |     No|failure block|

####   Query dk

```
- (void)getDeviceDkForSn:(NSString *)sn productKey:(NSString *)productKey success:(void(^)(NSDictionary *dictionary))success failure:(QuecErrorBlock)failure;
```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| sn |     Yes|sn|
| productKey |     Yes|product key|
| success |     No|success block|
| failure |     No|failure block|


####   Get device model and business attributes

```
- (void)getProductTslAndDeviceBusinessAttributesWithProductKey:(NSString *)productKey deviceKey:(NSString *)deviceKey gatewayPk:(NSString *)gatewayPk gatewayDk:(NSString *)gatewayDk codeList:(NSString *)codeList type:(NSString *)type success:(void (^)(NSArray *tslAndAttributesArray))success failure:(QuecErrorBlock)failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| productKey |     Yes|product key|
| deviceKey |     Yes|device key|
| gatewayDk |     No| Device Key of gateway|
| gatewayPk |     No|Product Key of gateway|
| codeList |     No|Identifier of attributes to query, and query type used together, if multiple attributes are queried, use commas to separate|
| type |     No|Query type, 1: Query basic attributes of device, 2: Query model attributes, 3: Query location information, if multiple types of attribute values are needed, use commas to separate|
| success |     No|success block|
| failure |     No|failure block|


####   Bind device via authCode
 Can be used for binding wifi/wifi+BLE devices, a new parameter for device network capability has been added to be compatible with old methods

```
- (void)bindWifiDeviceByAuthCode:(NSString *)authCode productKey:(NSString *)productKey deviceKey:(NSString *)deviceKey deviceName:(NSString *)deviceName capabilitiesBitmask:(NSInteger)capabilitiesBitmask success:(void(^)(NSDictionary *dictionary))success failure:(QuecErrorBlock)failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| authCode |     Yes|Device authCode|
| productKey |     Yes|product key|
| deviceKey |     Yes|device key|
| deviceName |     No|Device name|
| capabilitiesBitmask |     No|Device network capability|
| success |     No|success block|
| failure |     No|failure block|


####   Get device model
 Cache the latest device model, default to read from cache if no network

```
- (void)getProductTSLWithCacheByProductKey:(NSString *)productKey success:(void (^)(NSArray *properties))success failure:(QuecErrorBlock)failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| productKey |     Yes|product key|
| success |     No|success block|
| failure |     No|failure block|


#### Device batch control

```
- (void)sendDataToDevicesByHttpWithData:(NSString *)data deviceList:(NSArray *)deviceList type:(NSInteger)type dataFormat:(NSInteger )dataFormat success:(QuecDictionaryBlock)success failure:(QuecErrorBlock)failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| data |     Yes|JSON string in tsl format|
| type |     Yes|Type 1: transparent transmission, 2: attribute, 3: service|
| deviceList |     Yes|List of devices, [{"deviceKey":{"deviceKey":"", "productKey":""}}]| 
| dataFormat |     No| Data type 1: Hex 2: Text (when type is transparent transmission, dataFormat needs to be specified)|
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    |  


#### Device batch control

```
- (void)sendDataToDevicesByHttpWithData:(NSString *)data
                             deviceList:(NSArray *)deviceList
                                   type:(NSInteger)type
                              extraData:(NSDictionary *)extraData
                                success:(QuecDictionaryBlock)success
                                failure:(QuecErrorBlock)failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| data |     Yes|JSON string in tsl format|
| deviceList |     Yes|List of devices [{"deviceKey":"", "productKey":""}]| 
| type |     Yes|Type 1: transparent transmission, 2: attribute, 3: service|
| extraData |     No| {"cacheTime": 0, "isCache": 0,"isCover": 0,"qos": 0}|
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    | 

#### QuecDeviceService (Share) method

#### Get device information via share code

```
- (void)getDeviceInfoByShareCode:(NSString *)shareCode success:(void(^)(QuecDeviceModel *deviceModel))success failure:(void(^)(NSError *error))failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| shareCode |     Yes|Share code|
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    | 

#### Change share device name

```
- (void)updateDeviceNameByShareUserWithDeviceName:(NSString *)deviceName shareCode:(NSString *)shareCode success:(void(^)())success failure:(void(^)(NSError *error))failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| deviceName |     Yes|Device name    | 
| shareCode |     Yes|Share code|
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    | 

#### Get list of sharers for device

```
- (void)getDeviceShareUserListWithDeviceKey:(NSString *)deviceKey productKey:(NSString *)productKey success:(void(^)(NSArray <QuecShareUserModel *> *list))success failure:(void(^)(NSError *error))failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| deviceName |     Yes|Device name    | 
| productKey |     Yes|product key|
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    | 

#### Sharer cancels sharing

```
- (void)unShareDeviceByOwnerWithShareCode:(NSString *)shareCode success:(void(^)())success failure:(void(^)(NSError *error))failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| shareCode |     Yes|Share code    | 
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    | 

#### Sharer cancels sharing

```
- (void)unShareDeviceByShareUserWithShareCode:(NSString *)shareCode success:(void(^)())success failure:(void(^)(NSError *error))failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| shareCode |     Yes|Share code    | 
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    |

#### Sharer sets sharing information

```
- (void)setShareInfoByOwnerWithDeviceKey:(NSString *)deviceKey productKey:(NSString *)productKey acceptingExpireTime:(NSInteger) acceptingExpireTime coverMark:(NSInteger)coverMark isSharingAlwaysValid:(BOOL)isSharingAlwaysValid sharingExpireTime:(NSInteger)sharingExpireTime success:(void(^)(NSString *shareCode))success failure:(void(^)(NSError *error))failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| acceptingExpireTime |     Yes|Time stamp (milliseconds) for expiration of sharing QR code, indicating that the sharing will expire within this time stamp; if not filled in, it will be valid indefinitely|
| productKey |     Yes|product key    | 
| deviceKey |     Yes|device key    | 
| coverMark |     No|Cover flag: 1 directly cover the previous effective sharing (default) (covering the original sharing code); 2 add directly, allowing multiple to coexist; 3 only allow sharing time to be extended before covering the previous sharing|
| isSharingAlwaysValid |     No|Whether the device is permanently effective    | 
| sharingExpireTime |     No|Time stamp (milliseconds) for expiration of device use, indicating that the device can be used by the person who shares it, and this parameter is invalid when isSharingAlwaysValid is YES|
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    |


#### QuecDeviceService (Group) method

#### Get list of groups
```
- (void)getDeviceGroupListWithPageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize extra:(QuecDeviceGroupParamModel *)infoModel success:(void(^)(NSArray<QuecDeviceGroupInfoModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;

```

|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| pageNumber |     No| Page number    | 
| pageSize |     No| Number of data items per page    | 
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    |

#### Add device group
```
- (void)addDeviceGroupWithInfo:(QuecDeviceGroupParamModel *)groupInfoModel success:(void(^)(void))success failure:(void(^)(NSError *error))failure;

```

|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| groupInfoModel |     Yes| Information about group    | 
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    |

#### Modify device group
```
- (void)updateDeviceGroupInfoWithDeviceGroupId:(NSString *)deviceGroupId infoModel:(QuecDeviceGroupParamModel *)infoModel success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;

```

|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| deviceGroupId |     Yes| ID of group    | 
| infoModel |     Yes| Information about group    | 
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    |

#### Delete device group
```
- (void)deleteDeviceGroupWithDeviceGroupId:(NSString *)deviceGroupId success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;

```

|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| deviceGroupId |     Yes| ID of group    | 
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    |

#### Get group details
```
- (void)getDeviceGroupInfoWithDeviceGroupId:(NSString *)deviceGroupId success:(void(^)(QuecDeviceGroupInfoModel *model))success failure:(QuecErrorBlock)failure;

```

|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| deviceGroupId |     Yes| ID of group    | 
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    |


#### Get list of devices in group
```
- (void)getDeviceListWithDeviceGroupId:(NSString *)deviceGroupId deviceGroupName:(NSString *)deviceGroupName deviceKeyList:(NSString *)deviceKeyList productKey:(NSString *)productKey pageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize success:(void (^)(NSArray<QuecDeviceModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| deviceGroupId |     Yes| ID of group    | 
| deviceGroupName |     No| Name of group| 
| deviceKeyList |     No| List of device keys, multiple device keys separated by commas    | 
| productKey |     No| product key    | 
| pageNumber |     No| Page number, default 1    | 
| pageSize |     No| Page size, default 10 items    | 
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    |


#### Add device to group
```
- (void)addDeviceToGroupWithDeviceGroupId:(NSString *)deviceGroupId deviceList:(NSArray *)deviceList success:(void(^)(NSDictionary *data))success failure:(void(^)(NSError *error))failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| deviceGroupId |     Yes| ID of device group    | 
| deviceList |     Yes| List of devices, for example: [{"dk": "string","pk": "string"}] | 
| success |     No|Callback for successful API request, data example: "data": {"failureList": [{"data": {"dk": "string","pk": "string"},"msg": "string"}],"successList": [{"dk": "string","pk": "string"}]}    | 
| failure |     No|Callback for failed API request    |

 

#### Delete device from group
```
- (void)deleteDeviceFromGroupWithDeviceGroupId:(NSString *)deviceGroupId deviceList:(NSArray *)deviceList success:(void(^)(NSDictionary *data))success failure:(void(^)(NSError *error))failure;

```

|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| deviceGroupId |     Yes| ID of device group    | 
| deviceList |     Yes| List of devices, for example: [{"dk": "string","pk": "string"}] | 
| success |     No|Callback for successful API request, data example: "data": {"failureList": [{"data": {"dk": "string","pk": "string"},"msg": "string"}],"successList": [{"dk": "string","pk": "string"}]}    | 
| failure |     No|Callback for failed API request    |



#### Query list of device groups
```
- (void)getDeviceGroupListWithDeviceKey:(NSString *)deviceKey productKey:(NSString *)productKey success:(void(^)(NSArray<QuecDeviceGroupInfoModel *> *list, NSInteger total))success failure:(void(^)(NSError *error))failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| deviceKey |     Yes| device key    | 
| productKey |     Yes| product key| 
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    |


#### Query list of devices under gateway

```
- (void)getGatewayDeviceChildListWithDeviceKey:(NSString *)deviceKey productKey:(NSString *)productKey pageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize success:(void(^)(NSArray<QuecDeviceModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| deviceKey |     Yes| device key    | 
| productKey |     Yes| product key| 
| pageNumber |     No| Page number, default 1    | 
| pageSize |     No| Page size, default 10 items    | 
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    |

#### Query devices not in group

```
- (void)getDeviceListByNotInDeviceGroupWithPageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize groupId:(NSString *)groupId success:(void(^)(NSArray<QuecDeviceModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| pageNumber |     No| Page number, default 1    | 
| pageSize |     No| Page size, default 10 items    | 
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    |

#### Device association management - bind device
```
- (void)deviceAssociationWithList:(NSArray<QuecDeviceModel *> *)list master:(QuecDeviceModel *)masterDevice fid:(NSString *)fid success:(void (^)(void))success failure:(void (^)(NSError *))failure;
```

|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| list |     Yes|   List of devices | 
| masterDevice |     Yes|    Main device | 
| fid |     No|Family id, required when in home mode| 
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    |


#### Device association management - query relationship
```
- (void)deviceAssociationWithMaster:(QuecDeviceModel *)masterDevice fid:(NSString *)fid code:(NSString *)code success:(void(^)(NSDictionary *data))success failure:(void (^)(NSError *))failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| masterDevice |     Yes|    Main device | 
| fid |     No|Family id, required when in home mode| 
| code |     No|Model code|
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    |



#### Device association management - relationship release
```
- (void)deviceDisassociationWithDevice:(QuecDeviceModel *)model fid:(NSString *)fid success:(void (^)(void))success failure:(void (^)(NSError *))failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| model |     Yes|    Device | 
| fid |     No|Family id, required when in home mode| 
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    |


#### Device association management - relationship configuration
```
- (void)deviceAssociationConfigWithProductKey:(NSString *)productKey success:(void(^)(QuecDeviceAssociationConfig *config))success failure:(void (^)(NSError *))failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| productKey |     Yes|   product key | 
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    |

### QuecIotCacheService method
Current and device establish a channel connection, and before data exchange with the device, the device needs to be added to the cache queue, which will maintain the channel status of the device.

#### Initialize via pk and dk
```
- (void)addDeviceModelList:(NSArray<QuecDeviceModel *> *)deviceModelList;
```

|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| deviceModelList |     Yes|    List of devices | 


### QuecDevice method
This class mainly includes device control-related functions, such as sending data to the device, listening to data from the device, and automatically selecting an appropriate link for connection and data transmission based on the device's capabilities and the current APP and environment.

#### Initialize via pk and dk
```
- (nullable instancetype)initWithPk:(NSString *)pk dk:(NSString *)dk NS_DESIGNATED_INITIALIZER;
```

|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| productKey |     Yes|   product key | 
| deviceKey |     Yes | device key | 


#### Establish channel connection
```
- (void)connect;
```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 


#### Establish connection with specified channel
```
- (void)connectWithMode:(QuecIotChannelMode)mode;
```

|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| mode |     Yes|   QuecIotChannelMode type, channel mode | 


#### Disconnect
```
- (void)disconnect;
```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 


#### Disconnect specified channel
```
- (void)disconnectWithType:(QuecIotChannelType)type;
```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| mode |     Yes|   QuecIotChannelMode type, channel mode | 

#### Get connection status
```
- (QuecIotChannelBitMask)connectedState;
```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 


#### Delete device
```
- (void)remove:(nullable void(^)(void))success failure:(void(^)(NSError *error))failure;
```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| success |     No|    Callback for successful deletion | 
| failure |     No|    Callback for failed deletion | 


#### Write model
```
- (void)writeDps:(NSArray<QuecIotDataPoint*> *)dps success:(nullable void(^)(void))success failure:(void(^)(NSError *error))failure;
```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| dps |     Yes|    Model data | 
| success |     No|    Callback for successful writing | 
| failure |     No|    Callback for failed writing | 


#### Write model on specified channel
```
- (void)writeDps:(NSArray<QuecIotDataPoint*> *)dps mode:(QuecIotChannelMode)mode success:(nullable void(^)(void))success failure:(void(^)(NSError *error))failure;
```

|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| dps |     Yes|    Model data | 
| mode |     Yes|   QuecIotChannelMode type, channel mode | 
| success |     No|    Callback for successful writing | 
| failure |     No|    Callback for failed writing | 


#### Read model
```
- (void)readDps:(NSArray<QuecIotDataPoint*> *)dps success:(nullable void(^)(void))success failure:(void(^)(NSError *error))failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| dps |     Yes|    Model data | 
| success |     No|    Callback for successful reading | 
| failure |     No|    Callback for failed reading | 


#### Read model on specified channel
```
- (void)readDps:(NSArray<QuecIotDataPoint*> *)dps mode:(QuecIotChannelMode)mode success:(nullable void(^)(void))success failure:(void(^)(NSError *error))failure;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| dps |     Yes|    Model data | 
| mode |     Yes|   QuecIotChannelMode type, channel mode | 
| success |     No|    Callback for successful reading | 
| failure |     No|    Callback for failed reading | 


#### Update device status on cloud
```
- (void)updateDeviceCloudOnlineStatus:(int)cloudOnlineStatus;

```


|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| cloudOnlineStatus |     Yes|   0: offline, 1: online | 


#### Bluetooth communication related (QuecBleChannelKit)

#### Add listener
```
- (void)addListener:(id<QuecBleManagerDelegate>)delegate;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| delegate |	Yes|Object following QuecBleManagerDelegate	| 

#### Remove listener

```
- (void)removeListener:(id<QuecBleManagerDelegate>)delegate;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| delegate |	Yes|Object following QuecBleManagerDelegate	| 

#### Scan for peripherals

```
- (void)startScanWithFilier:(QuecBleFilterModel *)filter;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| filter |	No|QuecBleFilterModel, filter peripherals		| 

#### Stop scanning

```
- (void)stopScan;

```


#### Connect to peripheral

```
- (void)connectPeripheral:(QuecPeripheralModel *)peripheral;

```


|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| peripheral |	Yes|QuecPeripheralModel	| 

#### Disconnect peripheral connection

```
- (void)disconnectPeripheral:(QuecPeripheralModel *)peripheral;

```


|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| peripheral |	Yes|QuecPeripheralModel	| 


#### Send data to peripheral

```
- (void)sendCommandToPeripheral:(QuecPeripheralModel *)peripheral command:(QuecTtlvCommandModel *)command completion:(void(^)(BOOL timeout, QuecTtlvCommandModel *response))completion;

```


|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| peripheral |	Yes|QuecPeripheralModel	| 
| command |	Yes|QuecTtlvCommandModel	| 
| completion |	No| Completion callback	| 


#### Start channel AES128 encryption and decryption

```
- (void)startAES128EncryptAndDecryptWithPeripheral:(QuecPeripheralModel *)peripheral serviceUuid:(NSString *)serviceUuid key:(NSString *)key iv:(NSString *)iv;

```

 

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| peripheral |	Yes|QuecPeripheralModel	| 
| serviceUuid |	No| serviceUuid, default not used	| 
| key |	No| AES128 key	| 
| iv |	No| AES128 iv	| 



#### Stop channel AES128 encryption and decryption

```
- (void)stopAES128EncryptAndDecryptWithPeripheral:(QuecPeripheralModel *)peripheral serviceUuid:(NSString *)serviceUuid;

```


|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| peripheral |	Yes|QuecPeripheralModel	| 
| serviceUuid |	No| serviceUuid, default not used	| 


#### Get connection status of peripheral

```
- (BOOL)getPeripheralConnectState:(QuecPeripheralModel *)peripheral;

```

#### Device network configuration related (QuecSmartConfigKit)
#### ~~Add network configuration listener~~(Obsolete, use new API below)

```
- (void)addSmartConfigDelegate:(id<QuecSmartConfigDelegate>)delegate;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| delegate |	Yes| Object following QuecSmartConfigDelegate protocol	| 


#### ~~Remove network configuration listener~~(Obsolete, use new API below)

```
- (void)removeSmartConfigDelegate:(id<QuecSmartConfigDelegate>)delegate;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| delegate |	Yes| Object following QuecSmartConfigDelegate protocol	| 


#### ~~Start network configuration(Applicable to devices with wifi+BLE type)~~(Obsolete, use new API below)

```
- (void)startConfigDevices:(NSArray<QuecPeripheralModel *> *)devices ssid:(NSString *)ssid password:(NSString *)password;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| devices |	Yes| Data of peripherals obtained from BleChannel, supports batch addition	| 
| ssid |	No| wifi name	| 
| password |	No| wifi password	| 


#### ~~Cancel all operations related to domain network configuration~~(Obsolete, use new API below)

```
- (void)cancelConfigDevices;
```

### Device network configuration binding related (#import <QuecSmartconfigKit/QuecDevicePairingService.h>)

#### Scan for devices
Scan results refer to QuecPairingDelegate
```
- (void)scanWithFid:(NSString * _Nullable)fid filier:(QuecBleFilterModel * _Nullable)filter;
```
|Parameter|	Mandatory|  Description            |	
| --- | --- |---------------| 
| fid |	No|  Family id, required when in home mode | 
| filter |	No|  Filter conditions	       |

#### Stop scanning

```
- (void)stopScan;
```

#### Start pairing devices
Pairing progress and results refer to QuecPairingDelegate
```
- (void)startPairingByDevices:(NSArray<QuecPairingPeripheral *> *)pairingDevices fid:(NSString *)fid ssid:(NSString *)ssid pwd:(NSString *)pwd;
```
|Parameter|	Mandatory|  Description                        |	
| --- | --- |---------------------------| 
| devices |	Yes|  Data source to be bound	                   | 
| fid |	No|  Family id, if the input value is legal and not empty, it defaults to binding devices in home mode	 |
| ssid |	No| WiFi name	                   |
| pwd |	No| WiFi password	                   |

#### Cancel all device pairing

```
- (void)cancelAllDevicePairing;
```

#### Set WiFi network configuration timeout

```
- (BOOL)setWiFiPairingDuration:(int)duration;
```
|Parameter|	Mandatory|  Description            |	
| --- | --- |---------------|
| duration |	No| 60~120, default 120 seconds, unit: seconds	       |

#### Set Ble pairing timeout

```
- (BOOL)setBlePairingDuration:(int)duration;
```

|Parameter|	Mandatory|  Description            |	
| --- | --- |---------------|
| duration |	No| 30~60, default 60 seconds, unit: seconds	       |

#### Add pairing binding listener

```
- (void)addPairingListener:(id<QuecPairingDelegate>)listener;
```

|Parameter|	Mandatory|  Description    |	
| --- | --- |-------|
| listener |	No|  Proxy object	 |

#### Remove pairing binding listener

```
- (void)removePairingListener:(id<QuecPairingDelegate>)listener;
```

|Parameter|	Mandatory|  Description    |	
| --- | --- |-------|
| listener |	No|  Proxy object	 |

#### QuecPairingDelegate protocol method

```
/**
     Progress of pairing binding
    pairingPeripheral: current device being paired
    progress: progress of pairing binding (0~1)
*/
- (void)didUpdatePairingStatus:(QuecPairingPeripheral *)pairingPeripheral progress:(CGFloat)progress;
/**
     Result of pairing binding
    pairingPeripheral: current device being paired
    result: result of pairing binding
    error: detailed error of pairing binding failure
*/
- (void)didUpdatePairingResult:(QuecPairingPeripheral *)pairingPeripheral result:(BOOL)result error:(NSError *)error;
/**
     Scan for peripherals
    pairingPeripheral: peripheral object scanned
*/
- (void)centralDidDiscoverPairingPeripheral:(QuecPairingPeripheral *)pairingPeripheral;
```

#### QuecPairingPeripheral class
|Parameter| 	 Type | Description                    |	
| --- |----|-----------------------|
| productName | 	NSString  | Product name	                 |
| deviceName | 	NSString | Device name	                 |
| productLogo | 	NSString | Product image	                 |
| bindingMode | 	int | Binding mode: multi-bind: 1/unique: 2/rotating: 3	 |
| peripheralModel | 	QuecPeripheralModel | BLE device object scanned	           |

#### QuecPeripheralModel class

|Parameter| 	 Type | Description                            |	
| --- |----|-------------------------------|
| uuid | 	NSString  | Unique identifier of device	                       |
| pk | 	NSString | Device pk	                         |
| dk | 	NSString | Device dk	                         |
| mac | 	NSString | Bluetooth mac address	                      |
| isConfig | 	BOOL | Whether wifi device is configured, 1 indicates configured, 0 indicates not configured	 |
| isBind | 	BOOL | Whether pure Ble device is bound	                  |
| isEnableBind | 	BOOL | Whether pure Ble device allows binding	                 |
| capabilitiesBitmask | 	int | Bit0=1 indicates device supports WAN long-range communication ability bit1=1 indicates device supports WiFi LAN short-range communication ability bit2=1 indicates device supports BLE short-range communication ability	                   |

#### QuecPairingState code explanation

|Parameter| 	 Value   | Description                            |	
| --- |------|-------------------------------|
| QuecPairingWaiting | 	301 | Device pending binding	                       |
| QuecPairingBleConnecting | 	302 | Bluetooth connection in progress                         |
| QuecPairingBleConnectedFail | 	303 | Bluetooth connection failed                        |
| QuecPairingWiFiGetBindingCodeFail | 	304 | WiFi network configuration for devices, timed out without obtaining bindingcode	                      |
| QuecPairingWiFiBindingSuccess | 	305 | WiFi network configuration successful	 |
| QuecPairingWiFiBindingFail | 	306 | WiFi network configuration failed	                  |
| QuecPairingBleGetRandomFail | 	307 | Failed to ask Bluetooth device for random	                 |
| QuecPairingBleGetEncryptionCodeFail | 	308 | Failed to request encryption bindingcode from cloud	                  |
| QuecPairingBleCodeAuthFail | 	309 | Failed to authenticate Bluetooth device	                 |
| QuecPairingBleCodeAuthSuccess | 	310 | Successfully authenticated Bluetooth device	                  |
| QuecPairingBleBindingSuccess | 	311 | Bluetooth binding successful	                 |
| QuecPairingBleBindingFail | 	312 | Bluetooth binding failed                  |
| QuecPairingFail | 	313 | General abnormal scenario: binding failed, such as input parameter issues	                 |

### OTA SDK (QuecOTAUpgradeKit)

#### Bluetooth OTA
#### Query upgrade plan for single device

```
- (void)checkVersionWithProductKey:(NSString *)productKey
                         deviceKey:(NSString *)deviceKey
                         infoBlock:(void (^)(QuecBleOTAInfoModel * _Nullable infoModel))infoBlock;
```

|Parameter|	Mandatory|  Description                     |	
| --- | --- |------------------------|
| productKey |	Yes|  Device pk	                  |
| deviceKey |	Yes|  Device dk	                  |
| infoBlock |	Yes| QuecBleOTAInfoModel callback	 |

#### QuecBleOTAInfoModel class description

|Parameter| 	 Type  | Description                            |	
| --- |------|-------------------------------|
| pk | 	String | Device pk	                       |
| dk | 	String | Device dk                        |
| targetVersion | 	String | Version number of new version                      |
| componentNo | 	String | Component number                      |
| desc | 	String | Upgrade description	 |
| fileName | 	String | File name	                  |
| fileUrl | 	String | File download address	                 |
| fileSize | 	NSInteger | File size	                  |
| fileSign | 	String | File Hash256 value	                 |
| planId | 	NSInteger | ID of upgrade plan	                  |

#### Set callback for successful or failed OTA transmission
```
- (void)addStateListener:(id)delegate
               onSuccess:(OnSuccessBlock)onSuccess
                  onFail:(OnFailBlock)onFail;
```
|Parameter|	Mandatory|  Description    |	
| --- | --- |-------|
| delegate |	Yes| Proxy object	 |
| onSuccess |	Yes| Callback for successful transmission |
| OnFailBlock |	Yes| Callback for failed transmission |

#### Remove setting callback for successful or failed OTA transmission
```
- (void)removeStateListener:(id)delegate;
```
|Parameter|	Mandatory|  Description    |	
| --- | --- |-------|
| delegate |	Yes| Proxy object	 |

#### Set callback for OTA progress
```
- (void)addProgressListener:(id)delegate
           progressListener:(ProgressListenerBlock)progressListener;
```
|Parameter|	Mandatory|  Description                             |	
| --- | --- |--------------------------------|
| delegate |	Yes| Proxy object	                          |
| progressListener |	Yes| progress: current progress of single file transmission, range 0 - 1	 |

#### Remove OTA progress callback interface listener
```
- (void)removeProgressListener:(id)delegate;
```
|Parameter|	Mandatory|  Description    |	
| --- | --- |-------|
| delegate |	Yes| Proxy object	 |

#### Start OTA process for specified device
```
- (void)startOTAWithInfoList:(NSArray<QuecBleOTAInfoModel *> *)infoList;
```
|Parameter|	Mandatory|  Description                             |	
| --- | --- |--------------------------------|
| infoList |	Yes| Can pass multiple devices, method handles upgrading sequentially internally                          |


####   Cancel OTA process for specified device
```
- (void)stopOTAWithInfoList:(NSArray<QuecBleOTAInfoModel *> *)infoList;
```
|Parameter|	Mandatory|  Description                             |	
| --- | --- |--------------------------------|
| infoList |	Yes| Can pass multiple devices, method handles upgrading sequentially internally                          |

#### QuecBleOTAErrorType error code explanation

|Parameter|	Description|
| --- | --- |
| QuecBleOTAErrorTypeCommon |	Common error|
| QuecBleOTAErrorTypeNotConnect |	Bluetooth not connected|
| QuecBleOTAErrorTypeNoFilePath |	Upgrade file path does not exist|
| QuecBleOTAErrorTypeFileCheckFail |	Upgrade file verification failed|
| QuecBleOTAErrorTypeDeviceRefuse |	Device refuses upgrade|
| QuecBleOTAErrorTypeDeviceCancel |	Device cancels upgrade|
| QuecBleOTAErrorTypeDeviceFail |	Device upgrade failed|
| QuecBleOTAErrorTypeDeviceTimeout |	Upgrade timeout|

#### Http OTA (QuecHttpOTAService)
####   Query upgrade plan for device

```
- (void)getDeviceUpgradePlan:(NSString *)productKey deviceKey:(NSString *)deviceKey success:(void (^)(QuecOTAPlanModel *))success failure:(void (^)(NSError *))failure;
```

|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| productKey |     Yes|product key|
| deviceKey |     Yes|device key|
| success |     No|Callback for successful API request    | 
| failure |     No|Callback for failed API request    | 

#### QuecOTAPlanModel

|Parameter|  Type | Description                                                                    |    
| --- |----|-----------------------------------------------------------------------| 
| planId |  Yes  | ID of upgrade plan                                                                |
| planName |  Yes  | Name of upgrade plan                                                              |
| versionInfo |  Yes  | Version information                                                                  |
| dataType |  Yes  | Package type                                                                   |
| planStartTime |  No  | Start time of plan, unit ms                                                           | 
| planEndTime |  No  | End time of plan, unit ms                                                           | 
| appointStartTime |  Yes  | Start time of appointment, unit ms                                                           |
| appointEndTime |  Yes  | End time of appointment, unit ms                                                           |
| deviceStatus |  Yes  | 0-not upgraded, 1-upgrading, 2-upgrade successful, 3-upgrade failed                                          |
| userConfirmStatusDesc |  Yes  | User confirmation status, 0 not confirmed (default), 1 upgrade immediately (confirm upgrade at any time), 2 appointment upgrade (upgrade at specified time window), 3 (cancel appointment and cancel upgrade), 4 upgrade result confirmed |
| comVerList |  No  | Data source of component upgrade information QuecOTAComponetModel                                        | 
| autoUpgrade |  No  | Parameter not currently used                                                                | 
| deviceStatusDesc |  No  | Description of device upgrade status                                                              | 
| userConfirmStatus |  Yes  | User confirmation status: 0-not confirmed, 1-upgrade immediately                                                   |
| upgradeProgress |  Yes  | Upgrade progress                                                                  |
| productKey |  Yes  | Device pk                                                                  |
| deviceKey |  Yes  | Device dk                                                                  |

####   Query number of upgradable devices

```
- (void)getUserlsHaveDeviceUpgrade:(NSString *)fId success:(void (^)(NSInteger))success failure:(void (^)(NSError *))failure;
```

|Parameter|     Mandatory|  Description              |    
| --- | --- |-----------------| 
| fId |     Yes|  Family id, required when in home mode    |
| success |     No|  Callback for successful API request  | 
| failure |     No|  Callback for failed API request        | 

####   Devices with upgrade plans

```
- (void)getUpgradePlanDeviceList:(NSString *)fId page:(NSInteger)page pageSize:(NSInteger)pageSize success:(void (^)(QuecOTADeviceListModel *))success failure:(void (^)(NSError *))failure;
```

|Parameter|     Mandatory|Description|    
| --- | --- | --- | 
| fId |     Yes|Family id, required when in home mode|
| page |      No | Current page | 
| pageSize |      No | Number of items per page    | 
| success |     No|Callback for successful API request | 
| failure |     No|Callback for failed API request | 

#### QuecOTADeviceListModel class

|Parameter|  Type         | Description                    |    
| --- |------------|-----------------------| 
| page | NSInteger  | Current page                   |
| totalCount | NSInteger  | Total number                   |
| list | NSArray    | Data source of QuecOTADeviceModel |
| pageSize | NSInteger  | Number of items per page                  |

#### QuecOTADeviceModel class

|Parameter|  Type         | Description                             |    
| --- |------------|--------------------------------| 
| productKey | NSString  | Product pk                           |
| deviceKey | NSString  | Device dk                           |
| deviceName | NSString    | Device name                           |
| version | NSString  | Version number/name of upgrade plan                    |
| desc | NSString  | Description of upgrade plan/text of upgrade plan/remarks of upgrade package              |
| deviceStatus | NSInteger  | Device status: 0-not upgraded, 1-upgrading, 2-upgrade successful, 3-upgrade failed |
| productIcon | NSString  | Product Icon                         |
| enabledTime | NSString    | Not currently used                           |
| enabledTimeTs | NSTimeInterval  | Not currently used                           |
| planId | long long  | ID of upgrade plan                            |
| userConfirmStatus | NSInteger  | User confirmation status: 0-not confirmed, 1-upgrade immediately                           |

####   User batch confirms upgrade plan

```
- (void)userBatchConfirmUpgradeWithList:(NSArray<QuecOTAPlanParamModel *> *)list success:(void(^)(NSDictionary *data))success failure:(void (^)(NSError *error))failure;
```

|Parameter|     Mandatory|  Description       |    
| --- | --- |----------| 
| list |     Yes| Data source      |
| success |     No| Callback for successful API request | 
| failure |     No| Callback for failed API request | 

####    Batch query upgrade details for devices

```
- (void)getBatchUpgradeDetailsWithList:(NSArray<QuecOTAPlanParamModel *> *)list success:(void(^)(NSArray<QuecOTAPlanModel *> *data))success failure:(void (^)(NSError *error))failure;
```

|Parameter|     Mandatory|  Description       |    
| --- | --- |----------| 
| list |     Yes| Data source      |
| success |     No| Callback for successful API request | 
| failure |     No| Callback for failed API request | 

#### QuecOTAPlanParamModel class

|Parameter|  Type         | Description                             |    
| --- |------------|--------------------------------| 
| pk | NSString  | Product pk                           |
| dk | NSString  | Device dk                           |
| appointStartTime | NSTimeInterval    | Start time of appointment, unit ms, only used for confirming plan                           |
| appointEndTime | NSTimeInterval  | End time of appointment, unit ms, only used for confirming plan                   |
| operType | NSInteger  | Operation type: 1-upgrade immediately (confirm upgrade at any time) 2-appointment upgrade (upgrade at specified time window) 3-(cancel appointment and cancel upgrade) 5-retry              |
| planId | long long  | ID of upgrade plan |



##  Home SDK QuecSmartHomeKit

### QuecSmartHomeService class  

#### Get singleton object
```
+ (instancetype)sharedInstance;

```

#### Enable or disable home mode
```
- (void)enabledFamilyMode:(BOOL)familyMode success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| familyMode |	Yes|Enable or disable home mode	| 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	| 

#### Enable or disable automatic switching
```
- (void)enabledAutoSwitch:(BOOL)autoSwitch success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| autoSwitch |	Yes|Enable or disable automatic switching| 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	| 


#### Query home mode configuration of users
```
- (void)getFamilyModeConfigWithSuccess:(QuecDictionaryBlock)success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	| 

#### Create family
```
- (void)addFamilyWithFamilyParamModel:(QuecFamilyParamModel *)familyParamModel success:(QuecDictionaryBlock)success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| familyParamModel |	Yes|QuecFamilyParamModel| 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	| 



#### Modify family information
```
- (void)setFamilyWithFamilyParamModel:(QuecFamilyParamModel *)familyParamModel success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| familyParamModel |	Yes|QuecFamilyParamModel| 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	| 



#### Delete family
```
- (void)deleteFamilyWithFid:(NSString *)fid success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| fid |	Yes|Family id| 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	| 



#### Query current family
```
- (void)getCurrentFamilyWithFid:(NSString *)fid currentCoordinates:(NSString *)currentCoordinates success:(void(^)(QuecFamilyItemModel *))success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| fid |	No|Family id| 
| currentCoordinates |	No|Current GPS positioning coordinates, WGS84 coordinate system, format: 40.759186,-73.928204| 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	| 



#### Query list of families
```
- (void)getFamilyListWithRole:(NSString *)role pageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize success:(void(^)(NSArray <QuecFamilyItemModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| role |	No|Role, member role: 1-creator  2-administrator | 
| pageNumber |	No|Page number, default 1| 
| pageSize |	No|Page size, default 10| 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	| 


#### Query list of devices in family
```
- (void)getFamilyDeviceListWithFid:(NSString *)fid isAddOwnerDevice:(BOOL)isAddOwnerDevice deviceName:(NSString *)deviceName pageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize success:(void(^)(NSArray <QuecFamilyDeviceItemModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| fid |	Yes|Family id |
| isAddOwnerDevice |	No|Whether to add all devices of yourself | 
| deviceName |	No|Device name| 
| pageNumber |	No|Page number, default 1| 
| pageSize |	No|Page size, default 10| 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	| 



#### Add commonly used devices
```
- (void)addCommonUsedDeviceWithFid:(NSString *)fid deviceList:(NSArray *)deviceList success:(QuecDictionaryBlock)success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| fid |	Yes|Family id |
| deviceList |	Yes|List of devices: {@"dk":@"",@"pk":@""} | 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	| 




#### Remove commonly used devices
```
- (void)deleteCommonUsedDeviceWithFid:(NSString *)fid deviceList:(NSArray *)deviceList success:(QuecDictionaryBlock)success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| fid |	Yes|Family id |
| deviceList |	Yes|List of devices: {@"dk":@"",@"pk":@""} | 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	| 





#### Query list of commonly used devices
```
- (void)getCommonUsedDeviceListWithFid:(NSString *)fid pageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize success:(void(^)(NSArray <QuecFamilyDeviceItemModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| fid |	Yes|Family id |
| pageNumber |	No|Page number, default 1 | 
| pageSize |	No|Page size, default 10 | 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	| 




#### Create room
```
- (void)addFamilyRoomWithFid:(NSString *)fid roomName:(NSString *)roomName success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| fid |	Yes|Family id |
| roomName |	Yes|Room name | 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	| 





#### Set room
```
- (void)setFamilyRoomWithFrid:(NSString *)frid roomName:(NSString *)roomName success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| fid |	Yes|Family id |
| roomName |	Yes|Room name | 
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	| 



#### Delete room
```
- (void)deleteFamilyRoomsWithIds:(NSArray<NSString *> *)fridList success:(QuecDictionaryBlock)success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| fridList |	Yes| List of room IDs|
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|



####   Add device to room
```
- (void)addDeviceInFamilyRoomWithDeviceList:(NSArray *)deviceList success:(QuecDictionaryBlock)success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| deviceList |	Yes| List of devices: {@"dk":@"",@"pk":@"", @"oldFrid":@"",@"newFrid":@""}|
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|



####   Set room sorting
```
- (void)setFamilyRoomSortWithRoomRortList:(NSArray *)roomSortList success:(QuecDictionaryBlock)success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| roomSortList |	Yes| List of room sorting: @{@"frid":@"", @"roomSort":@""}|
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|



####   Query list of devices in room
```
- (void)getFamilyRoomDeviceListWithFrid:(NSString *)frid pageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize success:(void(^)(NSArray <QuecFamilyDeviceItemModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| frid |	Yes|  Family room ID|
| pageNumber |	No|  Page number, default 1|
| pageSize |	No|  Page size, default 10|
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|




####   Query list of rooms in family
```
- (void)getFamilyRoomListWithFid:(NSString *)fid pageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize success:(void(^)(NSArray <QuecFamilyRoomItemModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| fid |	Yes|  Family ID|
| pageNumber |	No|  Page number, default 1|
| pageSize |	No|  Page size, default 10|
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|



####   Invite family members
```
- (void)inviteFamilyMemberWithModel:(QuecInviteFamilyMemberParamModel *)inviteModel success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| inviteModel |	Yes| QuecInviteFamilyMemberParamModel, invitation information|
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|



####    Handle invitations from family members
```
- (void)familyMemberInviteHandleWithFid:(NSString *)fid decide:(NSInteger)decide success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| fid |	Yes|  Family ID|
| decide |	Yes|0: refuse invitation, 1: agree to invitation|
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|


####    Modify family member name
```
- (void)setFamilyMemberNameWithFid:(NSString *)fid memberUid:(NSString *)memberUid memberName:(NSString *)memberName success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| fid |	Yes|  Family ID|
| memberUid |	Yes|User ID of family member|
| memberName |	Yes|Name of family member|
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|



####    Modify family member role
```
- (void)setFamilyMemberRoleWithFid:(NSString *)fid memberUid:(NSString *)memberUid memberRole:(NSString *)memberRole success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| fid |	Yes|  Family ID|
| memberUid |	Yes|User ID of family member|
| memberRole |	Yes|2: administrator, 3: ordinary member|
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|



####    Remove family member
```
- (void)deleteFamilyMemberWithFid:(NSString *)fid memberUid:(NSString *)memberUid success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| fid |	Yes|  Family ID|
| memberUid |	Yes|User ID of family member|
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|


####    Leave family
```
- (void)leaveFamilyWithFid:(NSString *)fid success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| fid |	Yes|  Family ID|
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|



####   Query list of family members in family
```
- (void)getFamilyMemberListWithFid:(NSString *)fid pageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize success:(void(^)(NSArray<QuecFamilyMemberItemModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| fid |	Yes|  Family ID|
| pageNumber |	No|  Page number, default 1|
| pageSize |	No|  Page size, default 10|
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|




####    Query list of devices not invited
```
- (void)getFamilyInviteListWithPageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize success:(void(^)(NSArray <QuecInviteItemModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| pageNumber |	No|  Page number, default 1|
| pageSize |	No|  Page size, default 10|
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|




####    Query list of device groups in family
```
- (void)getFamilyGroupListWithFid:(NSString *)fid pageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize success:(void(^)(NSArray <QuecFamilyDeviceGroupInfoModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| fid |	Yes|  Family ID|
| pageNumber |	No|  Page number, default 1|
| pageSize |	No|  Page size, default 10|
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|




####   Bind device via SN
```
- (void)bindDeviceByFid:(NSString *)fid SerialNumber:(NSString *)serialNumber productKey:(NSString *)productKey deviceName:(NSString *)deviceName success:(void(^)(NSDictionary *dataDict))success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| fid |	Yes|  Family ID|
| serialNumber |	Yes|  Device SN code|
| productKey |	Yes| product key|
| deviceName |	No|  Device name|
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|




####   Add family device group
```
- (void)addFamilyDeviceGroupWithInfo:(QuecFamilyDeviceGroupModel *)groupInfoModel success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| groupInfoModel |	Yes| QuecFamilyDeviceGroupModel  , group information|
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|





####     Get list of groups
```
- (void)getDeviceGroupListWithFid:(NSString *)fid pageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize success:(void(^)(NSArray<QuecFamilyDeviceItemModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| fid |	Yes|  Family ID|
| pageNumber |	No|  Page number, default 1|
| pageSize |	No|  Page size, default 10|
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|





####     Bind device via authCode
 Can be used for binding wifi/wifi+BLE devices

```
- (void)bindDeviceByFid:(NSString *)fid authCode:(NSString *)authCode productKey:(NSString *)productKey deviceKey:(NSString *)deviceKey deviceName:(NSString *)deviceName success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| fid |	Yes|  Family ID|
| authCode |	Yes|  Device authCode|
| productKey |	Yes| product key|
| deviceKey |	Yes| device key|
| deviceName |	No| deviceName|
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|





####     Query list of devices not in family device group
```
- (void)getDeviceListByNotInDeviceGroupWithFid:(NSString *)fid PageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize groupId:(NSString *)groupId success:(void(^)(NSArray <QuecFamilyDeviceItemModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| fid |	Yes|  Family ID|
| pageNumber |	No|  Page number, default 1|
| pageSize |	No|  Page size, default 10|
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|



####     Bind device via authCode
 Can be used for binding wifi/wifi+BLE devices, compatible with old methods, new return parameters added

```
- (void)bindDeviceAndGetDeviceInfoByFid:(NSString *)fid authCode:(NSString *)authCode productKey:(NSString *)productKey deviceKey:(NSString *)deviceKey deviceName:(NSString *)deviceName success:(void (^)(NSDictionary *dictionary))success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| fid |	Yes|  Family ID|
| authCode |	Yes|  Device authCode|
| productKey |	Yes| product key|
| deviceKey |	Yes| device key|
| deviceName |	No| deviceName|
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|




####     Edit device information

```
- (void)setDeviceInfoWithModelArray:(NSArray<QuecSetDeviceInfoModel *> *)modelArray success:(void(^)(NSDictionary *dataDict))success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| modelArray |	Yes| Information about device|
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|




####     Bind device via authCode
 Can be used for binding wifi/wifi+BLE devices, compatible with old methods, new device network capability parameters added

```
- (void)bindWifiDeviceByFid:(NSString *)fid authCode:(NSString *)authCode productKey:(NSString *)productKey deviceKey:(NSString *)deviceKey deviceName:(NSString *)deviceName capabilitiesBitmask:(NSInteger)capabilitiesBitmask success:(void (^)(NSDictionary *dictionary))success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| fid |	Yes|  Family ID|
| authCode |	Yes|  Device authCode|
| productKey |	Yes| product key|
| deviceKey |	Yes| device key|
| deviceName |	No| deviceName|
| capabilitiesBitmask |	No| Device network capability|
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|



#### QuecFamilyDeviceGroupInfoModel

|Parameter|  Type | Description                                                                    |    
| --- |----|-----------------------------------------------------------------------| 
| name | NSString  | Name                                                                |
| fid | NSString  | Family ID                                                              |
| address | NSString  | Address                                                                  |
| contactPhoneList | NSString  | Contact list                                                                   |
| coordinate | NSString  | Latitude and longitude                                                           | 
| coordinateSystem | NSString  | Coordinate system                                                           | 
| descrip | NSString  | Description                                                           |
| manager | NSString  | Manager                                                           |
| managerType | NSString  | Manager type                                          |
| parentId | NSString  | Parent device group ID |
| extend | NSString  | Extended field                                        | 
| dgid | NSString  | Group ID                                                                | 
| owner | NSString  | Owner                                                              | 
| addTime | NSString  | Addition time                                                   |
| addTimeTs | NSInteger  | Addition timestamp                                                                  |



#### QuecFamilyDeviceGroupModel

|Parameter|  Type | Description                                                                    |    
| --- |----|-----------------------------------------------------------------------| 
| name | NSString  | Name                                                                |
| fid | NSString  | Family ID                                                              |
| address | NSString  | Address                                                                  |
| contactPhoneList | NSString  | Contact list                                                                   |
| coordinate | NSString  | Latitude and longitude                                                           | 
| coordinateSystem | NSString  | Coordinate system                                                           | 
| descrip | NSString  | Description                                                           |
| manager | NSString  | Manager                                                           |
| managerType | NSString  | Manager type                                          |
| parentId | NSString  | Parent device group ID |
| extend | NSString  | Extended field                                        |



#### QuecFamilyDeviceListParamsModel

|Parameter|  Type | Description                                                                    |    
| --- |----|-----------------------------------------------------------------------| 
| fid | NSString  | Family ID                                                                |
| isAddOwnerDevice | BOOL  | Whether to add all devices of yourself, not required                                                               |
| deviceName | NSString  | Search for device name, not required                                                                |
| pageNumber | NSInteger  | Page number, not required, default 1                                                                   |
| pageSize | NSInteger  | Page size, not required, default 10                                                           | 
| isGroupDeviceShow | BOOL  | Whether to display group devices, default default setting                                                           | 
| isAssociation | BOOL  | Query devices not associated, default false                                                           |
| secondItemCode | NSString  | Secondary category filtering, default empty                                                           |
| pkList | NSString  | Increase pklist, multiple pk separated by commas                                         |



#### QuecFamilyItemModel

|Parameter|  Type | Description                      |    
| --- |----|-------------------------| 
| fid | NSString  | Family ID                    |
| familyName | NSString  | Name                      |
| familyLocation | NSString  | Family location                    |
| familyCoordinates | NSString  | Family latitude and longitude                   |
| addTime | NSString  | Addition time                    | 
| addTimeTs | NSInteger  | Addition timestamp                   | 
| memberRole | NSInteger  | Role, 1-creator  2-administrator  3-ordinary member |
| currentRoom | QuecFamilyRoomItemModel  | Secondary model                    |
| rooms | NSArray<QuecFamilyRoomItemModel *>  | Secondary model      |


####   Update list of families
```
- (void)updateRooms:(NSArray<QuecFamilyRoomItemModel *> *)rooms;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| rooms |	Yes| NSArray<QuecFamilyRoomItemModel *>|


####   Set current room
```
- (void)setSelectRoom:(QuecFamilyRoomItemModel *)room;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| room |	Yes| QuecFamilyRoomItemModel|



#### QuecFamilyMemberItemModel

|Parameter|  Type | Description                  |    
| --- |----|---------------------| 
| uid | NSString  | User ID                |
| phone | NSString  | Phone number                  |
| nikeName | NSString  | Nickname                |
| sex | NSInteger  | Gender               |
| address | NSString  | Address                | 
| email | NSString  | Email               | 
| headimg | NSString  | Avatar |
| wechatMiniprogramUserId | NSString  | Wechat Mini Program ID                |
| wechatUnionId | NSString  | Wechat Union ID      |
| appleUserId | NSString  | Apple ID      |
| twitterUserId | NSInteger  | Twitter ID      |
| facebookUserId | NSString  | Facebook ID      |
| alipayUserId | NSString  | Alipay ID      |
| qqUserId | NSString  | QQ ID      |
| wechatOffiaccountUserId | NSString  | Wechat Offiaccount ID      |
| registerTime | NSString  | Registration time      |
| registerTimeTs | NSInteger  | Registration timestamp      |
| lastLoginTime | NSString  | Last login time |
| lastLoginTimeTs | NSInteger  | Last login timestamp |
| timezone | NSString  | Time zone  |
| nationality | NSString  | Country  |
| province | NSString  | Province   |
| city | NSString  | City   |
| lang | NSString  | Language   |
| status | NSInteger  | Status   |
| signature | NSString  | Signature   |
| remark | NSString  | Remarks   |
| memberRole | NSInteger  | Type of role   |
| memberName | NSString  | Name   |



#### QuecFamilyParamModel

|Parameter|  Type | Description                      |    
| --- |----|-------------------------| 
| fid | NSString  | Family ID, required when changing family information and deleting family, not required when creating family                    |
| familyName | NSString  | Name, required when creating family, not required when changing family                      |
| familyLocation | NSString  | Family location, not required                    |
| familyCoordinates | NSString  | Family latitude and longitude, WGS84 coordinate system, format: 40.759186,-73.928204, not required                   |
| familyRoomList | NSArray<NSString *>  | List of rooms, not required                    |



#### QuecFamilyRoomItemModel

|Parameter|  Type | Description                      |    
| --- |----|-------------------------| 
| fid | NSString  | Family ID                    |
| roomName | NSString  | Room name                      |
| roomSort | NSInteger  | Room sorting                    |



#### QuecInviteFamilyMemberParamModel

|Parameter|  Type | Description                      |    
| --- |----|-------------------------| 
| fid | NSString  | Family ID, required when inviting members, not required when inviting members                      |
| memberRole | NSString  | Member role: 2-administrator  3-ordinary member, required when inviting members                      |
| memberName | NSString  | Member name, not required when inviting members                      |
| invalidTime | NSInteger  | Expiry time of invitation, in milliseconds since 1970, required when inviting members                      |
| phone | NSString  | Phone number, not required when inviting members                      |
| email | NSString  | Email, not required when inviting members                      |
| uid | NSString  | User ID, not required when inviting members                      |



#### QuecInviteFamilyMemberParamModel

|Parameter|  Type | Description                      |    
| --- |----|-------------------------| 
| fid | NSString  | Family ID                    |
| familyName | NSString  | Name                      |
| familyLocation | NSString  | Family location                    |
| familyCoordinates | NSString  | Family latitude and longitude                   |
| addTime | NSString  | Addition time                    | 
| addTimeTs | NSInteger  | Addition timestamp                   |
| invalidTime | NSString  | Expiry time of invitation                    |



#### QuecSetDeviceInfoModel

|Parameter|  Type       | Description    |    
| --- |----------|-------| 
| fid | NSString | Family ID  |
| dk | NSString | Device dk  |
| pk | NSString | Device pk  |
| deviceName | NSString | Device name |
| isCommonUsed | BOOL     | Whether commonly used: true-commonly used, false-not commonly used  | 
| type | int       | Device type: 1-device in home, 2-device shared by user, 3-multi-bind mode device |
| oldFrid | NSString | Room ID to be removed  |
| selectFrid | NSString | Room ID to be added  |
| shareCode | NSString | Share code  |



##  Scene SDK QuecSceneKit

### QuecSceneService class

#### Get singleton object
```
+ (instancetype)sharedInstance;

```


####    Add new scene
```
- (void)addSceneWithSceneModel:(QuecSceneModel *)sceneModel success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| sceneModel |	Yes| QuecSceneModel|
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|



####    Edit scene
```
- (void)editSceneWithSceneModel:(QuecSceneModel *)sceneModel success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| sceneModel |	Yes| QuecSceneModel|
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|



####    Delete scene
```
- (void)deleteSceneWithFid:(NSString *)fid sceneId:(NSString *)sceneId success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | --- | --- | 
| fid |	Yes|  Family id|
| sceneId |	Yes|  Scene ID|
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|



####    Get list of scenes
```
- (void)getSceneListWithFid:(NSString *)fid pageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize success:(void(^)(NSArray<QuecSceneModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|	
| --- | -- | --- | 
| fid |	Yes|  Family id|
| pageNumber |	No|  Page number, default 1|
| pageSize |	No|  Page size, default 10|
| success |	No|Callback for successful API request	| 
| failure |	No|Callback for failed API request	|



####    Get list of commonly used scenes
```
- (void)getCommonSceneListWithFid:(NSString *)fid pageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize success:(void(^)(NSArray<QuecSceneModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|
| --- | -- | --- |
| fid |	Yes|  Family id|
| pageNumber |	No|  Page number, default 1|
| pageSize |	No|  Page size, default 10|
| success |	No|Callback for successful API request	|
| failure |	No|Callback for failed API request	|



####    Execute scene
```
- (void)executeSceneWithFid:(NSString *)fid sceneId:(NSString *)sceneId success:(void(^)(QuecActionExecuteResultModel *executeResultModel))success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|
| --- | -- | --- |
| fid |	Yes|  Family id|
| sceneId |	Yes|  Scene ID|
| success |	No|Callback for successful API request	|
| failure |	No|Callback for failed API request	|



####    Test scene
```
- (void)executeTestSceneWithSceneModel:(QuecSceneModel *)sceneModel success:(void(^)(QuecActionExecuteResultModel *executeResultModel))success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|
| --- | -- | --- |
| sceneModel |	Yes| QuecSceneModel|
| success |	No|Callback for successful API request	|
| failure |	No|Callback for failed API request	|



####    Query scene details
```
- (void)getSceneInfoWithFid:(NSString *)fid sceneId:(NSString *)sceneId success:(void(^)(QuecSceneModel * scene))success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|
| --- | -- | --- |
| fid |	No|  Family id|
| sceneId |	Yes|  Scene ID, required|
| success |	No|Callback for successful API request	|
| failure |	No|Callback for failed API request	|



####    Get list of scene logs
```
- (void)getSceneLogListWithFid:(NSString *)fid lastExecutionId:(long)lastExecutionId limit:(NSInteger)limit success:(void(^)(NSArray<QuecSceneLogItemModel *> *list))success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|
| --- | -- | --- |
| fid |	No|  Family id|
| lastExecutionId |	No| ID of last executed log|
| limit |	No| Number of logs|
| success |	No|Callback for successful API request	|
| failure |	No|Callback for failed API request	|



####    Get list of scene logs
```
- (void)clearSceneLogWithFid:(NSString *)fid success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|
| --- | -- | --- |
| fid |	No|  Family id|
| success |	No|Callback for successful API request	|
| failure |	No|Callback for failed API request	|



####    Get details of scene logs
```
- (void)getSceneLogDetailInfoWithExecutionId:(long)executionId success:(void(^)(QuecSceneLogItemModel *detailInfo))success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|
| --- | -- | --- |
| executionId |	Yes| ID of execution log of scene|
| success |	No|Callback for successful API request	|
| failure |	No|Callback for failed API request	|



####    Batch add commonly used scenes
```
- (void)batchAddCommonSceneWithFid:(NSString *)fid sceneList:(NSArray *)sceneList success:(void(^)(NSDictionary *data))success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|
| --- | -- | --- |
| fid |	No|  Family id|
| sceneList |	Yes| Array of scene IDs|
| success |	No|Callback for successful API request	|
| failure |	No|Callback for failed API request	|



####    Batch delete commonly used scenes
```
- (void)batchDeleteCommonSceneWithFid:(NSString *)fid sceneList:(NSArray *)sceneList success:(void(^)(NSDictionary *data))success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|
| --- | -- | --- |
| fid |	No|  Family id|
| sceneList |	Yes| Array of scene IDs|
| success |	No|Callback for successful API request	|
| failure |	No|Callback for failed API request	|



#### QuecActionExecuteResultModel

|Parameter|  Type       | Description    |    
| --- |----------|-------| 
| executeResult | BOOL | Execution result  |
| failCount | NSInteger | Number of failed results  |
| successCount | NSInteger | Number of successful results  |
| failActionList | NSArray<QuecFailActionModel *> | Successful results |
| isCommonUsed | BOOL     | Whether commonly used: true-commonly used, false-not commonly used  | 



#### QuecFailActionModel

|Parameter|  Type       | Description    |    
| --- |----------|-------| 
| productKey | NSString | Product pk  |
| deviceName | NSString | Device name  |
| imageLogo | NSString | Device image  |
| deviceKey | NSString | Device dk |



#### QuecSceneActionModel

|Parameter|  Type       | Description    |    
| --- |----------|-------| 
| code | NSString | Model code  |
| itemId | NSInteger | Model ID  |
| dataType | NSString | Data type of model  |
| name | NSString | Model name |
| subName | NSString | Name of model value  |
| subType | NSString | Subtype of model  |
| unit | NSString | Unit of model  |
| value | id | Model value 可能是基本数据类型，可能是NSArray<QuecSceneActionModel *>类型 |
| type | NSString | Model type |



#### QuecSceneLogItemModel

|Parameter|  Type       | Description    |    
| --- |----------|-------| 
| sceneId | NSString | Scene ID  |
| sceneName | NSString | Scene name  |
| sceneIcon | NSString | Scene icon  |
| executionId | long | Execution ID |
| executionTime | long | Execution time  |
| executionResult | int | Execution result  |
| executionList | NSArray<QuecSceneLogExecutionModel *> | Execution results  |



#### QuecSceneLogExecutionModel

|Parameter|  Type       | Description    |    
| --- |----------|-------| 
| productKey | NSString | Product pk  |
| deviceKey | NSString | Device dk  |
| deviceName | NSString | Device name  |
| logoImage | NSString | Device image |
| executionResult | int | Execution result  |
| actionResultList | NSArray<QuecSceneLogActionModel *> | Execution results  |



#### QuecSceneLogActionModel

|Parameter|  Type       | Description    |    
| --- |----------|-------| 
| result | BOOL | result  |
| reason | NSString | Reason  |
| createTime | long | Timestamp  |
| action | QuecSceneActionModel | Model |



#### QuecSceneModel

|Parameter|  Type       | Description    |    
| --- |----------|-------| 
| fid | NSString | Family ID  |
| isCommon | BOOL | Whether commonly used  |
| sceneInfo | long | Timestamp  |
| action | QuecSceneInfoModel | Scene details |



#### QuecSceneInfoModel

|Parameter|  Type       | Description    |    
| --- |----------|-------| 
| sceneId | NSString | Scene ID  |
| name | NSString | Scene name  |
| icon | NSString | Scene Icon  |
| metaDataList | NSArray<QuecSceneMetaDataModel *> | List of actions of scene devices |



#### QuecSceneMetaDataModel

|Parameter|  Type       | Description    |    
| --- |----------|-------| 
| actionList | NSArray<QuecSceneActionModel *> | List of actions of devices |
| deviceKey | NSString | Device dk  |
| productKey | NSString | Product pk  |
| deviceName | NSString | Device name |
| imageLogo | NSString | Device icon |
| deviceType | NSInteger | Device type 1 default ordinary device 2 group |



##  Automation SDK QuecAutomateKit

### QuecAutomateService class
####    Create automation
```
+ (void)addAutomationWithModel:(QuecAutomateModel *)model
                       success:(QuecVoidBlock)success
                       failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|
| --- | -- | --- |
| model |Yes| QuecAutomateModel|
| success |	No|Callback for successful API request	|
| failure |	No|Callback for failed API request	|



####    Edit automation
```
+ (void)editAutomationWithModel:(QuecAutomateModel *)model
                        success:(QuecVoidBlock)success
                        failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|
| --- | -- | --- |
| model |Yes| QuecAutomateModel|
| success |	No|Callback for successful API request	|
| failure |	No|Callback for failed API request	|



####    Query list of automations
```
+ (void)getAutomationListWithFid:(nullable NSString *)fid
                      pageNumber:(NSInteger)pageNumber
                        pageSize:(NSInteger)pageSize
                         success:(QuecAutomationModelsSuccessBlock)success
                         failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|
| --- | -- | --- |
| fid |No|  Family ID, required when home mode is enabled, otherwise not required|
| pageNumber |No|  Current page number, default 1|
| pageSize |No|  Number of items per page, default 10|
| success |	No|Callback for successful API request	|
| failure |	No|Callback for failed API request	|



####    Start or stop automation
```
+ (void)updateAutomationSwitchStatusWithFid:(nullable NSString *)fid
                               automationId:(long long)automationId
                                     status:(BOOL)status
                                    success:(QuecVoidBlock)success
                                    failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|
| --- | -- | --- |
| fid |No|  Family ID, required when home mode is enabled, otherwise not required|
| automationId |Yes|  Automation ID|
| status |Yes|  Status of automation, enabled: true, disabled: false|
| success |	No|Callback for successful API request	|
| failure |	No|Callback for failed API request	|

####    Delete automation
```
+ (void)deleteAutomationWithFid:(nullable NSString *)fid
                   automationId:(long long)automationId
                        success:(QuecVoidBlock)success
                        failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|
| --- | -- | --- |
| fid |No|  Family ID, required when home mode is enabled, otherwise not required|
| automationId |Yes|  Automation ID|
| success |	No|Callback for successful API request	|
| failure |	No|Callback for failed API request	|



####    Query automation details
```
+ (void)getAutomationInfoWithFid:(nullable NSString *)fid
                    automationId:(long long)automationId
                         success:(void(^)(QuecAutomateModel *model))success
                         failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|
| --- | -- | --- |
| fid |No|  Family ID, required when home mode is enabled, otherwise not required|
| automationId |Yes|  Automation ID|
| success |	No|Callback for successful API request	|
| failure |	No|Callback for failed API request	|



####    Test automation
```
+ (void)testAutomationInfoWithModel:(QuecAutomateModel *)automateModel
                            success:(void(^)(long long testResultId))success
                            failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|
| --- | -- | --- |
| automateModel |Yes| QuecAutomateModel|
| success |	No|Callback for successful API request	|
| failure |	No|Callback for failed API request	|



####    Query test results of automation
```
+ (void)getTestAutomationResultWithId:(long long)testResultId
                              success:(QuecAutomationResultSuccessBlock)success
                              failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|
| --- | -- | --- |
| testResultId |Yes|  ID of test result|
| success |	No|Callback for successful API request	|
| failure |	No|Callback for failed API request	|



####    Query linkage configuration
```
+ (void)getAutomationTSLWithProductKey:(NSString *)productKey
                                  type:(NSInteger)type
                               success:(QuecAutomationPropertySuccessBlock)success
                               failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|
| --- | -- | --- |
| productKey |Yes|  Product KEY|
| type |Yes|  Query type: 0: all, 1: condition, 2: action|
| success |	No|Callback for successful API request	|
| failure |	No|Callback for failed API request	|



####    Get list of automation logs
```
+ (void)getAutomationLogListWithFid:(NSString *)fid lastLogId:(long long)lastLogId limit:(NSInteger)limit success:(void(^)(NSArray<QuecAutomationLogItemModel *> *list))success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|
| --- | -- | --- |
| fid |No|  Family id|
| lastLogId |Yes|  Last log ID, used for paging|
| success |	No|Callback for successful API request	|
| failure |	No|Callback for failed API request	|

####    Get details of automation logs
```
+ (void)getAutomationLogDetailWithFid:(NSString *)fid logId:(long long)logId success:(void(^)(QuecAutomationLogItemModel *detailInfo))success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|
| --- | -- | --- |
| logId |Yes|  Log ID|
| success |	No|Callback for successful API request	|
| failure |	No|Callback for failed API request	|


####    Delete execution logs of automation
```
+ (void)clearAutomationLogsWithFid:(NSString *)fid success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|
| --- | -- | --- |
| fid |No|  Family id|
| success |	No|Callback for successful API request	|
| failure |	No|Callback for failed API request	|



#### QuecAutomateModel

|Parameter|  Type       | Description    |    
| --- |----------|-------| 
| automationId | long long | Automation ID  |
| fid | NSString | Family ID, required when home mode is enabled, otherwise not required  |
| conditionType | QuecAutomateConditionRuleType | Trigger type 1: any, 2: all  |
| name | NSString | Name of automation  |
| nameType | NSInteger | Method of generating name of automation, 1: system generated, 2: user input  |
| status | BOOL | Status of automation execution true: enabled, false: disabled  |
| precondition | QuecAutomationPreconditionModel | Effective time of automation  |
| conditions | NSArray<QuecAutomationConditionModel *> | Conditions for triggering automation  |
| actions | NSArray<QuecAutomationActionModel *> | Actions of automation execution  |



#### QuecAutomateConditionRuleType

|Parameter|  Type       | Description    |    
| --- |----------|-------| 
| QuecAutomateConditionRuleAny | NSInteger | 1: any  |
| QuecAutomateConditionRuleAny | NSInteger | 2: all  |



#### QuecAutomationPreconditionModel

|Parameter|  Type       | Description    |    
| --- |----------|-------| 
| effectDateType | QuecAutomateEffectDateType | Type of effective date. 0: every day, 1: every week, 2: every month, 3: specific date  |
| effectTimeType | QuecAutomateEffectTimeType | Type of effective time. 0: daytime, 1: night, 2: all day, 3: specific time period  |
| startTime | NSString | Start time. Required when type of effective time is all day or specific time period, in HH:mm format  |
| endTime | NSString | End time. Required when type of effective time is all day or specific time period, in HH:mm format  |
| effectDate | NSString | Effective date. Not required when type of effective date is every day, weekly: 1,2,3,...7 represents Monday to Sunday, monthly: 1-31, specific date: in MM-dd/MM-dd format, for example: 12-19/12-2  |
| regionName | NSString | Name of region  |
| location | NSString | Latitude and longitude  |
| timeZone | NSString | Time zone  |



#### QuecAutomationConditionModel

|Parameter|  Type       | Description    |    
| --- |----------|-------| 
| type | NSInteger | 0 device trigger 1 time trigger  |
| icon | NSString | Icon of device/group/scene  |
| name | NSString | Name of device/group/scene  |
| timer | QuecAutomationTimeModel | Time for triggering condition of automation  |
| productKey | NSString | Product PK  |
| deviceKey | NSString | Device DK  |
| property | QuecAutomationPropertyModel | Property of model  |
| sort | NSInteger | Order of condition, starting from 1  |



#### QuecAutomationActionModel

|Parameter|  Type       | Description    |    
| --- |----------|-------| 
| type | NSInteger | Type of action to execute. 1: delay, 2: device, 3: group, 4: scene  |
| icon | NSString | Icon of device/group/scene  |
| name | NSString | Name of device/group/scene  |
| productKey | NSString | Product PK  |
| deviceKey | NSString | Device DK  |
| sceneId | NSString | Scene ID  |
| delayTime | NSNumber | Delay time, in seconds  |
| property | QuecAutomationPropertyModel | Property of model  |
| sort | NSInteger | Order of condition, starting from 1  |



#### QuecAutomateEffectDateType

|Parameter|  Type       | Description    |    
| --- |----------|-------| 
| QuecAutomateEffectDateTypeEveryday | NSInteger | 0  every day  |
| QuecAutomateEffectDateTypeWeekly | NSInteger | 1  every week of |
| QuecAutomateEffectDateTypeMonthly | NSInteger | 2  every month  |
| QuecAutomateEffectDateTypeNamedDate | NSInteger | 3  specific date    |



#### QuecAutomateEffectTimeType

|Parameter|  Type       | Description    |    
| --- |----------|-------| 
| QuecAutomateEffectTimeTypeDaytime | NSInteger | 0  daytime  |
| QuecAutomateEffectTimeTypeNight | NSInteger | 1  night |
| QuecAutomateEffectTimeTypeWholeDay | NSInteger | 2  all day  |
| QuecAutomateEffectTimeTypeSpecificTimePeriod | NSInteger | 3  specific time period    |



#### QuecAutomationTimeModel

|Parameter|  Type       | Description    |    
| --- |----------|-------| 
| type | NSInteger | Type of timing time  timing time  0 only once 1 every day 2  custom  |
| time | NSString | Timing time |
| dayOfWeek | NSString | Week days combination for custom timing segments  |
| timeZone | NSString | Time zone    |



#### QuecAutomationPropertyModel

|Parameter|  Type       | Description    |    
| --- |----------|-------| 
| identifier | NSInteger | Model ID, since id is a keyword in Objective-C, identifier is used instead |
| code | NSString | Model code |
| dataType | NSString | Data type  |
| value | NSString | Value    |
| name | NSString | Model name    |
| compare | NSString | Operator for attribute value comparison    |
| unit | NSString | Unit    |
| subName | NSString | Description    |



#### QuecAutomationLogItemModel

|Parameter|  Type       | Description    |    
| --- |----------|-------| 
| logId | long long | ID of execution log  |
| automationId | long long | Automation ID |
| name | NSString | Name of automation  |
| icon | NSString | Icon of automation    |
| time | long long | Execution time    |
| result | NSInteger | Execution result: 0. success 1. failure 2. partial success    |
| logDetails | NSArray<QuecAutomationLogItemActionModel *> | Details of execution log    |

#### QuecAutomationLogItemActionModel

|Parameter|  Type       | Description    |    
| --- |----------|-------| 
| actionName | NSString | Name of executed action, device name/scene name/group ID  |
| actionIcon | NSString | Icon of executed action, device/group/group |
| type | NSInteger | Type of executed action. 2: device, 3: group, 4: scene  |
| result | BOOL | Execution result, 1: success, 0: failure    |
| action | QuecAutomationPropertyModel | Property of model    |
| executeTime | long long | Execution time    |


##  Group SDK QuecGroupKit

### QuecGroupService class


####    Create group
```
+ (void)createGroupWithBean:(QuecGroupCreateBean *)bean
                    success:(QuecCreateGroupSuccess)success
                    failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|
| --- | -- | --- |
| bean |Yes| QuecGroupCreateBean|
| success |	No|Callback for successful API request	|
| failure |	No|Callback for failed API request	|



####    Query group details
```
+ (void)getGroupInfoWithId:(NSString *)groupId
                   success:(QuecGroupBeanSuccess)success
                   failure:(QuecErrorBlock)failure;

```

|Parameter|	Mandatory|Description|
| --- | -- | --- |
| groupId |Yes|  Group ID|
| success |	No|Callback for successful API request	|
| failure |	No|Callback for failed API request	|



####    Query basic information about group
```

### IoT SDK API Introduction

#### QuecIotSdk

#### Initialize SDK
```
// After executing this interface, other interface functions can be executed normally

typedef NS_ENUM(NSUInteger, QuecCloudServiceType) { // Cloud service type
    QuecCloudServiceTypeChina = 0, // China
    QuecCloudServiceTypeEurope,    // Europe  
    QuecCloudServiceTypeNorthAmerica,    // North America
};

- (void)startWithUserDomain:(NSString *)userDomain userDomainSecret:(NSString *)userDomainSecret cloudServiceType:(QuecCloudServiceType)cloudServiceType;
```

|Parameter|Required|Description|	    
| --- | --- | --- | 
| userDomain |Yes|User domain, generated by creating an APP on the DMP platform| 
| userDomainSecret |Yes|User domain secret, generated by creating an APP on the DMP platform| 
| cloudServiceType |Yes|Cloud service type, specifies the cloud service to connect to| 


#### Initialize SDK with Configuration (for private deployment)
```
// After executing this interface, other interface functions can be executed normally

- (void)startWithConfig:(QuecPublicConfig *)config;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| config |Yes|Configuration for initializing the SDK| 


#### Change Debug Mode

```
// Debug mode can be enabled during development to print logs for problem analysis.
- (void)setDebugMode:(BOOL)debugMode;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| debugMode |Yes|Change debug status| 

#### Set Country Code

[Country list supported by cloud service](https://iot-cloud-docs.quectelcn.com/introduction/page-05.html)

```
// For example, pass "86" for China
- (void)setCountryCode:(NSString *)countryCode;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| countryCode |Yes|Country code| 


#### Account Management (QuecUserKit)
#### Set Token Expiry Callback
```
- (void)setTokenInvalidCallBack:(void(^)(void))callBack;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| callBack |No|Token expiry callback| 

#### Get Token
```
- (NSString *)getToken;
```

|Parameter|Required|Description|	
| --- | --- | --- | 

#### Get Country List
```
- (void)getNationalityListWithSuccess:(void(^)(NSArray *list))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 

#### Get Timezone List

```
- (void)getTimezoneListWithSuccess:(void(^)(NSArray *list))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 

#### Get Language List

```
- (void)getLanguageListWithSuccess:(void(^)(NSArray *list))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 

#### Check if Phone Number is Registered

```
- (void)queryPhoneIsRegister:(NSString *)phone internationalCode:(NSString *)internationalCode success:(void(^)(BOOL isRegister))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| phone |Yes|Phone number| 
| internationalCode |No|International code, default is domestic| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 

#### Email and Password Login

```
- (void)loginByEmail:(NSString *)email password:(NSString *)password success:(void(^)())success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| email |Yes|Email| 
| password |Yes|Password| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 

#### Email and Password Registration

```
- (void)registerByEmail:(NSString *)email code:(NSString *) code password:(NSString *)password nationality:(NSInteger) nationality lang:(NSInteger)lang timezone:(NSInteger) timezone success:(void(^)())success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| email |Yes|Email| 
| code |Yes|Verification code| 
| password |Yes|Password| 
| nationality |No|Country| 
| lang |No|Language| 
| timezone |No|Timezone| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 

#### Send Email Verification Code

```
- (void)sendEmailWithType:(QuecEmailCodeType)type email:(NSString *)email success:(void(^)(void))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| email |Yes|Email| 
| type |Yes|QuecEmailCodeType type| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 

#### Phone Number and Password Login

```
- (void)loginByPhone:(NSString *)phone password:(NSString *)password internationalCode:(NSString *)internationalCode  success:(void(^)())success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| phone |Yes|Phone number| 
| internationalCode |No|International code, default is domestic| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 

#### Phone Number and Verification Code Login

```
- (void)loginWithMobile:(NSString *)mobile code:(NSString *) code internationalCode:(NSString *)internationalCode  success:(void(^)())success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| mobile |Yes|Phone number| 
| code |Yes|Verification code| 
| internationalCode |No|International code, default is domestic| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 

#### Phone Number and Password Registration

```
- (void)registerByPhone:(NSString *)phone code:(NSString *) code password:(NSString *)password internationalCode:(NSString *)internationalCode nationality:(NSInteger) nationality lang:(NSInteger)lang timezone:(NSInteger) timezone success:(void(^)())success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| phone |Yes|Phone number| 
| code |Yes|Verification code| 
| password |Yes|Password| 
| internationalCode |No|International code, default is domestic| 
| nationality |No|Country| 
| lang |No|Language| 
| timezone |No|Timezone| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|

#### Send Phone Verification Code

```
- (void)sendVerifyCodeByPhone:(NSString *)phone
            internationalCode:(NSString *)internationalCode
                         type:(QuecVerifyCodeType)type
                         ssid:(NSString *)ssid
                         stid:(NSString *)stid
                      success:(void(^)(void))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| phone |Yes|Phone number| 
| internationalCode |Yes|International code| 
| type |Yes|QuecVerifyCodeType type| 
| ssid |No|SSID, optional| 
| stid |No|STID, optional| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 

#### Validate International Phone Number Format

```
- (void)validateInternationalPhone:(NSString *)phone internationalCode:(NSString *)internationalCode success:(void(^)(NSDictionary *data))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| phone |Yes|Phone number| 
| internationalCode |Yes|International code| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 

#### Validate SMS Verification Code

```
- (void)validateSmsCode:(NSString *)phone smsCode:(NSString *)smsCode internationalCode:(NSString *)internationalCode type:(NSInteger)type success:(void(^)())success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| phone |Yes|Phone number| 
| smsCode |Yes|Verification code| 
| internationalCode |No|International code| 
| type |No|Verification code validation type, 1: invalid after verification, 2: not invalid, default is 1| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 


#### Change Phone Number

```
- (void)updatePhone:(NSString *)newPhone newInternationalCode:(NSString *)newInternationalCode newPhoneCode:(NSString *)newPhoneCode oldPhone:(NSString *)oldPhone oldInternationalCode:(NSString *)oldInternationalCode oldPhoneCode:(NSString *)oldPhoneCode success:(void(^)())success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| newPhone |Yes|New phone number| 
| newInternationalCode |Yes|New phone number international code| 
| newPhoneCode |Yes|Verification code received by the new phone number| 
| oldPhone |Yes|Old phone number| 
| oldInternationalCode |Yes|Old phone number international code| 
| oldPhoneCode |Yes|Verification code received by the old phone number| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|

#### Change User Address

```
- (void)updateUserAddress:(NSString *)address success:(void(^)(void))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| address |No|Address| 
| headImage |No|Profile picture| 
| lang |No|Language| 
| nationality |No|Country| 
| nikeName |No|Nickname| 
| sex |No|Gender 0: Male 1: Female 2: Secret|
| timezone |No|Timezone|  
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|


#### Change User Profile Picture

```
- (void)updateUserHeadIcon:(UIImage *)headImage success:(void(^)(void))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| headImage |Yes|Profile picture| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|


#### Change Language

```
- (void)updateLangWithLangId:(NSInteger)langId success:(void(^)(void))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| langId |Yes|Language Id|  
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|

#### Change User Nickname

```
- (void)updateUserNickName:(NSString *)nikeName success:(void(^)(void))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| nikeName |Yes|Nickname|  
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|

#### Change User Gender

```
- (void)updateUserSex:(NSInteger)sex success:(void(^)(void))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| sex |Yes|Gender 0: Male 1: Female 2: Secret|  
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|

#### Change User Timezone

```
- (void)updateUserTimeZoneWithTimeZoneId:(NSInteger)timeZoneId success:(void(^)(void))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| timeZoneId |Yes|Timezone Id|  
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|

#### Change User Country

```
- (void)updateUserNationLityWithNationalityId:(NSInteger)nationalityId success:(void(^)(void))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| nationalityId |Yes|Country Id|  
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|

#### Change Password

```
- (void)updatePassword:(NSString *)newPassword oldPassword:(NSString *)oldPassword success:(void(^)())success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| newPassword |Yes|New password| 
| oldPassword |Yes|Old password|  
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|

#### Delete User

```
- (void)deleteUser:(NSInteger)type success:(void(^)())success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| type |No|Delete type: 1- Immediate deletion 2- Deletion after 7 days, default is 7 days later|
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|

#### Read User Information

```
- (void)getUserInfoWithSuccess:(void(^)(NSDictionary *data))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|

#### User Logout

```
- (void)logoutWithParams:(NSDictionary *)params success:(void(^)(void))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| params |No|Information to be cleared when logging out, such as deviceId (push id)| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|

#### Reset Password via Phone Number and Verification Code

```
- (void)resetPasswordByPhone:(NSString *)phone code:(NSString *)code internationalCode:(NSString *)internationalCode password:(NSString *)password success:(void(^)(void))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| code |Yes|Verification code| 
| phone |No|Phone number| 
| internationalCode |No|International code, used with phone number, default is domestic| 
| password |No|User reset password, if not entered, the default is 12345678| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|

#### Reset Password via Email and Verification Code

```
- (void)resetPasswordByEmail:(NSString *)email code:(NSString *)code internationalCode:(NSString *)internationalCode password:(NSString *)password success:(void(^)(void))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| code |Yes|Verification code| 
| email |No|Email| 
| internationalCode |No|International code, used with phone number, default is domestic| 
| password |No|User reset password, if not entered, the default is 12345678| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### One-Click Login with Local Phone Number

```
- (void)oneKeyLoginByAppid:(NSString *)appid
                     msgid:(NSString *)msgid
               strictcheck:(NSString *)strictcheck
                systemtime:(NSString *)systemtime
                 appSecret:(NSString *)appSecret
                loginToken:(NSString *)loginToken
                   version:(NSString *)version
                   success:(void(^)(void))success
                   failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| appid |Yes|Appid applied from China Mobile Open Platform| 
| msgid |Yes|UUID| 
| strictcheck |No|0: Do not perform strict verification on the server IP whitelist, 1: Perform strict verification on the server IP whitelist| 
| systemtime |No|System time yyyyMMddHHmmssSSS| 
| appSecret |Yes|AppSecret applied from China Mobile Open Platform| 
| loginToken |Yes|Token returned by the mobile SDK after obtaining permission| 
| version |Yes|Version| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|




#### Delete Message

```
- (void)deleteMessageByMsgId:(NSString *)msgId language:(NSString *)language success:(void(^)(void))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| msgId |Yes|List of message IDs to be read, multiple IDs are separated by commas| 
| language |No|Language| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|


#### Query User's Message Push Types

```
- (void)getReceiveMessagePushTypeWithSuccess:(void(^)(NSString *result))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|


#### Read Message

```
- (void)readMessageByMsgIdList:(NSString *)msgIdList msgType:(int)msgType success:(void(^)(NSDictionary *resultDict))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| msgIdList |No|List of message IDs to be read, multiple IDs are separated by commas, if not passed, all messages will be read| 
| msgType |No|1: Device notification, 2: Device alarm, 3: Device fault, 4: System message; The types of messages received can be any combination, multiple types are separated by commas| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Set Message Types

```
- (void)setReceiveMessagePushTypeByMsgType:(NSString *)msgType success:(void(^)(void))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| msgType |Yes|1: Device notification, 2: Device alarm, 3: Device fault, 4: System message; The types of messages received can be any combination, multiple types are separated by commas| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Query Message List

```
- (void)getUserMessageListByPageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize msgType:(NSInteger)msgType isRead:(BOOL)isRead deviceKey:(NSString *)deviceKey productKey:(NSString *)productKey success:(void(^)(NSArray<QuecUserMessageListModel *> *list, NSInteger total))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| pageNumber |No|Page number, default is 1| 
| pageSize |No|Page size, default is 10| 
| msgType |No|1: Device notification, 2: Device alarm, 3: Device fault, 4: System message; The types of messages received can be any combination, multiple types are separated by commas| 
| isRead |No|Whether it has been read| 
| deviceKey |No|Device key| 
| productKey |No|Product key| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|


#### Check if User is Logged In

```
- (void)checkUserLoginState:(void(^)(BOOL isLogin))completion;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| completion |Yes|Callback| 


#### Check if Email is Registered

```
- (void)checkEmailRegister:(NSString *)email
                   success:(void(^)(BOOL isRegister))success
                   failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|

#### Third-Party User Login

```
- (void)loginByAuthCode:(NSString *)authCode success:(void(^)(void))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|	
| --- | --- | --- | 
| authCode |Yes|Auth code| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 

#### Device Management (QuecDeviceKit)
#### Get Device List
```
- (void)getDeviceListWithPageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize success:(void(^)(NSArray<QuecDeviceModel *> *list, NSInteger total)) success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| pageNumber |No|Current page, default is page 1| 
| pageSize |No|Page size, default is 10| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 

#### Get Device List
```
- (void)getDeviceListWithParams:(QuecDeviceListParamsModel *)params success:(void(^)(NSArray<QuecDeviceModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| params |No|QuecDeviceListParamsModel type| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 


#### Get Device List by Device Name
```
- (void)getDeviceListByDeviceName:(NSString *)deviceName pageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize success:(void(^)(NSArray<QuecDeviceModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| deviceName |No|Device name| 
| pageNumber |No|Current page, default is page 1| 
| pageSize |No|Page size, default is 10| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 


#### Bind Device by Serial Number

```
- (void)bindDeviceBySerialNumber:(NSString *)serialNumber productKey:(NSString *)productKey deviceName:(NSString *)deviceName success:(void(^)())success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| serialNumber |Yes|Device serial number| 
| productKey |Yes|Product key| 
| deviceName |No|Device name| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 

#### Bind Device by Auth Code (for WiFi/WiFi+Bluetooth devices)

```
- (void)bindDeviceByAuthCode:(NSString *)authCode productKey:(NSString *)productKey deviceKey:(NSString *)deviceKey deviceName:(NSString *)deviceName success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| authCode |Yes|Device auth code| 
| productKey |Yes|Product key| 
| deviceKey |Yes|Device key| 
| deviceName |No|Device name| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 

#### Bind Device by Auth Code + Password (for Bluetooth devices)

```
- (void)bindDeviceByAuthCode:(NSString *)authCode productKey:(NSString *)productKey deviceKey:(NSString *)deviceKey password:(NSString *)password deviceName:(NSString *)deviceName success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| authCode |Yes|Device auth code| 
| productKey |Yes|Product key| 
| deviceKey |Yes|Device key| 
| password |Yes|Device password| 
| deviceName |No|Device name| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 


#### Unbind Device

```
- (void)unbindDeviceWithDeviceKey:(NSString *)deviceKey productKey:(NSString *)productKey success:(void(^)())success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| deviceKey |Yes|Device key| 
| productKey |Yes|Product key| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 

#### Rename Device

```
- (void)updateDeviceName:(NSString *)deviceName productKey:(NSString *)productKey deviceKey:(NSString *)deviceKey success:(void(^)())success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| deviceName |Yes|Device name| 
| productKey |Yes|Product key| 
| deviceKey |Yes|Device key| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 

#### Get Device Info by Device Key and Product Key

```
- (void)getDeviceInfoByDeviceKey:(NSString *)deviceKey productKey:(NSString *)productKey success:(void(^)(QuecDeviceModel *deviceModel))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| deviceKey |Yes|Device key| 
| productKey |Yes|Product key| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 

#### Get Product TSL

```
- (void)getProductTSLWithProductKey:(NSString *)productKey success:(void(^)(QuecProductTSLModel *tslModel))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| productKey |Yes|Product key| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 

#### Get Device Business Attributes

```
- (void)getDeviceBusinessAttributesWithProductKey:(NSString *)productKey deviceKey:(NSString *)deviceKey gatewayPk:(NSString *)gatewayPk gatewayDk:(NSString *)gatewayDk codeList:(NSString *)codeList type:(NSString *)type success:(void (^)(QuecProductTSLInfoModel *tslInfoModel))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| productKey |Yes|Product key| 
| deviceKey |Yes|Device key| 
| gatewayDk |No|Gateway device key| 
| gatewayPk |No|Gateway product key| 
| codeList |No|List of attribute identifiers to query| 
| type |No|1: Query device basic attributes, 2: Query TSL attributes, 3: Query location information; Query types can be single or multiple, if multiple types of attribute values need to be queried, use commas to separate| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|

#### Get Device Location History

```
- (void)getLocationHistoryWithProductKey:(NSString *)productKey deviceKey:(NSString *)deviceKey startTimestamp:(NSInteger)startTimestamp endTimestamp:(NSInteger)endTimestamp gatewayDk:(NSString *)gatewayDk gatewayPk:(NSString *)gatewayPk locateTypes:(NSString *)locateTypes success:(void(^)(NSArray<QuecLocationHistoryModel *> *list))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| productKey |Yes|Product key| 
| deviceKey |Yes|Device key| 
| startTimestamp |Yes|Start time (millisecond timestamp)| 
| endTimestamp |Yes|End time (millisecond timestamp)| 
| gatewayDk |No|Gateway device key| 
| gatewayPk |No|Gateway product key| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 


#### Get Device Property Chart List

```
- (void)getPropertyChartListWithProductKey:(NSString *)productKey deviceKey:(NSString *)deviceKey startTimestamp:(NSInteger)startTimestamp endTimestamp:(NSInteger)endTimestamp attributeCode:(NSString *)attributeCode gatewayDk:(NSString *)gatewayDk gatewayPk:(NSString *)gatewayPk countType:(NSInteger)countType timeGranularity:(NSInteger)timeGranularity success:(void(^)(NSArray *dataArray))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| productKey |Yes|Product key| 
| deviceKey |Yes|Device key| 
| startTimestamp |Yes|Start time (millisecond timestamp)| 
| endTimestamp |Yes|End time (millisecond timestamp)| 
| attributeCode |No|TSL attribute identifier, multiple attributes are separated by commas| 
| gatewayDk |No|Gateway device key| 
| gatewayPk |No|Gateway product key| 
| countType |No|Aggregation type (default 3): 1- Maximum value 2- Minimum value 3- Average value 4- Difference| 
| timeGranularity |No|Statistical time granularity (default 2): 1- Month 2- Day 3- Hour 4- Minute 5- Second| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 


#### Get Device Property Statistics Path

```
- (void)getPropertyStatisticsPathWithProductKey:(NSString *)productKey deviceKey:(NSString *)deviceKey currentTimestamp:(NSInteger)currentTimestamp attributeCode:(NSString *)attributeCode gatewayDk:(NSString *)gatewayDk gatewayPk:(NSString *)gatewayPk countType:(NSInteger)countType timeGranularities:(NSString *)timeGranularities success:(void(^)(NSArray *dataArray))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| productKey |Yes|Product key| 
| deviceKey |Yes|Device key| 
| currentTimestamp |No|Current time (millisecond timestamp)| 
| attributeCode |No|TSL attribute identifier, multiple attributes are separated by commas| 
| gatewayDk |No|Gateway device key| 
| gatewayPk |No|Gateway product key| 
| countType |No|Aggregation type (default 3): 1- Maximum value 2- Minimum value 3- Average value 4- Difference| 
| timeGranularity |No|Statistical time granularity (default 2): 1- Month 2- Day 3- Hour 4- Minute 5- Second| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|


#### Get Device Property Data List

```
- (void)getPropertyDataListWithProductKey:(NSString *)productKey deviceKey:(NSString *)deviceKey startTimestamp:(NSInteger)startTimestamp endTimestamp:(NSInteger)endTimestamp attributeCode:(NSString *)attributeCode gatewayDk:(NSString *)gatewayDk gatewayPk:(NSString *)gatewayPk pageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize success:(void(^)(NSArray<QuecPropertyDataListModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| productKey |Yes|Product key| 
| deviceKey |Yes|Device key| 
| startTimestamp |Yes|Start time (millisecond timestamp)| 
| endTimestamp |Yes|End time (millisecond timestamp)| 
| attributeCode |No|TSL attribute identifier, multiple attributes are separated by commas| 
| gatewayDk |No|Gateway device key| 
| gatewayPk |No|Gateway product key| 
| pageNumber |No|Current page, default is page 1| 
| pageSize |No|Page size, default is 10| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 


#### Create Timer Task

```
- (void)addCornJobWithCornJobModel:(QuecCornJobModel *)cornJobModel success:(void(^)(NSDictionary *data))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| cornJobModel |Yes|QuecCornJobModel type| 

#### Modify Timer Task

```
- (void)setCronJobWithCornJobModel:(QuecCornJobModel *)cornJobModel success:(void(^)(NSDictionary *data))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| cornJobModel |Yes|QuecCornJobModel type| 

#### Query Timer Task List for Device

```
- (void)getCronJobListWithDeviceKey:(NSString *)deviceKey productKey:(NSString *)productKey type:(NSString *)type pageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize success:(void(^)(NSArray<QuecCornJobModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| productKey |Yes|Product key| 
| deviceKey |Yes|Device key| 
| type |No|Timer task type, once: execute once, day-repeat: repeat every day, custom-repeat: custom repeat, multi-section: multi-section execution, random: random execution, delay: delay execution (countdown)| 
| pageNumber |No|Page number, default: 1| 
| pageSize |No|Page size, default: 10| 
| success |No|Success block| 
| failure |No|Failure block|


#### Query Timer Task Details

```
- (void)getCronJobInfoWithRuleId:(NSString *)ruleId success:(void(^)(QuecCornJobModel *cornJobModel))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| ruleId |Yes|Timer task ID| 
| success |No|Success block| 
| failure |No|Failure block|


#### Batch Delete Timer Tasks

```
- (void)batchDeleteCronJobWithParams:(NSDictionary *)params success:(void(^)(NSDictionary *data))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| params |Yes|{ruleIdList:[String Timer task ID array]}| 
| success |No|Success block| 
| failure |No|Failure block|

#### Query Timer Task Limit for Product

```
- (void)getProductCornJobLimitWithProductKey:(NSString *)productKey success:(void(^)(NSInteger limit))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| productKey |Yes|Product key| 
| success |No|Success block| 
| failure |No|Failure block|


#### Bind Device by Auth Code
For compatibility with old methods, new return parameters are added, can be used for WiFi/WiFi+Bluetooth device binding

```
- (void)bindWifiDeviceByAuthCode:(NSString *)authCode productKey:(NSString *)productKey deviceKey:(NSString *)deviceKey deviceName:(NSString *)deviceName success:(void(^)(NSDictionary *dictionary))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| authCode |Yes|Device auth code| 
| productKey |Yes|Product key| 
| deviceKey |Yes|Device key| 
| deviceName |No|Device name| 
| success |No|Success block| 
| failure |No|Failure block|


#### Query if User Can Bind the Device

```
- (void)getDeviceInfoByBindingByFid:(NSString *)fid productKey:(NSString *)productKey success:(void(^)(NSDictionary *dictionary))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |No|Family fid| 
| productKey |Yes|Product key| 
| success |No|Success block| 
| failure |No|Failure block|

#### Query Device Key by Serial Number

```
- (void)getDeviceDkForSn:(NSString *)sn productKey:(NSString *)productKey success:(void(^)(NSDictionary *dictionary))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| sn |Yes|Serial number| 
| productKey |Yes|Product key| 
| success |No|Success block| 
| failure |No|Failure block|


#### Get Device TSL and Business Attribute Values

```
- (void)getProductTslAndDeviceBusinessAttributesWithProductKey:(NSString *)productKey deviceKey:(NSString *)deviceKey gatewayPk:(NSString *)gatewayPk gatewayDk:(NSString *)gatewayDk codeList:(NSString *)codeList type:(NSString *)type success:(void (^)(NSArray *tslAndAttributesArray))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| productKey |Yes|Product key| 
| deviceKey |Yes|Device key| 
| gatewayDk |No|Gateway device key| 
| gatewayPk |No|Gateway product key| 
| codeList |No|List of attribute identifiers to query, used with query type, if querying multiple attributes, use commas to separate| 
| type |No|Query type, 1: Query device basic attributes, 2: Query TSL attributes, 3: Query location information, if multiple types of attribute values need to be queried, use commas to separate| 
| success |No|Success block| 
| failure |No|Failure block|


#### Bind Device by Auth Code
Can be used for WiFi/WiFi+Bluetooth device binding, for compatibility with old methods, new device networking capability parameters are added

```
- (void)bindWifiDeviceByAuthCode:(NSString *)authCode productKey:(NSString *)productKey deviceKey:(NSString *)deviceKey deviceName:(NSString *)deviceName capabilitiesBitmask:(NSInteger)capabilitiesBitmask success:(void(^)(NSDictionary *dictionary))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| authCode |Yes|Device auth code| 
| productKey |Yes|Product key| 
| deviceKey |Yes|Device key| 
| deviceName |No|Device name| 
| capabilitiesBitmask |No|Device networking capability| 
| success |No|Success block| 
| failure |No|Failure block|


#### Get Device TSL
Cache the latest TSL, read the cache by default if there is no network

```
- (void)getProductTSLWithCacheByProductKey:(NSString *)productKey success:(void (^)(NSArray *properties))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| productKey |Yes|Product key| 
| success |No|Success block| 
| failure |No|Failure block|


#### Batch Control Devices

```
- (void)sendDataToDevicesByHttpWithData:(NSString *)data deviceList:(NSArray *)deviceList type:(NSInteger)type dataFormat:(NSInteger )dataFormat success:(QuecDictionaryBlock)success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| data |Yes|JSON string following TSL format| 
| type |Yes|Type 1: Transparent transmission 2: Attribute 3: Service| 
| deviceList |Yes|Device list, [{"deviceKey":{"deviceKey":"", "productKey":""}}]| 
| dataFormat |No|Data type 1: Hex 2: Text (when type is transparent transmission, dataFormat needs to be specified)| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|  


#### Batch Control Devices

```
- (void)sendDataToDevicesByHttpWithData:(NSString *)data
                             deviceList:(NSArray *)deviceList
                                   type:(NSInteger)type
                              extraData:(NSDictionary *)extraData
                                success:(QuecDictionaryBlock)success
                                failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| data |Yes|JSON string following TSL format| 
| deviceList |Yes|Device list [{"deviceKey":"", "productKey":""}]| 
| type |Yes|Type 1: Transparent transmission 2: Attribute 3: Service| 
| extraData |No| {"cacheTime": 0, "isCache": 0,"isCover": 0,"qos": 0}| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 

#### QuecDeviceService (Share) Methods

#### Query Device Info by Share Code

```
- (void)getDeviceInfoByShareCode:(NSString *)shareCode success:(void(^)(QuecDeviceModel *deviceModel))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| shareCode |Yes|Share code| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 

#### Change Shared Device Name

```
- (void)updateDeviceNameByShareUserWithDeviceName:(NSString *)deviceName shareCode:(NSString *)shareCode success:(void(^)())success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| deviceName |Yes|Device name| 
| shareCode |Yes|Share code| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 

#### Get Device Share User List

```
- (void)getDeviceShareUserListWithDeviceKey:(NSString *)deviceKey productKey:(NSString *)productKey success:(void(^)(NSArray <QuecShareUserModel *> *list))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| deviceName |Yes|Device name| 
| productKey |Yes|Product key| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 

#### Share User Cancel Share

```
- (void)unShareDeviceByOwnerWithShareCode:(NSString *)shareCode success:(void(^)())success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| shareCode |Yes|Share code| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 

#### Shared User Cancel Share

```
- (void)unShareDeviceByShareUserWithShareCode:(NSString *)shareCode success:(void(^)())success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| shareCode |Yes|Share code| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|

#### Shared User Accept Share

```
- (void)acceptShareByShareUserWithShareCode:(NSString *)shareCode success:(void(^)())success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| shareCode |Yes|Share code| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|

#### Share User Set Share Info

```
- (void)setShareInfoByOwnerWithDeviceKey:(NSString *)deviceKey productKey:(NSString *)productKey acceptingExpireTime:(NSInteger) acceptingExpireTime coverMark:(NSInteger)coverMark isSharingAlwaysValid:(BOOL)isSharingAlwaysValid sharingExpireTime:(NSInteger)sharingExpireTime success:(void(^)(NSString *shareCode))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| acceptingExpireTime |Yes|Share QR code seed expiration time timestamp (milliseconds), indicating that the share will expire if not used within this timestamp| 
| productKey |Yes|Product key| 
| deviceKey |Yes|Device key| 
| coverMark |No|Cover mark: 1 Directly cover the previous valid share (default) (cover the original share code); 2 Directly add, allowing multiple coexist; 3 Only allow covering the previous share if the share time is extended| 
| isSharingAlwaysValid |No|Whether the device is permanently valid| 
| sharingExpireTime |No|Device usage expiration time timestamp (milliseconds), indicating the time the shared device can be used by the shared user, this parameter is invalid when isSharingAlwaysValid is YES| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|


#### QuecDeviceService (Group) Methods

#### Get Group List
```
- (void)getDeviceGroupListWithPageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize extra:(QuecDeviceGroupParamModel *)infoModel success:(void(^)(NSArray<QuecDeviceGroupInfoModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| pageNumber |No|Page number| 
| pageSize |No|Page size| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|

#### Add Device Group
```
- (void)addDeviceGroupWithInfo:(QuecDeviceGroupParamModel *)groupInfoModel success:(void(^)(void))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| groupInfoModel |Yes|Group information| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|

#### Modify Device Group
```
- (void)updateDeviceGroupInfoWithDeviceGroupId:(NSString *)deviceGroupId infoModel:(QuecDeviceGroupParamModel *)infoModel success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| deviceGroupId |Yes|Group id| 
| infoModel |Yes|Group information| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|

#### Delete Device Group
```
- (void)deleteDeviceGroupWithDeviceGroupId:(NSString *)deviceGroupId success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| deviceGroupId |Yes|Group id| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|

#### Get Group Details
```
- (void)getDeviceGroupInfoWithDeviceGroupId:(NSString *)deviceGroupId success:(void(^)(QuecDeviceGroupInfoModel *model))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| deviceGroupId |Yes|Group id| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|


#### Get Group Device List
```
- (void)getDeviceListWithDeviceGroupId:(NSString *)deviceGroupId deviceGroupName:(NSString *)deviceGroupName deviceKeyList:(NSString *)deviceKeyList productKey:(NSString *)productKey pageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize success:(void (^)(NSArray<QuecDeviceModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| deviceGroupId |Yes|Group id| 
| deviceGroupName |No|Group name| 
| deviceKeyList |No|Device key list, multiple device keys are separated by commas| 
| productKey |No|Product key| 
| pageNumber |No|Page number, default is 1| 
| pageSize |No|Page size, default is 10| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|


#### Add Device to Group
```
- (void)addDeviceToGroupWithDeviceGroupId:(NSString *)deviceGroupId deviceList:(NSArray *)deviceList success:(void(^)(NSDictionary *data))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| deviceGroupId |Yes|Group ID| 
| deviceList |Yes|Device list, example: [{"dk": "string","pk": "string"}]| 
| success |No|Callback for successful request, data example: "data": {"failureList": [{"data": {"dk": "string","pk": "string"},"msg": "string"}],"successList": [{"dk": "string","pk": "string"}]}| 
| failure |No|Callback for failed request|

 

#### Delete Device from Group
```
- (void)deleteDeviceFromGroupWithDeviceGroupId:(NSString *)deviceGroupId deviceList:(NSArray *)deviceList success:(void(^)(NSDictionary *data))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| deviceGroupId |Yes|Group ID| 
| deviceList |Yes|Device list, example: [{"dk": "string","pk": "string"}]| 
| success |No|Callback for successful request, data example: "data": {"failureList": [{"data": {"dk": "string","pk": "string"},"msg": "string"}],"successList": [{"dk": "string","pk": "string"}]}| 
| failure |No|Callback for failed request|



#### Query Device Group List
```
- (void)getDeviceGroupListWithDeviceKey:(NSString *)deviceKey productKey:(NSString *)productKey success:(void(^)(NSArray<QuecDeviceGroupInfoModel *> *list, NSInteger total))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| deviceKey |Yes|Device key| 
| productKey |Yes|Product key| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|


#### Query Child Device List under Gateway Device

```
- (void)getGatewayDeviceChildListWithDeviceKey:(NSString *)deviceKey productKey:(NSString *)productKey pageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize success:(void(^)(NSArray<QuecDeviceModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| deviceKey |Yes|Device key| 
| productKey |Yes|Product key| 
| pageNumber |No|Page number, default is 1| 
| pageSize |No|Page size, default is 10| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|

#### Query Device List Not in Group

```
- (void)getDeviceListByNotInDeviceGroupWithPageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize groupId:(NSString *)groupId success:(void(^)(NSArray<QuecDeviceModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| pageNumber |No|Page number, default is 1| 
| pageSize |No|Page size, default is 10| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|

#### Device Association Management - Bind Device
```
- (void)deviceAssociationWithList:(NSArray<QuecDeviceModel *> *)list master:(QuecDeviceModel *)masterDevice fid:(NSString *)fid success:(void (^)(void))success failure:(void (^)(NSError *))failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| list |Yes|Device list| 
| masterDevice |Yes|Master device| 
| fid |No|Family id, required in home mode| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|


#### Device Association Management - Query Association Relationship
```
- (void)deviceAssociationWithMaster:(QuecDeviceModel *)masterDevice fid:(NSString *)fid code:(NSString *)code success:(void(^)(NSDictionary *data))success failure:(void (^)(NSError *))failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| masterDevice |Yes|Master device| 
| fid |No|Family id, required in home mode| 
| code |No|TSL code| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Device Association Management - Disassociate Relationship
```
- (void)deviceDisassociationWithDevice:(QuecDeviceModel *)model fid:(NSString *)fid success:(void (^)(void))success failure:(void (^)(NSError *))failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| model |Yes|Device| 
| fid |No|Family id, required in home mode| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|


#### Device Association Management - Association Configuration
```
- (void)deviceAssociationConfigWithProductKey:(NSString *)productKey success:(void(^)(QuecDeviceAssociationConfig *config))success failure:(void (^)(NSError *))failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| productKey |Yes|Product key| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|

### QuecIotCacheService Methods
Before establishing a channel connection with the device and performing upstream and downstream data, the device needs to be added to the cache queue. This cache queue will uniformly maintain the channel status of the device.

#### Initialize with pk and dk
```
- (void)addDeviceModelList:(NSArray<QuecDeviceModel *> *)deviceModelList;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| deviceModelList |Yes|Device list| 


### QuecDevice Methods
This class mainly includes device control related, such as device data downstream, listening to device upstream data, the underlying will automatically select the appropriate link for connection and data transmission according to the device's capability value and the current APP and device environment.

#### Initialize with pk and dk
```
- (nullable instancetype)initWithPk:(NSString *)pk dk:(NSString *)dk NS_DESIGNATED_INITIALIZER;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| productKey |Yes|Product key| 
| deviceKey |Yes|Device key| 


#### Establish Channel Connection
```
- (void)connect;
```

|Parameter|Required|Description|    
| --- | --- | --- | 


#### Establish Specified Channel Connection
```
- (void)connectWithMode:(QuecIotChannelMode)mode;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| mode |Yes|QuecIotChannelMode type, channel mode| 


#### Disconnect
```
- (void)disconnect;
```

|Parameter|Required|Description|    
| --- | --- | --- | 


#### Disconnect Specified Channel Connection
```
- (void)disconnectWithType:(QuecIotChannelType)type;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| mode |Yes|QuecIotChannelMode type, channel mode| 

#### Get Connection Status
```
- (QuecIotChannelBitMask)connectedState;
```

|Parameter|Required|Description|    
| --- | --- | --- | 


#### Delete Device
```
- (void)remove:(nullable void(^)(void))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| success |No|Success callback| 
| failure |No|Failure callback| 


#### Write TSL
```
- (void)writeDps:(NSArray<QuecIotDataPoint*> *)dps success:(nullable void(^)(void))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| dps |Yes|TSL data| 
| success |No|Success callback| 
| failure |No|Failure callback| 


#### Write TSL with Specified Channel
```
- (void)writeDps:(NSArray<QuecIotDataPoint*> *)dps mode:(QuecIotChannelMode)mode success:(nullable void(^)(void))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| dps |Yes|TSL data| 
| mode |Yes|QuecIotChannelMode type, channel mode| 
| success |No|Success callback| 
| failure |No|Failure callback| 


#### Read TSL
```
- (void)readDps:(NSArray<QuecIotDataPoint*> *)dps success:(nullable void(^)(void))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| dps |Yes|TSL data| 
| success |No|Success callback| 
| failure |No|Failure callback| 


#### Read TSL with Specified Channel
```
- (void)readDps:(NSArray<QuecIotDataPoint*> *)dps mode:(QuecIotChannelMode)mode success:(nullable void(^)(void))success failure:(void(^)(NSError *error))failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| dps |Yes|TSL data| 
| mode |Yes|QuecIotChannelMode type, channel mode| 
| success |No|Success callback| 
| failure |No|Failure callback| 


#### Update Device Cloud Online Status
```
- (void)updateDeviceCloudOnlineStatus:(int)cloudOnlineStatus;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| cloudOnlineStatus |Yes|0: Offline, 1: Online| 


#### Bluetooth Communication (QuecBleChannelKit)

#### Add Listener
```
- (void)addListener:(id<QuecBleManagerDelegate>)delegate;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| delegate |Yes|Object conforming to QuecBleManagerDelegate| 

#### Remove Listener

```
- (void)removeListener:(id<QuecBleManagerDelegate>)delegate;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| delegate |Yes|Object conforming to QuecBleManagerDelegate| 

#### Scan Peripherals

```
- (void)startScanWithFilier:(QuecBleFilterModel *)filter;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| filter |No|QuecBleFilterModel, filter peripherals| 

#### Stop Scan

```
- (void)stopScan;
```


#### Connect Peripheral

```
- (void)connectPeripheral:(QuecPeripheralModel *)peripheral;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| peripheral |Yes|QuecPeripheralModel| 

#### Disconnect Peripheral

```
- (void)disconnectPeripheral:(QuecPeripheralModel *)peripheral;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| peripheral |Yes|QuecPeripheralModel| 


#### Send Data to Peripheral

```
- (void)sendCommandToPeripheral:(QuecPeripheralModel *)peripheral command:(QuecTtlvCommandModel *)command completion:(void(^)(BOOL timeout, QuecTtlvCommandModel *response))completion;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| peripheral |Yes|QuecPeripheralModel| 
| command |Yes|QuecTtlvCommandModel| 
| completion |No|Completion callback| 


#### Enable AES128 Encryption and Decryption for Channel

```
- (void)startAES128EncryptAndDecryptWithPeripheral:(QuecPeripheralModel *)peripheral serviceUuid:(NSString *)serviceUuid key:(NSString *)key iv:(NSString *)iv;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| peripheral |Yes|QuecPeripheralModel| 
| serviceUuid |No|Service UUID, use default if not provided| 
| key |No|AES128 key| 
| iv |No|AES128 iv| 


#### Disable AES128 Encryption and Decryption for Channel

```
- (void)stopAES128EncryptAndDecryptWithPeripheral:(QuecPeripheralModel *)peripheral serviceUuid:(NSString *)serviceUuid;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| peripheral |Yes|QuecPeripheralModel| 
| serviceUuid |No|Service UUID, use default if not provided| 


#### Get Peripheral Connection Status

```
- (BOOL)getPeripheralConnectState:(QuecPeripheralModel *)peripheral;
```

#### Device Network Configuration (QuecSmartConfigKit)
#### ~~Add Network Configuration Listener~~ (Deprecated, use new API below)

```
- (void)addSmartConfigDelegate:(id<QuecSmartConfigDelegate>)delegate;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| delegate |Yes|Object conforming to QuecSmartConfigDelegate| 


#### ~~Remove Network Configuration Listener~~ (Deprecated, use new API below)

```
- (void)removeSmartConfigDelegate:(id<QuecSmartConfigDelegate>)delegate;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| delegate |Yes|Object conforming to QuecSmartConfigDelegate| 


#### ~~Start Network Configuration (for WiFi+BLE devices)~~ (Deprecated, use new API below)

```
- (void)startConfigDevices:(NSArray<QuecPeripheralModel *> *)devices ssid:(NSString *)ssid password:(NSString *)password;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| devices |Yes|Peripheral data obtained from BleChannel, supports batch addition| 
| ssid |No|WiFi name| 
| password |No|WiFi password| 


#### ~~Cancel All Network Configuration Operations~~ (Deprecated, use new API below)

```
- (void)cancelConfigDevices;
```

### Device Network Configuration and Binding (import <QuecSmartconfigKit/QuecDevicePairingService.h>)

#### Scan Devices
Scan results refer to QuecPairingDelegate
```
- (void)scanWithFid:(NSString * _Nullable)fid filier:(QuecBleFilterModel * _Nullable)filter;
```
|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |No|Family id, pass in home mode| 
| filter |No|Filter peripheral conditions| 

#### Stop Scan

```
- (void)stopScan;
```

#### Start Pairing Devices
Network configuration progress and results refer to QuecPairingDelegate
```
- (void)startPairingByDevices:(NSArray<QuecPairingPeripheral *> *)pairingDevices fid:(NSString *)fid ssid:(NSString *)ssid pwd:(NSString *)pwd;
```
|Parameter|Required|Description|    
| --- | --- | --- | 
| devices |Yes|Data source to be bound| 
| fid |No|Family id, if the passed value is valid and not empty, the default is to bind the device in home mode| 
| ssid |No|WiFi name| 
| pwd |No|WiFi password| 

#### Cancel All Device Pairing

```
- (void)cancelAllDevicePairing;
```

#### Set WiFi Network Configuration Timeout

```
- (BOOL)setWiFiPairingDuration:(int)duration;
```
|Parameter|Required|Description|    
| --- | --- | --- | 
| duration |No|60~120, default 120 seconds, unit: seconds| 

#### Set BLE Pairing Timeout

```
- (BOOL)setBlePairingDuration:(int)duration;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| duration |No|30~60, default 60 seconds, unit: seconds| 

#### Add Network Configuration and Binding Listener

```
- (void)addPairingListener:(id<QuecPairingDelegate>)listener;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| listener |No|Delegate object| 

#### Remove Network Configuration and Binding Listener

```
- (void)removePairingListener:(id<QuecPairingDelegate>)listener;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| listener |No|Delegate object| 

#### QuecPairingDelegate Protocol Methods

```
/**
    Network configuration and binding progress
    pairingPeripheral: Current network configuration and binding device
    progress: Network configuration and binding progress (0~1)
*/
- (void)didUpdatePairingStatus:(QuecPairingPeripheral *)pairingPeripheral progress:(CGFloat)progress;
/**
    Network configuration and binding result
    pairingPeripheral: Current network configuration and binding device
    result: Network configuration and binding result
    error: Detailed network configuration and binding failure
*/
- (void)didUpdatePairingResult:(QuecPairingPeripheral *)pairingPeripheral result:(BOOL)result error:(NSError *)error;
/**
    Peripheral scan
    pairingPeripheral: Scanned peripheral object
*/
- (void)centralDidDiscoverPairingPeripheral:(QuecPairingPeripheral *)pairingPeripheral;
```

#### QuecPairingPeripheral Class
|Parameter|Type|Description|    
| --- | --- | --- | 
| productName |NSString|Product name| 
| deviceName |NSString|Device name| 
| productLogo |NSString|Product image| 
| bindingMode |int|Binding mode: Multiple binding: 1/Unique: 2/Alternate: 3| 
| peripheralModel |QuecPeripheralModel|Scanned BLE device object| 

#### QuecPeripheralModel Class

|Parameter|Type|Description|    
| --- | --- | --- | 
| uuid |NSString|Device unique identifier| 
| pk |NSString|Device pk| 
| dk |NSString|Device dk| 
| mac |NSString|Bluetooth mac address| 
| isConfig |BOOL|WiFi device is configured, 1 means configured, 0 means not configured| 
| isBind |BOOL|Pure BLE device is bound| 
| isEnableBind |BOOL|Pure BLE device allows binding| 
| capabilitiesBitmask |int|Device capability value bit0=1 means the device supports WAN far-field communication capability bit1=1 means the device supports WiFi LAN near-field communication capability bit2=1 means the device supports BLE near-field communication capability| 

#### Network Configuration and Binding Status Code QuecPairingState Description

|Parameter|Value|Description|    
| --- | --- | --- | 
| QuecPairingWaiting |301|Device waiting to be bound| 
| QuecPairingBleConnecting |302|Bluetooth connecting| 
| QuecPairingBleConnectedFail |303|Bluetooth connection failed| 
| QuecPairingWiFiGetBindingCodeFail |304|WiFi configured device, timeout did not get binding code| 
| QuecPairingWiFiBindingSuccess |305|WiFi configuration successful| 
| QuecPairingWiFiBindingFail |306|WiFi configuration failed| 
| QuecPairingBleGetRandomFail |307|Failed to ask the Bluetooth device for random| 
| QuecPairingBleGetEncryptionCodeFail |308|Failed to request encrypted binding code from the cloud| 
| QuecPairingBleCodeAuthFail |309|Failed to authenticate with the Bluetooth device| 
| QuecPairingBleCodeAuthSuccess |310|Successfully authenticated with the Bluetooth device| 
| QuecPairingBleBindingSuccess |311|Bluetooth binding successful| 
| QuecPairingBleBindingFail |312|Bluetooth binding failed| 
| QuecPairingFail |313|General exception scenario: binding failed, such as parameter issues, etc.| 

### OTA SDK (QuecOTAUpgradeKit)

#### Bluetooth OTA
#### Query Single Device Upgrade Plan

```
- (void)checkVersionWithProductKey:(NSString *)productKey
                         deviceKey:(NSString *)deviceKey
                         infoBlock:(void (^)(QuecBleOTAInfoModel * _Nullable infoModel))infoBlock;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| productKey |Yes|Device pk| 
| deviceKey |Yes|Device dk| 
| infoBlock |Yes|QuecBleOTAInfoModel callback| 

#### QuecBleOTAInfoModel Class Description

|Parameter|Type|Description|    
| --- | --- | --- | 
| pk |String|Device pk| 
| dk |String|Device dk| 
| targetVersion |String|New version number| 
| componentNo |String|Component number| 
| desc |String|Upgrade description| 
| fileName |String|File name| 
| fileUrl |String|File download address| 
| fileSize |NSInteger|File size| 
| fileSign |String|File Hash256 value| 
| planId |NSInteger|Upgrade plan ID| 

#### Set OTA Success or Failure Transfer Callback
```
- (void)addStateListener:(id)delegate
               onSuccess:(OnSuccessBlock)onSuccess
                  onFail:(OnFailBlock)onFail;
```
|Parameter|Required|Description|    
| --- | --- | --- | 
| delegate |Yes|Delegate object| 
| onSuccess |Yes|Success callback| 
| OnFailBlock |Yes|Failure callback| 

#### Remove OTA Success or Failure Transfer Callback
```
- (void)removeStateListener:(id)delegate;
```
|Parameter|Required|Description|    
| --- | --- | --- | 
| delegate |Yes|Delegate object| 

#### Set OTA Progress Callback Interface Listener
```
- (void)addProgressListener:(id)delegate
           progressListener:(ProgressListenerBlock)progressListener;
```
|Parameter|Required|Description|    
| --- | --- | --- | 
| delegate |Yes|Delegate object| 
| progressListener |Yes|progress: Current single file transfer progress, range is 0 - 1| 

#### Remove OTA Progress Callback Interface Listener
```
- (void)removeProgressListener:(id)delegate;
```
|Parameter|Required|Description|    
| --- | --- | --- | 
| delegate |Yes|Delegate object| 

#### Start OTA Process for Specified Device
```
- (void)startOTAWithInfoList:(NSArray<QuecBleOTAInfoModel *> *)infoList;
```
|Parameter|Required|Description|    
| --- | --- | --- | 
| infoList |Yes|Multiple devices can be passed, the method internally handles sequential upgrades| 


#### Terminate OTA Process for Specified Device
```
- (void)stopOTAWithInfoList:(NSArray<QuecBleOTAInfoModel *> *)infoList;
```
|Parameter|Required|Description|    
| --- | --- | --- | 
| infoList |Yes|Multiple devices can be passed, the method internally handles sequential upgrades| 

#### QuecBleOTAErrorType Error Code Description

|Parameter|Description|    
| --- | --- | 
| QuecBleOTAErrorTypeCommon |General error| 
| QuecBleOTAErrorTypeNotConnect |Bluetooth not connected| 
| QuecBleOTAErrorTypeNoFilePath |Upgrade file path does not exist| 
| QuecBleOTAErrorTypeFileCheckFail |Upgrade file verification failed| 
| QuecBleOTAErrorTypeDeviceRefuse |Device refused to upgrade| 
| QuecBleOTAErrorTypeDeviceCancel |Device canceled upgrade| 
| QuecBleOTAErrorTypeDeviceFail |Device upgrade failed| 
| QuecBleOTAErrorTypeDeviceTimeout |Upgrade timeout| 

#### Http OTA (QuecHttpOTAService)
#### Query Device Upgrade Plan

```
- (void)getDeviceUpgradePlan:(NSString *)productKey deviceKey:(NSString *)deviceKey success:(void (^)(QuecOTAPlanModel *))success failure:(void (^)(NSError *))failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| productKey |Yes|Product key| 
| deviceKey |Yes|Device key| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 

#### QuecOTAPlanModel

|Parameter|Type|Description|    
| --- | --- | --- | 
| planId |Yes|Upgrade plan id| 
| planName |Yes|Upgrade plan name| 
| versionInfo |Yes|Version information| 
| dataType |Yes|Package type| 
| planStartTime |No|Plan start time, unit ms| 
| planEndTime |No|Plan end time, unit ms| 
| appointStartTime |Yes|Appointment start time, unit ms| 
| appointEndTime |Yes|Appointment end time, unit ms| 
| deviceStatus |Yes|0-Not upgraded, 1-Upgrading, 2-Upgrade successful, 3-Upgrade failed| 
| userConfirmStatusDesc |Yes|User confirmation status, 0 not confirmed (default), 1 upgrade immediately (confirm upgrade at any time), 2 appointment upgrade (appointment specified time window upgrade), 3 (cancel appointment and cancel upgrade), 4 upgrade result confirmed| 
| comVerList |No|Component upgrade information QuecOTAComponetModel data source| 
| autoUpgrade |No|Temporarily unused parameter| 
| deviceStatusDesc |No|Device upgrade status description| 
| userConfirmStatus |Yes|User confirmation status: 0-Not confirmed, 1-Upgrade immediately| 
| upgradeProgress |Yes|Upgrade progress| 
| productKey |Yes|Device pk| 
| deviceKey |Yes|Device dk| 

#### Query Number of Upgradable Devices

```
- (void)getUserlsHaveDeviceUpgrade:(NSString *)fId success:(void (^)(NSInteger))success failure:(void (^)(NSError *))failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fId |Yes|Family id, pass in home mode| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 

#### List of Devices with Upgrade Plans

```
- (void)getUpgradePlanDeviceList:(NSString *)fId page:(NSInteger)page pageSize:(NSInteger)pageSize success:(void (^)(QuecOTADeviceListModel *))success failure:(void (^)(NSError *))failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fId |Yes|Family id, pass in home mode| 
| page |No|Current page| 
| pageSize |No|Page size| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 

#### QuecOTADeviceListModel Class

|Parameter|Type|Description|    
| --- | --- | --- | 
| page |NSInteger|Current page| 
| totalCount |NSInteger|Total count| 
| list |NSArray|QuecOTADeviceModel data source| 
| pageSize |NSInteger|Page size| 

#### QuecOTADeviceModel Class

|Parameter|Type|Description|    
| --- | --- | --- | 
| productKey |NSString|Product pk| 
| deviceKey |NSString|Device dk| 
| deviceName |NSString|Device name| 
| version |NSString|Version number/Upgrade plan name| 
| desc |NSString|Version introduction/Upgrade plan copy/Version package remarks| 
| deviceStatus |NSInteger|Device status: 0-Not upgraded, 1-Upgrading, 2-Upgrade successful, 3-Upgrade failed| 
| productIcon |NSString|Product Icon| 
| enabledTime |NSString|Temporarily unused| 
| enabledTimeTs |NSTimeInterval|Temporarily unused| 
| planId |long long|Upgrade plan id| 
| userConfirmStatus |NSInteger|User confirmation status: 0-Not confirmed, 1-Upgrade immediately| 

#### User Batch Confirm Upgrade Plan

```
- (void)userBatchConfirmUpgradeWithList:(NSArray<QuecOTAPlanParamModel *> *)list success:(void(^)(NSDictionary *data))success failure:(void (^)(NSError *error))failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| list |Yes|Data source| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 

#### Batch Query Device Upgrade Details

```
- (void)getBatchUpgradeDetailsWithList:(NSArray<QuecOTAPlanParamModel *> *)list success:(void(^)(NSArray<QuecOTAPlanModel *> *data))success failure:(void (^)(NSError *error))failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| list |Yes|Data source| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 

#### QuecOTAPlanParamModel Class

|Parameter|Type|Description|    
| --- | --- | --- | 
| pk |NSString|Product pk| 
| dk |NSString|Device dk| 
| appointStartTime |NSTimeInterval|Appointment start time, unit ms, only used for confirming plans| 
| appointEndTime |NSTimeInterval|Appointment end time, unit ms, only used for confirming plans| 
| operType |NSInteger|Operation type: 1-Upgrade immediately (confirm upgrade at any time) 2-Appointment upgrade (appointment specified time window upgrade) 3-(Cancel appointment and cancel upgrade) 5-Retry| 
| planId |long long|Upgrade plan id|



## Home SDK QuecSmartHomeKit

### QuecSmartHomeService Class  

#### Get Singleton Object
```
+ (instancetype)sharedInstance;
```

#### Enable or Disable Home Mode
```
- (void)enabledFamilyMode:(BOOL)familyMode success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| familyMode |Yes|Enable or disable home mode| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 

#### Enable or Disable Auto Switch
```
- (void)enabledAutoSwitch:(BOOL)autoSwitch success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| autoSwitch |Yes|Enable or disable auto switch| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 


#### Query User's Home Mode Configuration
```
- (void)getFamilyModeConfigWithSuccess:(QuecDictionaryBlock)success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 

#### Create Family
```
- (void)addFamilyWithFamilyParamModel:(QuecFamilyParamModel *)familyParamModel success:(QuecDictionaryBlock)success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| familyParamModel |Yes|QuecFamilyParamModel| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 



#### Modify Family Information
```
- (void)setFamilyWithFamilyParamModel:(QuecFamilyParamModel *)familyParamModel success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| familyParamModel |Yes|QuecFamilyParamModel| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 



#### Delete Family
```
- (void)deleteFamilyWithFid:(NSString *)fid success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |Yes|Family id| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 



#### Query Current Family
```
- (void)getCurrentFamilyWithFid:(NSString *)fid currentCoordinates:(NSString *)currentCoordinates success:(void(^)(QuecFamilyItemModel *))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |No|Family id| 
| currentCoordinates |No|Current GPS location coordinates, WGS84 coordinate system, format: 40.759186,-73.928204| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 



#### Query Family List
```
- (void)getFamilyListWithRole:(NSString *)role pageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize success:(void(^)(NSArray <QuecFamilyItemModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| role |No|Role, member role: 1-Creator 2-Administrator| 
| pageNumber |No|Page number, default 1| 
| pageSize |No|Page size, default 10| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 


#### Query Device List in Family
```
- (void)getFamilyDeviceListWithFid:(NSString *)fid isAddOwnerDevice:(BOOL)isAddOwnerDevice deviceName:(NSString *)deviceName pageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize success:(void(^)(NSArray <QuecFamilyDeviceItemModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |Yes|Family id| 
| isAddOwnerDevice |No|Whether to add own devices| 
| deviceName |No|Device name| 
| pageNumber |No|Page number, default 1| 
| pageSize |No|Page size, default 10| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 



#### Add Commonly Used Device
```
- (void)addCommonUsedDeviceWithFid:(NSString *)fid deviceList:(NSArray *)deviceList success:(QuecDictionaryBlock)success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |Yes|Family id| 
| deviceList |Yes|Device list: {"dk":"", "pk":""}| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 




#### Remove Commonly Used Device
```
- (void)deleteCommonUsedDeviceWithFid:(NSString *)fid deviceList:(NSArray *)deviceList success:(QuecDictionaryBlock)success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |Yes|Family id| 
| deviceList |Yes|Device list: {"dk":"", "pk":""}| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 




#### Query Commonly Used Device List
```
- (void)getCommonUsedDeviceListWithFid:(NSString *)fid pageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize success:(void(^)(NSArray <QuecFamilyDeviceItemModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |Yes|Family id| 
| pageNumber |No|Page number, default 1| 
| pageSize |No|Page size, default 10| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 




#### Create Room
```
- (void)addFamilyRoomWithFid:(NSString *)fid roomName:(NSString *)roomName success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |Yes|Family id| 
| roomName |Yes|Room name| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 




#### Set Room
```
- (void)setFamilyRoomWithFrid:(NSString *)frid roomName:(NSString *)roomName success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |Yes|Family id| 
| roomName |Yes|Room name| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request| 



#### Delete Room
```
- (void)deleteFamilyRoomsWithIds:(NSArray<NSString *> *)fridList success:(QuecDictionaryBlock)success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fridList |Yes|Room id list| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Move Device to Room
```
- (void)addDeviceInFamilyRoomWithDeviceList:(NSArray *)deviceList success:(QuecDictionaryBlock)success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| deviceList |Yes|Device list: {"dk":"", "pk":"", "oldFrid":"", "newFrid":""}| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Set Room Sort Order
```
- (void)setFamilyRoomSortWithRoomRortList:(NSArray *)roomSortList success:(QuecDictionaryBlock)success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| roomSortList |Yes|Room sort list: {"frid":"", "roomSort":""}| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Query Device List in Room
```
- (void)getFamilyRoomDeviceListWithFrid:(NSString *)frid pageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize success:(void(^)(NSArray <QuecFamilyDeviceItemModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| frid |Yes|Family room id| 
| pageNumber |No|Page number, default 1| 
| pageSize |No|Page size, default 10| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|




#### Query Room List in Family
```
- (void)getFamilyRoomListWithFid:(NSString *)fid pageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize success:(void(^)(NSArray <QuecFamilyRoomItemModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |Yes|Family id| 
| pageNumber |No|Page number, default 1| 
| pageSize |No|Page size, default 10| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Invite Family Member
```
- (void)inviteFamilyMemberWithModel:(QuecInviteFamilyMemberParamModel *)inviteModel success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| inviteModel |Yes|QuecInviteFamilyMemberParamModel, invitation information| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Handle Family Member Invitation
```
- (void)familyMemberInviteHandleWithFid:(NSString *)fid decide:(NSInteger)decide success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |Yes|Family Id| 
| decide |Yes|0: Reject invitation, 1: Accept invitation| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|


#### Modify Family Member Name
```
- (void)setFamilyMemberNameWithFid:(NSString *)fid memberUid:(NSString *)memberUid memberName:(NSString *)memberName success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |Yes|Family Id| 
| memberUid |Yes|Family member user Id| 
| memberName |Yes|Member name| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Modify Family Member Role
```
- (void)setFamilyMemberRoleWithFid:(NSString *)fid memberUid:(NSString *)memberUid memberRole:(NSString *)memberRole success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |Yes|Family Id| 
| memberUid |Yes|Family member user Id| 
| memberRole |Yes|2: Administrator, 3: Ordinary member| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Remove Family Member
```
- (void)deleteFamilyMemberWithFid:(NSString *)fid memberUid:(NSString *)memberUid success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |Yes|Family Id| 
| memberUid |Yes|Family member user Id| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|


#### Leave Family
```
- (void)leaveFamilyWithFid:(NSString *)fid success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |Yes|Family Id| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Query Family Member List
```
- (void)getFamilyMemberListWithFid:(NSString *)fid pageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize success:(void(^)(NSArray<QuecFamilyMemberItemModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |Yes|Family Id| 
| pageNumber |No|Page number, default 1| 
| pageSize |No|Page size, default 10| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|




#### Query Invitation List
```
- (void)getFamilyInviteListWithPageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize success:(void(^)(NSArray <QuecInviteItemModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| pageNumber |No|Page number, default 1| 
| pageSize |No|Page size, default 10| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|




#### Query Family Device Group List
```
- (void)getFamilyGroupListWithFid:(NSString *)fid pageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize success:(void(^)(NSArray <QuecFamilyDeviceGroupInfoModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |Yes|Family Id| 
| pageNumber |No|Page number, default 1| 
| pageSize |No|Page size, default 10| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|




#### Bind Device by Serial Number
```
- (void)bindDeviceByFid:(NSString *)fid SerialNumber:(NSString *)serialNumber productKey:(NSString *)productKey deviceName:(NSString *)deviceName success:(void(^)(NSDictionary *dataDict))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |Yes|Family Id| 
| serialNumber |Yes|Device serial number| 
| productKey |Yes|Product key| 
| deviceName |No|Device name| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|




#### Add Family Device Group
```
- (void)addFamilyDeviceGroupWithInfo:(QuecFamilyDeviceGroupModel *)groupInfoModel success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| groupInfoModel |Yes|QuecFamilyDeviceGroupModel, group information| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Get Group List
```
- (void)getDeviceGroupListWithFid:(NSString *)fid pageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize success:(void(^)(NSArray<QuecFamilyDeviceItemModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |Yes|Family Id| 
| pageNumber |No|Page number, default 1| 
| pageSize |No|Page size, default 10| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Bind Device by Auth Code
Can be used for WiFi/WiFi+Bluetooth device binding

```
- (void)bindDeviceByFid:(NSString *)fid authCode:(NSString *)authCode productKey:(NSString *)productKey deviceKey:(NSString *)deviceKey deviceName:(NSString *)deviceName success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |Yes|Family Id| 
| authCode |Yes|Device auth code| 
| productKey |Yes|Product key| 
| deviceKey |Yes|Device key| 
| deviceName |No|Device name| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Query Device List Not in Family Device Group
```
- (void)getDeviceListByNotInDeviceGroupWithFid:(NSString *)fid PageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize groupId:(NSString *)groupId success:(void(^)(NSArray <QuecFamilyDeviceItemModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |Yes|Family Id| 
| pageNumber |No|Page number, default 1| 
| pageSize |No|Page size, default 10| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Bind Device by Auth Code
Can be used for WiFi/WiFi+Bluetooth device binding, compatible with old methods, new return parameters are added

```
- (void)bindDeviceAndGetDeviceInfoByFid:(NSString *)fid authCode:(NSString *)authCode productKey:(NSString *)productKey deviceKey:(NSString *)deviceKey deviceName:(NSString *)deviceName success:(void (^)(NSDictionary *dictionary))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |Yes|Family Id| 
| authCode |Yes|Device auth code| 
| productKey |Yes|Product key| 
| deviceKey |Yes|Device key| 
| deviceName |No|Device name| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|




#### Edit Device Information

```
- (void)setDeviceInfoWithModelArray:(NSArray<QuecSetDeviceInfoModel *> *)modelArray success:(void(^)(NSDictionary *dataDict))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| modelArray |Yes|Device information| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|




#### Bind WiFi Device by Auth Code
Can be used for WiFi/WiFi+Bluetooth device binding, compatible with old methods, new device networking capability parameters are added

```
- (void)bindWifiDeviceByFid:(NSString *)fid authCode:(NSString *)authCode productKey:(NSString *)productKey deviceKey:(NSString *)deviceKey deviceName:(NSString *)deviceName capabilitiesBitmask:(NSInteger)capabilitiesBitmask success:(void (^)(NSDictionary *dictionary))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |Yes|Family Id| 
| authCode |Yes|Device auth code| 
| productKey |Yes|Product key| 
| deviceKey |Yes|Device key| 
| deviceName |No|Device name| 
| capabilitiesBitmask |No|Device networking capability| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### QuecFamilyDeviceGroupInfoModel

|Parameter|Type|Description|    
| --- | --- | --- | 
| name |NSString|Name| 
| fid |NSString|Family ID| 
| address |NSString|Address| 
| contactPhoneList |NSString|Contact person| 
| coordinate |NSString|Coordinates| 
| coordinateSystem |NSString|Coordinate system| 
| descrip |NSString|Description| 
| manager |NSString|Manager| 
| managerType |NSString|Manager type| 
| parentId |NSString|Parent device group ID| 
| extend |NSString|Extended field| 
| dgid |NSString|Group ID| 
| owner |NSString|Owner| 
| addTime |NSString|Add time| 
| addTimeTs |NSInteger|Add timestamp|



#### QuecFamilyDeviceGroupModel

|Parameter|Type|Description|    
| --- | --- | --- | 
| name |NSString|Name| 
| fid |NSString|Family ID| 
| address |NSString|Address| 
| contactPhoneList |NSString|Contact person| 
| coordinate |NSString|Coordinates| 
| coordinateSystem |NSString|Coordinate system| 
| descrip |NSString|Description| 
| manager |NSString|Manager| 
| managerType |NSString|Manager type| 
| parentId |NSString|Parent device group ID| 
| extend |NSString|Extended field|



#### QuecFamilyDeviceListParamsModel

|Parameter|Type|Description|    
| --- | --- | --- | 
| fid |NSString|Family ID| 
| isAddOwnerDevice |BOOL|Whether to add own devices, optional| 
| deviceName |NSString|Device name search, optional| 
| pageNumber |NSInteger|Page number, optional, default 1| 
| pageSize |NSInteger|Page size, optional, default 10| 
| isGroupDeviceShow |BOOL|Whether to show group devices, default missing| 
| isAssociation |BOOL|Query unassociated devices, default false| 
| secondItemCode |NSString|Secondary category filter, default empty| 
| pkList |NSString|Add pklist, multiple pks are separated by commas|



#### QuecFamilyItemModel

|Parameter|Type|Description|    
| --- | --- | --- | 
| fid |NSString|Family ID| 
| familyName |NSString|Name| 
| familyLocation |NSString|Family location| 
| familyCoordinates |NSString|Family coordinates| 
| addTime |NSString|Add time| 
| addTimeTs |NSInteger|Add timestamp| 
| memberRole |NSInteger|Role, 1-Creator 2-Administrator 3-Ordinary member| 
| currentRoom |QuecFamilyRoomItemModel|Secondary model| 
| rooms |NSArray<QuecFamilyRoomItemModel *> |Secondary model|


#### Update Family List
```
- (void)updateRooms:(NSArray<QuecFamilyRoomItemModel *> *)rooms;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| rooms |Yes|NSArray<QuecFamilyRoomItemModel *> |


#### Set Current Room
```
- (void)setSelectRoom:(QuecFamilyRoomItemModel *)room;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| room |Yes|QuecFamilyRoomItemModel|



#### QuecFamilyMemberItemModel

|Parameter|Type|Description|    
| --- | --- | --- | 
| uid |NSString|User Id| 
| phone |NSString|Phone number| 
| nikeName |NSString|Nickname| 
| sex |NSInteger|Gender| 
| address |NSString|Address| 
| email |NSString|Email| 
| headimg |NSString|Profile picture| 
| wechatMiniprogramUserId |NSString|Mini program Id| 
| wechatUnionId |NSString|WeChat Id| 
| appleUserId |NSString|Apple Id| 
| twitterUserId |NSString|Twitter Id| 
| facebookUserId |NSString|Facebook Id| 
| alipayUserId |NSString|Alipay Id| 
| qqUserId |NSString|QQ Id| 
| wechatOffiaccountUserId |NSString|WeChat official account Id| 
| registerTime |NSString|Registration time| 
| registerTimeTs |NSInteger|Registration timestamp| 
| lastLoginTime |NSString|Last login time| 
| lastLoginTimeTs |NSInteger|Last login timestamp| 
| timezone |NSString|Timezone| 
| nationality |NSString|Country| 
| province |NSString|Province| 
| city |NSString|City| 
| lang |NSString|Language| 
| status |NSInteger|Status| 
| signature |NSString|Signature| 
| remark |NSString|Remark| 
| memberRole |NSInteger|Role type| 
| memberName |NSString|Name|



#### QuecFamilyParamModel

|Parameter|Type|Description|    
| --- | --- | --- | 
| fid |NSString|Family Id, required when modifying family information and deleting family, not required when creating family| 
| familyName |NSString|Name, required when creating family, optional when modifying family| 
| familyLocation |NSString|Family location, optional| 
| familyCoordinates |NSString|Family coordinates, WGS84 coordinate system, format: 40.759186,-73.928204, optional| 
| familyRoomList |NSArray<NSString *> |Room list, optional|



#### QuecFamilyRoomItemModel

|Parameter|Type|Description|    
| --- | --- | --- | 
| fid |NSString|Family Id| 
| roomName |NSString|Room name| 
| roomSort |NSInteger|Room sort order|



#### QuecInviteFamilyMemberParamModel

|Parameter|Type|Description|    
| --- | --- | --- | 
| fid |NSString|Family Id, required when inviting members| 
| memberRole |NSString|Member role: 2-Administrator 3-Ordinary member, required when inviting members| 
| memberName |NSString|Member name, optional when inviting members| 
| invalidTime |NSInteger|Invitation expiration time, millisecond timestamp, required when inviting members| 
| phone |NSString|Phone number, optional when inviting members| 
| email |NSString|Email, optional when inviting members| 
| uid |NSString|User Id, optional when inviting members|



#### QuecInviteFamilyMemberParamModel

|Parameter|Type|Description|    
| --- | --- | --- | 
| fid |NSString|Family ID| 
| familyName |NSString|Name| 
| familyLocation |NSString|Family location| 
| familyCoordinates |NSString|Family coordinates| 
| addTime |NSString|Add time| 
| addTimeTs |NSInteger|Add timestamp| 
| invalidTime |NSString|Invitation time|



#### QuecSetDeviceInfoModel

|Parameter|Type|Description|    
| --- | --- | --- | 
| fid |NSString|Family ID| 
| dk |NSString|Device dk| 
| pk |NSString|Device pk| 
| deviceName |NSString|Device name| 
| isCommonUsed |BOOL|Whether it is commonly used: true-Commonly used, false-Not commonly used| 
| type |int|Device type: 1-Device in family, 2-Device received by user, 3-Device in multi-binding mode| 
| oldFrid |NSString|Move out room ID| 
| selectFrid |NSString|Move in room ID| 
| shareCode |NSString|Share code|



## Scene SDK QuecSceneKit

### QuecSceneService Class

#### Add Scene
```
- (void)addSceneWithSceneModel:(QuecSceneModel *)sceneModel success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| sceneModel |Yes|QuecSceneModel| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Edit Scene
```
- (void)editSceneWithSceneModel:(QuecSceneModel *)sceneModel success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| sceneModel |Yes|QuecSceneModel| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Delete Scene
```
- (void)deleteSceneWithFid:(NSString *)fid sceneId:(NSString *)sceneId success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |Yes|Family id| 
| sceneId |Yes|Scene Id| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Get Scene List
```
- (void)getSceneListWithFid:(NSString *)fid pageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize success:(void(^)(NSArray<QuecSceneModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |Yes|Family id| 
| pageNumber |No|Page number, default 1| 
| pageSize |No|Page size, default 10| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Get Common Scene List
```
- (void)getCommonSceneListWithFid:(NSString *)fid pageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize success:(void(^)(NSArray<QuecSceneModel *> *list, NSInteger total))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |Yes|Family id| 
| pageNumber |No|Page number, default 1| 
| pageSize |No|Page size, default 10| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Execute Scene
```
- (void)executeSceneWithFid:(NSString *)fid sceneId:(NSString *)sceneId success:(void(^)(QuecActionExecuteResultModel *executeResultModel))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |Yes|Family id| 
| sceneId |Yes|Scene id| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Test Scene
```
- (void)executeTestSceneWithSceneModel:(QuecSceneModel *)sceneModel success:(void(^)(QuecActionExecuteResultModel *executeResultModel))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| sceneModel |Yes|QuecSceneModel| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Get Scene Details
```
- (void)getSceneInfoWithFid:(NSString *)fid sceneId:(NSString *)sceneId success:(void(^)(QuecSceneModel * scene))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |No|Family id| 
| sceneId |Yes|Scene id, required| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Get Scene Log List
```
- (void)getSceneLogListWithFid:(NSString *)fid lastExecutionId:(long)lastExecutionId limit:(NSInteger)limit success:(void(^)(NSArray<QuecSceneLogItemModel *> *list))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |No|Family id| 
| lastExecutionId |No|Last execution log id| 
| limit |No|Quantity| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Clear Scene Log
```
- (void)clearSceneLogWithFid:(NSString *)fid success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |No|Family id| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Get Scene Log Details
```
- (void)getSceneLogDetailInfoWithExecutionId:(long)executionId success:(void(^)(QuecSceneLogItemModel *detailInfo))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| executionId |Yes|Scene log execution Id| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Batch Add Common Scenes
```
- (void)batchAddCommonSceneWithFid:(NSString *)fid sceneList:(NSArray *)sceneList success:(void(^)(NSDictionary *data))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |No|Family id| 
| sceneList |Yes|Scene Id array| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Batch Delete Common Scenes
```
- (void)batchDeleteCommonSceneWithFid:(NSString *)fid sceneList:(NSArray *)sceneList success:(void(^)(NSDictionary *data))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |No|Family id| 
| sceneList |Yes|Scene Id array| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### QuecActionExecuteResultModel

|Parameter|Type|Description|    
| --- | --- | --- | 
| executeResult |BOOL|Execution result| 
| failCount |NSInteger|Failure count| 
| successCount |NSInteger|Success count| 
| failActionList |NSArray<QuecFailActionModel *> |Success count| 
| isCommonUsed |BOOL|Whether it is commonly used: true-Commonly used, false-Not commonly used| 



#### QuecFailActionModel

|Parameter|Type|Description|    
| --- | --- | --- | 
| productKey |NSString|Product pk| 
| deviceName |NSString|Device name| 
| imageLogo |NSString|Device image| 
| deviceKey |NSString|Device dk| 



#### QuecSceneActionModel

|Parameter|Type|Description|    
| --- | --- | --- | 
| code |NSString|TSL code| 
| itemId |NSInteger|TSL id| 
| dataType |NSString|TSL data type| 
| name |NSString|TSL name| 
| subName |NSString|TSL value name| 
| subType |NSString|TSL subType| 
| unit |NSString|TSL unit| 
| value |id|TSL value may be basic data type, may be NSArray<QuecSceneActionModel *> type| 
| type |NSString|TSL type| 



#### QuecSceneLogItemModel

|Parameter|Type|Description|    
| --- | --- | --- | 
| sceneId |NSString|Scene Id| 
| sceneName |NSString|Scene name| 
| sceneIcon |NSString|Scene icon| 
| executionId |long|Execution id| 
| executionTime |long|Execution time| 
| executionResult |int|Execution result| 
| executionList |NSArray<QuecSceneLogExecutionModel *> |Execution result| 



#### QuecSceneLogExecutionModel

|Parameter|Type|Description|    
| --- | --- | --- | 
| productKey |NSString|Product pk| 
| deviceKey |NSString|Device dk| 
| deviceName |NSString|Device name| 
| logoImage |NSString|Device image| 
| executionResult |int|Execution result| 
| actionResultList |NSArray<QuecSceneLogActionModel *> |Execution result| 



#### QuecSceneLogActionModel

|Parameter|Type|Description|    
| --- | --- | --- | 
| result |BOOL|Result| 
| reason |NSString|Reason| 
| createTime |long|Timestamp| 
| action |QuecSceneActionModel|TSL|



#### QuecSceneModel

|Parameter|Type|Description|    
| --- | --- | --- | 
| fid |NSString|Family Id| 
| isCommon |BOOL|Whether it is commonly used| 
| sceneInfo |long|Timestamp| 
| action |QuecSceneInfoModel|Scene details|



#### QuecSceneInfoModel

|Parameter|Type|Description|    
| --- | --- | --- | 
| sceneId |NSString|Scene Id| 
| name |NSString|Scene name| 
| icon |NSString|Scene icon| 
| metaDataList |NSArray<QuecSceneMetaDataModel *> |Scene device action list|



#### QuecSceneMetaDataModel

|Parameter|Type|Description|    
| --- | --- | --- | 
| actionList |NSArray<QuecSceneActionModel *> |Device action list| 
| deviceKey |NSString|Device dk| 
| productKey |NSString|Product pk| 
| deviceName |NSString|Device name| 
| imageLogo |NSString|Device icon| 
| deviceType |NSInteger|Device type 1 Default ordinary device 2 Group|



## Automation SDK QuecAutomateKit

### QuecAutomateService Class
#### Create Automation
```
+ (void)addAutomationWithModel:(QuecAutomateModel *)model
                       success:(QuecVoidBlock)success
                       failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| model |Yes|QuecAutomateModel| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Edit Automation
```
+ (void)editAutomationWithModel:(QuecAutomateModel *)model
                        success:(QuecVoidBlock)success
                        failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| model |Yes|QuecAutomateModel| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Query Automation List
```
+ (void)getAutomationListWithFid:(nullable NSString *)fid
                      pageNumber:(NSInteger)pageNumber
                        pageSize:(NSInteger)pageSize
                         success:(QuecAutomationModelsSuccessBlock)success
                         failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |No|Family ID, required when home mode is enabled, otherwise not required| 
| pageNumber |No|Current page number, default 1| 
| pageSize |No|Page size, default 10| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Enable or Disable Automation
```
+ (void)updateAutomationSwitchStatusWithFid:(nullable NSString *)fid
                               automationId:(long long)automationId
                                     status:(BOOL)status
                                    success:(QuecVoidBlock)success
                                    failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |No|Family ID, required when home mode is enabled, otherwise not required| 
| automationId |Yes|Automation ID| 
| status |Yes|Enable or disable status, enable: true, disable: false| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|

#### Delete Automation
```
+ (void)deleteAutomationWithFid:(nullable NSString *)fid
                   automationId:(long long)automationId
                        success:(QuecVoidBlock)success
                        failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |No|Family ID, required when home mode is enabled, otherwise not required| 
| automationId |Yes|Automation ID| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Query Automation Details
```
+ (void)getAutomationInfoWithFid:(nullable NSString *)fid
                    automationId:(long long)automationId
                         success:(void(^)(QuecAutomateModel *model))success
                         failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |No|Family ID, required when home mode is enabled, otherwise not required| 
| automationId |Yes|Automation ID| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Test Automation
```
+ (void)testAutomationInfoWithModel:(QuecAutomateModel *)automateModel
                            success:(void(^)(long long testResultId))success
                            failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| automateModel |Yes|QuecAutomateModel| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Query Automation Test Result
```
+ (void)getTestAutomationResultWithId:(long long)testResultId
                              success:(QuecAutomationResultSuccessBlock)success
                              failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| testResultId |Yes|Test result ID| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Query Automation Configuration
```
+ (void)getAutomationTSLWithProductKey:(NSString *)productKey
                                  type:(NSInteger)type
                               success:(QuecAutomationPropertySuccessBlock)success
                               failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| productKey |Yes|Product KEY| 
| type |Yes|Query type: 0: All, 1: Condition, 2: Action| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Get Automation Log List
```
+ (void)getAutomationLogListWithFid:(NSString *)fid lastLogId:(long long)lastLogId limit:(NSInteger)limit success:(void(^)(NSArray<QuecAutomationLogItemModel *> *list))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |No|Family id| 
| lastLogId |Yes|Last log id, used for pagination| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|

#### Get Automation Log Details
```
+ (void)getAutomationLogDetailWithFid:(NSString *)fid logId:(long long)logId success:(void(^)(QuecAutomationLogItemModel *detailInfo))success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| logId |Yes|Log id| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|


#### Delete Automation Execution Logs
```
+ (void)clearAutomationLogsWithFid:(NSString *)fid success:(QuecVoidBlock)success failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| fid |No|Family id| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### QuecAutomateModel

|Parameter|Type|Description|    
| --- | --- | --- | 
| automationId |long long|Automation ID| 
| fid |NSString|Family ID, required when home mode is enabled, otherwise not required| 
| conditionType |QuecAutomateConditionRuleType|Trigger type 1: Satisfy any, 2: Satisfy all| 
| name |NSString|Automation name| 
| nameType |NSInteger|Automation name generation method, 1: System generated, 2: User filled| 
| status |BOOL|Automation execution status true: Enable, false: Disable| 
| precondition |QuecAutomationPreconditionModel|Automation effective time| 
| conditions |NSArray<QuecAutomationConditionModel *> |Automation trigger conditions| 
| actions |NSArray<QuecAutomationActionModel *> |Automation execution actions|



#### QuecAutomateConditionRuleType

|Parameter|Type|Description|    
| --- | --- | --- | 
| QuecAutomateConditionRuleAny |NSInteger|1: Satisfy any| 
| QuecAutomateConditionRuleAny |NSInteger|2: Satisfy all|



#### QuecAutomationPreconditionModel

|Parameter|Type|Description|    
| --- | --- | --- | 
| effectDateType |QuecAutomateEffectDateType|Effective date type. 0: Every day, 1: Every week, 2: Every month, 3: Specified date| 
| effectTimeType |QuecAutomateEffectTimeType|Effective time type. 0: Daytime, 1: Night, 2: All day, 3: Specified time period| 
| startTime |NSString|Start time. Required when the effective time type is all day and specified time period, conforms to HH:mm format| 
| endTime |NSString|End time. Required when the effective time type is all day and specified time period, conforms to HH:mm format| 
| effectDate |NSString|Effective date. Not required when the effective date type is every day. Every week: 1,2,3,...7 means Monday to Sunday, every month: 1-31, specified date: conforms to MM-dd/MM-dd format, example: 12-19/12-2| 
| regionName |NSString|Region name| 
| location |NSString|Coordinates| 
| timeZone |NSString|Timezone|



#### QuecAutomationConditionModel

|Parameter|Type|Description|    
| --- | --- | --- | 
| type |NSInteger|0 Device trigger 1 Time trigger| 
| icon |NSString|Device/Group/Scene icon| 
| name |NSString|Device/Group/Scene name| 
| timer |QuecAutomationTimeModel|Automation trigger condition time| 
| productKey |NSString|Product PK| 
| deviceKey |NSString|Device DK| 
| property |QuecAutomationPropertyModel|TSL attribute| 
| sort |NSInteger|Condition order, starting from 1|



#### QuecAutomationActionModel

|Parameter|Type|Description|    
| --- | --- | --- | 
| type |NSInteger|Execution action type. 1: Delay, 2: Device, 3: Group, 4: Scene| 
| icon |NSString|Device/Group/Scene icon| 
| name |NSString|Device/Group/Scene name| 
| productKey |NSString|Product PK| 
| deviceKey |NSString|Device DK| 
| sceneId |NSString|Scene ID| 
| delayTime |NSNumber|Delay time, unit seconds| 
| property |QuecAutomationPropertyModel|TSL attribute| 
| sort |NSInteger|Condition order, starting from 1|



#### QuecAutomateEffectDateType

|Parameter|Type|Description|    
| --- | --- | --- | 
| QuecAutomateEffectDateTypeEveryday |NSInteger|0 Every day| 
| QuecAutomateEffectDateTypeWeekly |NSInteger|1 Every week| 
| QuecAutomateEffectDateTypeMonthly |NSInteger|2 Every month| 
| QuecAutomateEffectDateTypeNamedDate |NSInteger|3 Specified date|



#### QuecAutomateEffectTimeType

|Parameter|Type|Description|    
| --- | --- | --- | 
| QuecAutomateEffectTimeTypeDaytime |NSInteger|0 Daytime| 
| QuecAutomateEffectTimeTypeNight |NSInteger|1 Night| 
| QuecAutomateEffectTimeTypeWholeDay |NSInteger|2 All day| 
| QuecAutomateEffectTimeTypeSpecificTimePeriod |NSInteger|3 Specified time period|



#### QuecAutomationTimeModel

|Parameter|Type|Description|    
| --- | --- | --- | 
| type |NSInteger|Timing time type Timing time 0 Only once 1 Every day 2 Custom| 
| time |NSString|Timing time| 
| dayOfWeek |NSString|Timing custom time period week combination| 
| timeZone |NSString|Timezone|



#### QuecAutomationPropertyModel

|Parameter|Type|Description|    
| --- | --- | --- | 
| identifier |NSInteger|TSL id, because id is a keyword in Objective-C, so use identifier| 
| code |NSString|TSL code| 
| dataType |NSString|Data type| 
| value |NSString|Value| 
| name |NSString|TSL name| 
| compare |NSString|Attribute value comparison operator| 
| unit |NSString|Unit| 
| subName |NSString|Description|



#### QuecAutomationLogItemModel

|Parameter|Type|Description|    
| --- | --- | --- | 
| logId |long long|Execution log ID| 
| automationId |long long|Automation ID| 
| name |NSString|Automation name| 
| icon |NSString|Automation icon| 
| time |long long|Execution time| 
| result |NSInteger|Execution result: 0. Success 1. Failure 2. Partial success| 
| logDetails |NSArray<QuecAutomationLogItemActionModel *> |Execution log details|



#### QuecAutomationLogItemActionModel

|Parameter|Type|Description|    
| --- | --- | --- | 
| actionName |NSString|Execution action name, device name/scene name/group ID| 
| actionIcon |NSString|Execution action icon, device/group/group| 
| type |NSInteger|Execution action type. 2: Device, 3: Group, 4: Scene| 
| result |BOOL|Execution result, 1: Success, 0: Failure| 
| action |QuecAutomationPropertyModel|TSL attribute| 
| executeTime |long long|Execution time|



## Group SDK QuecGroupKit

### QuecGroupService Class



#### Create Group
```
+ (void)createGroupWithBean:(QuecGroupCreateBean *)bean
                    success:(QuecCreateGroupSuccess)success
                    failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| bean |Yes|QuecGroupCreateBean| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Query Group Details
```
+ (void)getGroupInfoWithId:(NSString *)groupId
                   success:(QuecGroupBeanSuccess)success
                   failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| groupId |Yes|Group id| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Query Group Basic Information
```
+ (void)getGroupDeviceInfoWithId:(NSString *)groupId
                         success:(QuecGroupDeviceSuccess)success
                         failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| groupId |Yes|Group id| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Batch Check if Devices Can Be Added to Group
```
+ (void)checkDeviceAddGroupWithList:(NSArray<QuecGroupCreateDeviceBean *> *)deviceList
                                fid:(NSString *)fid
                            success:(QuecGroupCheckDeviceSuccess)success
                            failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| deviceList |No|NSArray<QuecGroupCreateDeviceBean *> | 
| fid |No|Family id| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Get Addable Device List
```
+ (void)getAddableListWithList:(NSArray<QuecGroupCreateDeviceBean *> *)addedList
                           fid:(NSString *)fid
                          gdid:(nullable NSString *)gdid
                      pageSize:(NSInteger)pageSize
                          page:(NSInteger)page
                       success:(QuecGroupAddableListSuccess)success
                       failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| addedList |Yes|NSArray<QuecGroupCreateDeviceBean *> | 
| fid |No|Family id| 
| gdid |No|Group id| 
| pageSize |No|Page size, default 10| 
| page |No|Page number, default 1| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



### QuecGroupService+control Class
#### Control Group
```
+ (void)controlGroupByHttp:(NSArray<QuecIotDataPoint*> *)dps
                   groupId:(NSString *)groupId
                 extraData:(NSDictionary *)extraData
                   success:(QuecDictionaryBlock)success
                   failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| dps |Yes|Dps array| 
| groupId |Yes|Group id| 
| extraData |No|{ type Type 1: Transparent transmission 2: Attribute 3: Service dataFormat Data type 1: Hex 2: Text (when type is transparent transmission, dataFormat needs to be specified) cacheTime Cache time, unit is seconds, cache time range 1-7776000 seconds, cache must be enabled when cache time is set isCache Whether to enable cache 1: Enable 2: Do not enable, default is not enabled isCover Whether to cover the same command sent before 1: Cover 2: Do not cover, default is not cover, this parameter is valid when cache is enabled }| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Query Group TSL Attribute Values
```
+ (void)groupAttributesById:(NSString *)groupId
                   codeList:(NSString *)codeList
                    success:(void (^)(QuecProductTSLInfoModel *tslInfoModel))success
                    failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| groupId |Yes|Group id| 
| codeList |No|List of attribute values to query, separated by commas| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Query Group TSL Attributes, Including Attribute Values
```
+ (void)groupAttributesById:(NSString *)groupId
                   codeList:(NSString *)codeList
                    success:(void (^)(QuecProductTSLInfoModel *tslInfoModel))success
                    failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| groupId |Yes|Group id| 
| productKey |Yes|Device pk| 
| codeList |No|List of attribute values to query, separated by commas| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



### QuecGroupService+edit Class
#### Edit Group Basic Information
```
+ (void)editGroupBasicInfoWithId:(NSString *)groupId
                 groupDeviceName:(NSString *)groupDeviceName
                             fid:(nullable NSString *)fid
                            frid:(nullable NSString *)frid
                    isCommonUsed:(BOOL)isCommonUsed
                         success:(QuecVoidBlock)success
                         failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| groupId |Yes|Group id| 
| groupDeviceName |Yes|Group name| 
| fid |No|Family id| 
| frid |No|Room id| 
| isCommonUsed |Yes|Whether it is a commonly used device: 0-Not commonly used 1-Commonly used| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Edit Group Information
```
+ (void)editGroupInfoWithId:(NSString *)groupId
                       name:(NSString *)name
                        fid:(NSString *)fid
                       frid:(NSString *)frid
               isCommonUsed:(BOOL)isCommonUsed
                 deviceList:(NSArray<NSDictionary *> *)deviceList
                    success:(QuecDictionaryBlock)success
                    failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| groupId |Yes|Group id| 
| name |Yes|Group name| 
| fid |No|Family id| 
| frid |No|Room id| 
| isCommonUsed |Yes|Whether it is a commonly used device: 0-Not commonly used 1-Commonly used| 
| deviceList |No|Device list| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Batch Add or Remove Group to Commonly Used
```
+ (void)batchAddCommonWithIds:(NSArray<NSString *> *)groupIds
                          fid:(NSString *)fid
                 isCommonUsed:(BOOL)isCommonUsed
                      success:(QuecGroupBatchResultBlock)success
                      failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| groupIds |Yes|Group id list| 
| fid |No|Family id| 
| isCommonUsed |Yes|Whether it is a commonly used device: 0-Not commonly used 1-Commonly used| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|

#### Batch Move Group to New Room
```
+ (void)batchMovingWithIds:(NSArray<NSString *> *)groupIds
                   newFrid:(NSString *)newFrid
                   success:(QuecGroupBatchResultBlock)success
                   failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| groupIds |Yes|Group id list| 
| newFrid |Yes|New room id| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Batch Delete Group
```
+ (void)deleteGroupWithIds:(NSArray<NSString *> *)groupIds
                   success:(QuecGroupBatchResultBlock)success
                   failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| groupIds |Yes|Group id list| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



### QuecGroupService+share Class
#### Share User Set Group Share Information
```
+ (void)getShareCodeWithGroupId:(NSString *)groupId
              acceptingExpireAt:(long)acceptingExpireAt
           isSharingAlwaysValid:(BOOL)isSharingAlwaysValid
                sharingExpireAt:(long)sharingExpireAt
                      coverMark:(NSInteger)coverMark
                        success:(void(^)(NSString *shareCode))success
                        failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| groupId |Yes|Group id| 
| acceptingExpireAt |Yes|Share QR code seed expiration time timestamp (milliseconds), indicating that the share will expire if not used within this timestamp| 
| isSharingAlwaysValid |Yes|Whether the device is permanently valid| 
| sharingExpireAt |No|Device usage expiration time timestamp (milliseconds), indicating the time the shared group can be used by the shared user, if not filled, it is permanently valid| 
| coverMark |Yes|Cover mark 1 Directly cover the previous valid share (default) (cover the original share code) 2 Directly add, allowing multiple coexist 3 Only allow covering the previous share if the share time is extended| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Get Group Share User List
```
+ (void)getSharedListsWithGroupId:(NSString *)groupId
                          success:(void(^)(NSArray<QuecShareUserModel *> *list))success
                          failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| groupId |Yes|Group id| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Share User Cancel Share
```
+ (void)ownerUnShareWithShareCode:(NSString *)shareCode
                          success:(QuecVoidBlock)success
                          failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| shareCode |Yes|Share code| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Shared User Cancel Share
```
+ (void)unShareWithShareCode:(NSString *)shareCode
                     success:(QuecVoidBlock)success
                     failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| shareCode |Yes|Share code| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Shared User Accept Share
```
+ (void)acceptShareWithShareCode:(NSString *)shareCode
                         success:(QuecVoidBlock)success
                         failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| shareCode |Yes|Share code| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### Query Shared Group Information
```
+ (void)shareGroupInfoWithShareCode:(NSString *)shareCode
                            success:(QuecDictionaryBlock)success
                            failure:(QuecErrorBlock)failure;
```

|Parameter|Required|Description|    
| --- | --- | --- | 
| shareCode |Yes|Share code| 
| success |No|Callback for successful request| 
| failure |No|Callback for failed request|



#### QuecGroupBatchResultBean

|Parameter|Type|Description|    
| --- | --- | --- | 
| code |NSString|Request result code| 
| msg |NSString|Request result prompt| 
| gdid |NSString|Group id|



#### QuecGroupBean

|Parameter|Type|Description|    
| --- | --- | --- | 
| name |NSString|Group name| 
| fid |NSString|Family id| 
| frid |NSString|Room id| 
| gdid |NSString|Group id| 
| roomName |NSString|Room name| 
| onlineStatus |NSUInteger|Device cloud online status: 0-Offline 1-Online| 
| productKey |NSString|Device pk| 
| deviceKey |NSString|Device dk| 
| isCommonUsed |BOOL|Whether it is a commonly used device: 0-Not commonly used 1-Commonly used| 
| groupDeviceDeviceNum |NSUInteger|Number of devices in the group| 
| deviceList |NSArray<QuecGroupDeviceBean *> |Group device list|



#### QuecGroupDeviceBean

|Parameter|Type|Description|    
| --- | --- | --- | 
| productKey |NSString|Device pk| 
| deviceKey |NSString|Device dk| 
| deviceName |NSString|Device name| 
| logoImage |NSString|Device logo image| 
| frid |NSString|Room id| 
| roomName |NSString|Room name| 
| onlineStatus |NSUInteger|Device cloud online status: 0-Offline 1-Online| 
| msg |NSString|Interface response message prompt| 
| code |NSUInteger|Interface response code|



#### QuecGroupCreateBean

|Parameter|Type|Description|    
| --- | --- | --- | 
| groupDeviceName |NSString|Group name| 
| fid |NSString|Family id| 
| frid |NSString|Room id| 
| isCommonUsed |BOOL|Whether it is a commonly used device: 0-Not commonly used 1-Commonly used| 
| onlineStatus |NSUInteger|Device cloud online status: 0-Offline 1-Online| 
| deviceList |NSArray<QuecGroupCreateDeviceBean *> |Device list|



#### QuecGroupCreateDeviceBean

|Parameter|Type|Description|    
| --- | --- | --- | 
| productKey |NSString|Device pk| 
| deviceKey |NSString|Device dk|



#### QuecGroupCreateResultBean

|Parameter|Type|Description|    
| --- | --- | --- | 
| groupDeviceInfo |QuecDeviceModel|Device data| 
| successList |NSArray<QuecGroupDeviceBean *> |Successful device list| 
| failList |NSArray<QuecGroupDeviceBean *> |Failed device list|
