//
//  LoginViewController.m
//  QuecUserKitExample
//
//  Created by quectel.steven on 2021/9/3.
//

#import "LoginViewController.h"
#import "HomeViewController.h"
#import "MyCenterViewController.h"
#import "SmsLogingViewController.h"
#import "RegisterViewController.h"
#import "ForgetPasswordViewController.h"
#import "AutomateAndSceneVC.h"
#import "EmailLoginViewController.h"
#import <QuecUserKit/QuecUserKit.h>
#import <Toast/Toast.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import "ThirdLoginViewController.h"

static NSString * const UserDomainCN = @"";
static NSString * const UserSecretCN = @"";
static NSString * const UserDomainEU = @"";
static NSString * const UserSecretEU = @"";
static NSString * const UserDomainNA = @"";
static NSString * const UserSecretNA = @"";

@interface LoginViewController ()

@property (nonatomic, strong) UIButton *serviceTypeButton;
@property (nonatomic, strong) UIButton *privateServiceButton;
@property (nonatomic, strong) UITextField *countryCodeField;
@property (nonatomic, strong) UITextField *phoneTextField;
@property (nonatomic, strong) UITextField *pswTextField;

@end

@implementation LoginViewController

- (void)startWithUserDomain:(NSString *)userDomain userDomainSecret:(NSString *)userDomainSecret cloudServiceType:(QuecCloudServiceType)cloudServiceType{
    [[QuecIoTAppSDK sharedInstance] startWithUserDomain:userDomain userDomainSecret:userDomainSecret cloudServiceType:cloudServiceType];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Password Login";
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat viewWidth = self.view.frame.size.width;
    CGFloat viewHeight = self.view.frame.size.height;
    
    NSString *currentDomian = [[NSUserDefaults standardUserDefaults] objectForKey:@"QuecUserDomain"];
    if (currentDomian.length == 0) {
        [self cacheUserDomain:UserDomainCN userDomainSecret:UserSecretCN cloudServiceType:QuecCloudServiceTypeChina];
        [self startWithUserDomain:UserDomainCN userDomainSecret:UserSecretCN cloudServiceType:QuecCloudServiceTypeChina];
    }
    NSString *cloudTitle = @"Data Center: Mainland China";
    if ([currentDomian isEqualToString:UserDomainEU]) {
        cloudTitle = @"Data Center: Europe";
    }else if ([currentDomian isEqualToString:UserDomainNA]) {
        cloudTitle = @"Data Center: North America";
    }
    _serviceTypeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_serviceTypeButton setTitle:cloudTitle forState:UIControlStateNormal];
    _serviceTypeButton.frame = CGRectMake(30, 130, 100, 30);
    [_serviceTypeButton setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    _serviceTypeButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [_serviceTypeButton addTarget:self action:@selector(_serviceTypeButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_serviceTypeButton];
    
    
    _privateServiceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_privateServiceButton setTitle:@"Private Cloud" forState:UIControlStateNormal];
    _privateServiceButton.frame = CGRectMake(160, 130, 100, 30);
    [_privateServiceButton setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    _privateServiceButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [_privateServiceButton addTarget:self action:@selector(_privateServiceButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_privateServiceButton];
    
    self.countryCodeField = [[UITextField alloc] initWithFrame:CGRectMake(30, 170,viewWidth - 110, 50)];
    self.countryCodeField.borderStyle = UITextBorderStyleRoundedRect;
    self.countryCodeField.placeholder = @"Please enter country code";
    self.countryCodeField.keyboardType = UIKeyboardTypeNumberPad;
    self.countryCodeField.textColor = [UIColor lightGrayColor];
    self.countryCodeField.font = [UIFont systemFontOfSize:16];
    self.countryCodeField.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:self.countryCodeField];
    
    self.phoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(30, 250,viewWidth - 110, 50)];
    self.phoneTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.phoneTextField.placeholder = @"Please enter phone number";
    self.phoneTextField.textColor = [UIColor lightGrayColor];
    self.phoneTextField.font = [UIFont systemFontOfSize:16];
    self.phoneTextField.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:self.phoneTextField];
    
    UIButton *phoneCheckButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [phoneCheckButton setTitle:@"Verification" forState:UIControlStateNormal];
    phoneCheckButton.frame = CGRectMake(viewWidth - 80, 250, 50, 50);
    [phoneCheckButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    phoneCheckButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [phoneCheckButton addTarget:self action:@selector(phoneCheckButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:phoneCheckButton];
    
    
    self.pswTextField = [[UITextField alloc] initWithFrame:CGRectMake(30, 330,viewWidth - 60, 50)];
    self.pswTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.pswTextField.placeholder = @"Please enter password";
    self.pswTextField.textColor = [UIColor lightGrayColor];
    self.pswTextField.font = [UIFont systemFontOfSize:16];
    self.pswTextField.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:self.pswTextField];
    
    CGFloat buttonWidth = 80;
    CGFloat marginLeft = (viewWidth - 4 * buttonWidth) / 5;
    UIButton *smsLoginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [smsLoginButton setTitle:@"Verification Code Login" forState:UIControlStateNormal];
    smsLoginButton.frame = CGRectMake(marginLeft, 400, buttonWidth + marginLeft, 30);
    [smsLoginButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    smsLoginButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [smsLoginButton addTarget:self action:@selector(smsLoginButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:smsLoginButton];
    
    UIButton *emailLoginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [emailLoginButton setTitle:@"Email Login" forState:UIControlStateNormal];
    emailLoginButton.frame = CGRectMake(marginLeft * 2 + buttonWidth, 400, buttonWidth, 30);
    [emailLoginButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    emailLoginButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [emailLoginButton addTarget:self action:@selector(emailLoginButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:emailLoginButton];
    
    UIButton *forgetPswButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [forgetPswButton setTitle:@"Forgot Password" forState:UIControlStateNormal];
    forgetPswButton.frame = CGRectMake(marginLeft * 3 + buttonWidth * 2, 400, buttonWidth, 30);
    [forgetPswButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    forgetPswButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [forgetPswButton addTarget:self action:@selector(forgetPswButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetPswButton];
    
    UIButton *otherButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [otherButton setTitle:@"Other Login" forState:UIControlStateNormal];
    otherButton.frame = CGRectMake(marginLeft * 4 + buttonWidth * 3, 400, buttonWidth, 30);
    [otherButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    otherButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [otherButton addTarget:self action:@selector(otherButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:otherButton];
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    loginButton.layer.cornerRadius = 10.0;
    loginButton.layer.borderColor = [UIColor grayColor].CGColor;
    loginButton.layer.borderWidth = 0.5;
    [loginButton setTitle:@"Login" forState:UIControlStateNormal];
    loginButton.frame = CGRectMake(30, 460, viewWidth - 60, 44);
    [loginButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    loginButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    UIButton *registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [registerButton setTitle:@"Register Now" forState:UIControlStateNormal];
    registerButton.frame = CGRectMake(30, viewHeight - 74 , viewWidth - 60, 30);
    [registerButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    registerButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [registerButton addTarget:self action:@selector(registerButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
}

- (void)_serviceTypeButtonClick{
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"Please select data center" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    @quec_weakify(self);
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"Mainland China" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        @quec_strongify(self);
        [self startWithUserDomain:UserDomainCN userDomainSecret:UserSecretCN cloudServiceType:QuecCloudServiceTypeChina];
        [self cacheUserDomain:UserDomainCN userDomainSecret:UserSecretCN cloudServiceType:QuecCloudServiceTypeChina];
        [self.serviceTypeButton setTitle:@"Data Center: Mainland China" forState:(UIControlStateNormal)];
    }];
    [alertVc addAction:action1];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"Europe" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        @quec_strongify(self);
        [self startWithUserDomain:UserDomainEU userDomainSecret:UserSecretEU cloudServiceType:QuecCloudServiceTypeEurope];
        [self cacheUserDomain:UserDomainEU userDomainSecret:UserSecretEU cloudServiceType:QuecCloudServiceTypeEurope];
        [self.serviceTypeButton setTitle:@"Data Center: Europe" forState:(UIControlStateNormal)];
    }];
    [alertVc addAction:action2];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"North America" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        @quec_strongify(self);
        [self startWithUserDomain:UserDomainNA userDomainSecret:UserSecretNA cloudServiceType:QuecCloudServiceTypeNorthAmerica];
        [self cacheUserDomain:UserDomainNA userDomainSecret:UserSecretNA cloudServiceType:QuecCloudServiceTypeNorthAmerica];
        [self.serviceTypeButton setTitle:@"Data Center: North America" forState:(UIControlStateNormal)];
    }];
    [alertVc addAction:action3];
    
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertVc addAction:cancleAction];
    [self presentViewController:alertVc animated:true completion:nil];
}

- (void)_privateServiceButtonClick {
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"Configuration" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"Confirm" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self startPrivate:alertVc];
    }];
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertVc addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Please enter userDomain";
        
    }];
    [alertVc addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Please enter userDomainSecret";
        
    }];
    [alertVc addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Please enter baseUrl";
        
    }];
    [alertVc addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Please enter webSocketUrl";
        
    }];
    [alertVc addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Please enter webSocketV2Url";
        
    }];
    [alertVc addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Please enter mcc";
        
    }];
    [alertVc addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Please enter tcpAddr";
        
    }];
    [alertVc addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Please enter pskAddr";
        
    }];
    [alertVc addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Please enter tlsAddr";
        
    }];
    [alertVc addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Please enter cerAddr";
        
    }];
    [alertVc addAction:sureAction];
    [alertVc addAction:cancleAction];
    [self presentViewController:alertVc animated:true completion:nil];
}

