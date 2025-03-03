//
//  SmsLogingViewController.m
//  QuecUserKitExample
//
//  Created by quectel.steven on 2021/9/3.
//

#import "SmsLogingViewController.h"
#import <Toast/Toast.h>
#import <QuecUserKit/QuecUserKit.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import "HomeViewController.h"
#import "MyCenterViewController.h"
#import "DeviceGroupViewController.h"

@interface SmsLogingViewController ()
@property (nonatomic, strong) UITextField *countryCodeField;
@property (nonatomic, strong) UITextField *phoneTextField;
@property (nonatomic, strong) UITextField *pswTextField;
@end

@implementation SmsLogingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Verification Code Login";
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat viewWidth = self.view.frame.size.width;
    
    self.countryCodeField = [[UITextField alloc] initWithFrame:CGRectMake(30, 150,viewWidth - 60, 50)];
    self.countryCodeField.borderStyle = UITextBorderStyleRoundedRect;
    self.countryCodeField.placeholder = @"Please enter country code";
    self.countryCodeField.keyboardType = UIKeyboardTypeNumberPad;
    self.countryCodeField.textColor = [UIColor lightGrayColor];
    self.countryCodeField.font = [UIFont systemFontOfSize:16];
    self.countryCodeField.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:self.countryCodeField];
    
    self.phoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(30, 230,viewWidth - 60, 50)];
    self.phoneTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.phoneTextField.placeholder = @"Please enter phone number";
    self.phoneTextField.textColor = [UIColor lightGrayColor];
    self.phoneTextField.font = [UIFont systemFontOfSize:16];
    self.phoneTextField.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:self.phoneTextField];
    
    self.pswTextField = [[UITextField alloc] initWithFrame:CGRectMake(30, 310,viewWidth - 180, 50)];
    self.pswTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.pswTextField.placeholder = @"Please enter the verification code";
    self.pswTextField.textColor = [UIColor lightGrayColor];
    self.pswTextField.font = [UIFont systemFontOfSize:16];
    self.pswTextField.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:self.pswTextField];
    
    UIButton *smsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [smsButton setTitle:@"Get Verification Code" forState:UIControlStateNormal];
    smsButton.frame = CGRectMake(viewWidth - 120, 320, 90, 30);
    [smsButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    smsButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [smsButton addTarget:self action:@selector(smsButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:smsButton];
    
    
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
    
}

- (void)loginButtonClick {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[QuecUserService sharedInstance] loginWithMobile:self.phoneTextField.text ? : @"" code:self.pswTextField.text ? : @"" internationalCode:self.countryCodeField.text.length ? self.countryCodeField.text : @"86" success:^{
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

- (void)smsButtonClick {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[QuecUserService sharedInstance] sendVerifyCodeByPhone:self.phoneTextField.text ? : @"" internationalCode:@"86" type:QuecVerifyCodeTypeLogin ssid:nil stid:nil success:^{
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [self.view makeToast:@"Verification code sent successfully" duration:3 position:CSToastPositionCenter];
    } failure:^(NSError *error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [self.view makeToast:error.localizedDescription duration:3 position:CSToastPositionCenter];
    }];
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
    
    DeviceGroupViewController *groupVc=[[DeviceGroupViewController alloc]init];
    groupVc.tabBarItem.title=@"Group";
    groupVc.view.backgroundColor = [UIColor whiteColor];
    
    MyCenterViewController *myVc=[[MyCenterViewController alloc]init];
    myVc.tabBarItem.title=@"My";
    myVc.view.backgroundColor = [UIColor whiteColor];

    tabbarVc.viewControllers = @[[[UINavigationController alloc] initWithRootViewController:homeVc],[[UINavigationController alloc] initWithRootViewController:groupVc],[[UINavigationController alloc] initWithRootViewController:myVc]];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = tabbarVc;
}

@end
