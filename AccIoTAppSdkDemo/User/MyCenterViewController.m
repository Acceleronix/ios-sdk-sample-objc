//
//  MyCenterViewController.m
//  QuecUserKitExample
//
//  Created by quectel.steven on 2021/9/4.
//

#import "MyCenterViewController.h"
#import <Toast/Toast.h>
#import <QuecUserKit/QuecUserKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "UpdateInputViewController.h"
#import "UpdatePswViewController.h"
#import "UpdatePhoneViewController.h"
#import "LoginViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import <QuecSmartHomeKit/QuecSmartHomeKit.h>

@interface MyCenterViewController () <UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UILabel *nickName;
@property (nonatomic, strong) UILabel *adress;

@property (nonatomic, strong) UIImagePickerController *imagePickerController;


@end

@implementation MyCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"My";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = YES;
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableHeaderView = [self getTableHeaderView];
    self.tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:self.tableView];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [self getFamilyModeConfig];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self getUserInfo];
}

- (void)getUserInfo {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[QuecUserService sharedInstance] getUserInfoWithSuccess:^(NSDictionary *data) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
        [self handleUserInfo:data];
        } failure:^(NSError *error) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [self.view makeToast:error.localizedDescription duration:3 position:CSToastPositionCenter];
        }];
}

- (void)handleUserInfo:(NSDictionary *)userInfo {
    if ([QuecUserService sharedInstance].nikeName.length) {
        self.nickName.text = [QuecUserService sharedInstance].nikeName;
    }
    else {
        self.nickName.text = [QuecUserService sharedInstance].phone;
    }
    if ([QuecUserService sharedInstance].headimg.length) {
        [self.headImageView sd_setImageWithURL:[NSURL URLWithString:[QuecUserService sharedInstance].headimg]];
    }
    if ([QuecUserService sharedInstance].address.length) {
        self.adress.text = [QuecUserService sharedInstance].address;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"CellID"];
    }
    cell.textLabel.text = @"";
    NSString *famStr = [NSString stringWithFormat:@"Family Mode%@", QuecSmartHomeService.sharedInstance.enable ? @"Enabled" : @"Disabled"];
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Modify Nickname";
            break;
        case 1:
            cell.textLabel.text = @"Modify Address";
            break;
        case 2:
            cell.textLabel.text = @"Modify Password";
            break;
        case 3:
            cell.textLabel.text = @"Modify Phone Number";
            break;
        case 4:
            cell.textLabel.text = @"Log out of Account";
            break;
        case 5:
            cell.textLabel.text = @"Log out";
            break;
        case 6:
            
            cell.textLabel.text = famStr;
            break;
            
        default:
            break;
    }
    cell.textLabel.textColor = [UIColor lightGrayColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0: {
            UpdateInputViewController *updateVc = [[UpdateInputViewController alloc] init];
            updateVc.type = 1;
            updateVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:updateVc animated:YES];
        }
            break;
        case 1: {
            UpdateInputViewController *updateVc = [[UpdateInputViewController alloc] init];
            updateVc.type = 2;
            updateVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:updateVc animated:YES];
        }
            break;
        case 2: {
            UpdatePswViewController *updatePswVc = [[UpdatePswViewController alloc] init];
            updatePswVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:updatePswVc animated:YES];
        }
            break;
        case 3: {
            UpdatePhoneViewController *updatePhoneVc = [[UpdatePhoneViewController alloc] init];
            updatePhoneVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:updatePhoneVc animated:YES];
        }
            break;
        case 4: {
            [self showCancellationAlert];
        }
            break;
        case 5: {
            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            [[QuecUserService sharedInstance] logoutWithSuccess:^{
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                [UIApplication sharedApplication].keyWindow.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[LoginViewController alloc] init]];
                        } failure:^(NSError *error) {
                            [UIApplication sharedApplication].keyWindow.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[LoginViewController alloc] init]];
                            [MBProgressHUD hideHUDForView:self.view animated:YES];
                            [self.view makeToast:error.localizedDescription duration:3 position:CSToastPositionCenter];
                        }];
        }
            break;
        case 6: {
            [self changeHomeState];
        }
            break;
            
        default:
            break;
    }
}