- (void)startPrivate:(UIAlertController *)alert {
    QuecPublicConfig *config = [[QuecPublicConfig alloc] init];
    for(int i = 0; i < alert.textFields.count; i ++) {
        NSString *value = alert.textFields[i].text ? (alert.textFields[i].text) : (@"");
        switch (i) {
            case 0:
                config.userDomain = value;
                break;
            case 1:
                config.userDomainSecret = value;
                break;
            case 2:
                config.baseUrl = value;
                break;
            case 3:
                config.webSocketUrl = value;
                break;
            case 4:
                config.webSocketV2Url = value;
                break;
            case 5:
                config.mcc = value;
                break;
            case 6:
                config.tcpAddr = value;
                break;
            case 7:
                config.pskAddr = value;
                break;
            case 8:
                config.tlsAddr = value;
                break;
            case 9:
                config.cerAddr = value;
                break;
        }
    }
    [[QuecIoTAppSDK sharedInstance] startWithConfig:config];
}

- (void)cacheUserDomain:(NSString *)userDomain userDomainSecret:(NSString *)userDomainSecret cloudServiceType:(QuecCloudServiceType)cloudServiceType{
    [[NSUserDefaults standardUserDefaults] setObject:userDomain ? : @"" forKey:@"QuecUserDomain"];
    [[NSUserDefaults standardUserDefaults] setObject:userDomainSecret ? : @"" forKey:@"QuecUserDomainSecret"];
    [[NSUserDefaults standardUserDefaults] setObject:@(cloudServiceType) forKey:@"QuecCloudServiceType"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)phoneCheckButtonClick {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[QuecUserService sharedInstance] queryPhoneIsRegister:self.phoneTextField.text internationalCode:self.countryCodeField.text ? : @"86" success:^(BOOL isRegister) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        if (isRegister) {
            [self.view makeToast:@"Phone number is already registered" duration:3 position:CSToastPositionCenter];
        }
        else {
            [self.view makeToast:@"Phone number is not registered" duration:3 position:CSToastPositionCenter];
        }
        } failure:^(NSError *error) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [self.view makeToast:error.localizedDescription duration:3 position:CSToastPositionCenter];
        }];
}

- (void)smsLoginButtonClick {
    [self.navigationController pushViewController:[[SmsLogingViewController alloc] init] animated:YES];
}
- (void)forgetPswButtonClick {
    ForgetPasswordViewController *forgetVc = [[ForgetPasswordViewController alloc] init];
    forgetVc.type = 1;
    [self.navigationController pushViewController:forgetVc animated:YES];
}

- (void)emailLoginButtonClick {
    [self.navigationController pushViewController:[[EmailLoginViewController alloc] init] animated:YES];
}

- (void)otherButtonClick {
    [self.navigationController pushViewController:[[ThirdLoginViewController alloc] init] animated:YES];
}

- (void)loginButtonClick {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[QuecUserService sharedInstance] loginByPhone:self.phoneTextField.text ? : @"" password:self.pswTextField.text ? : @"" internationalCode:self.countryCodeField.text.length ? self.countryCodeField.text : @"86" success:^{
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [self.view makeToast:@"Login Successful" duration:3 position:CSToastPositionCenter];
        [[QuecIoTAppSDK sharedInstance] setCountryCode:self.countryCodeField.text.length ? self.countryCodeField.text : @"86"];
        [[NSUserDefaults standardUserDefaults] setObject:self.countryCodeField.text.length ? self.countryCodeField.text : @"86" forKey:@"QuecCountryCode"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self loginSuccess];
        } failure:^(NSError *error) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [self.view makeToast:error.localizedDescription duration:3 position:CSToastPositionCenter];
        }];
}

- (void)registerButtonClick {
    [self.navigationController pushViewController:[[RegisterViewController alloc] init] animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.phoneTextField resignFirstResponder];
    [self.pswTextField resignFirstResponder];
}

- (void)loginSuccess {
    UITabBarController *tabbarVc = [[UITabBarController alloc] init];
    HomeViewController *homeVc=[[HomeViewController alloc]init];
    homeVc.tabBarItem.title=@"Home";
    homeVc.view.backgroundColor = [UIColor whiteColor];
    
    AutomateAndSceneVC *groupVc=[[AutomateAndSceneVC alloc]init];
    groupVc.tabBarItem.title=@"Group";
    groupVc.view.backgroundColor = [UIColor whiteColor];
    
    MyCenterViewController *myVc=[[MyCenterViewController alloc]init];
    myVc.tabBarItem.title=@"My";
    myVc.view.backgroundColor = [UIColor whiteColor];

    tabbarVc.viewControllers = @[[[UINavigationController alloc] initWithRootViewController:homeVc],[[UINavigationController alloc] initWithRootViewController:groupVc],[[UINavigationController alloc] initWithRootViewController:myVc]];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = tabbarVc;
}


@end