- (UIView *)getTableHeaderView {
    CGFloat viewWidth = self.view.frame.size.width;
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    
    self.headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 50, 100, 100)];
    self.headImageView.layer.cornerRadius = 50.0;
    self.headImageView.layer.masksToBounds = YES;
    self.headImageView.backgroundColor = [UIColor grayColor];
    [headerView addSubview:self.headImageView];
    
    self.headImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeHeadImage)];
    [self.headImageView addGestureRecognizer:tap];
    
    self.nickName = [[UILabel alloc] initWithFrame:CGRectMake(150, 50, viewWidth - 180, 50)];
    self.nickName.textColor = [UIColor lightGrayColor];
    self.nickName.font = [UIFont systemFontOfSize:16];
    self.nickName.text = @"";
    [headerView addSubview:self.nickName];

    self.adress = [[UILabel alloc] initWithFrame:CGRectMake(150, 100, viewWidth - 180, 50)];
    self.adress.textColor = [UIColor lightGrayColor];
    self.adress.font = [UIFont systemFontOfSize:16];
    self.adress.text = @"";
    [headerView addSubview:self.adress];
    return headerView;
}

- (UIImagePickerController *)imagePickerController {
    if (_imagePickerController == nil) {
        _imagePickerController = [[UIImagePickerController alloc] init];
        _imagePickerController.delegate = self;
        _imagePickerController.allowsEditing = YES;
    }
    return _imagePickerController;
}


- (void)changeHeadImage{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];

        UIAlertAction *camera = [UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self checkCameraPermission];
        }];
        UIAlertAction *album = [UIAlertAction actionWithTitle:@"Photo Album" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
             [self checkAlbumPermission];
        }];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }];

        [alert addAction:camera];
        [alert addAction:album];
        [alert addAction:cancel];

        [self presentViewController:alert animated:YES completion:nil];
    
}

#pragma mark - Camera
- (void)checkCameraPermission {
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (status == AVAuthorizationStatusNotDetermined) {
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if (granted) {
                [self takePhoto];
            }
        }];
    } else if (status == AVAuthorizationStatusDenied || status == AVAuthorizationStatusRestricted) {
//        [self alertCamear];
    } else {
        [self takePhoto];
    }
}

- (void)takePhoto {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:self.imagePickerController animated:YES completion:^{

            }];
        });
        
    }
}

#pragma mark - Album
- (void)checkAlbumPermission {
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusNotDetermined) {
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (status == PHAuthorizationStatusAuthorized) {
                    [self selectAlbum];
                }
            });
        }];
    } else if (status == PHAuthorizationStatusDenied || status == PHAuthorizationStatusRestricted) {
        [self alertAlbum];
    } else {
        [self selectAlbum];
    }
}

- (void)selectAlbum {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        self.imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:self.imagePickerController animated:YES completion:^{

        }];
    }
}

- (void)alertAlbum {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"Please enable photo album in settings" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = [info valueForKey:UIImagePickerControllerEditedImage];
//    self.avatar.image = image;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[QuecUserService sharedInstance] updateUserHeadIcon:image success:^{
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
        self.headImageView.image = image;

    } failure:^(NSError *error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}

- (void)showCancellationAlert {
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"Warm Reminder" message:@"Are you sure you want to log out of your account?" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction *confrimAction = [UIAlertAction actionWithTitle:@"Sure" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self confirmCancellation];
    }];
    [alertVc addAction:cancleAction];
    [alertVc addAction:confrimAction];
    [self presentViewController:alertVc animated:YES completion:nil];
}

- (void)confirmCancellation {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[QuecUserService sharedInstance] deleteUser:1 success:^{
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [UIApplication sharedApplication].keyWindow.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[LoginViewController alloc] init]];
                } failure:^(NSError *error) {
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                    [self.view makeToast:error.localizedDescription duration:3 position:CSToastPositionCenter];
                }];
}


- (void)changeHomeState {
    @quec_weakify(self);
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [QuecSmartHomeService.sharedInstance enabledFamilyMode:!QuecSmartHomeService.sharedInstance.enable success:^{
        @quec_strongify(self);
        [self getFamilyModeConfig];
        
    } failure:^(NSError *error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [self.view makeToast:error.localizedDescription duration:3 position:CSToastPositionCenter];
    }];
}

- (void)getFamilyModeConfig {
    [QuecSmartHomeService.sharedInstance getFamilyModeConfigWithSuccess:^(NSDictionary *dictionary) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [self.view makeToast:error.localizedDescription duration:3 position:CSToastPositionCenter];
    }];
}

@end
