//
//  AccBleOTAViewController.m
//  AccIoTAppSdkDemo
//
//  Created by Leo Xue on 2024/11/12.
//

#import "AccBleOTAViewController.h"
#import <QuecOTAUpgradeKit/QuecOTAUpgradeKit.h>
#import "AccOTAPlanInfoModel.h"
#import <QuecDeviceKit/QuecDeviceKit.h>
#import <QuecFoundationKit/QuecFoundationKit.h>
#import <QuecCommonUtil/QuecCommonUtil.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import <Toast/Toast.h>

@interface AccBleOTAViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSArray *dataArray;

@end

@implementation AccBleOTAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setTitle:@"Back" forState:UIControlStateNormal];
    backButton.frame = CGRectMake(0, 0, 50, 50);
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    backButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [backButton addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    @quec_weakify(self);
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [self loadPureBLEDeviceData:^(NSArray * _Nullable array) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        @quec_strongify(self);
        if (array) {
            self.dataArray = [NSArray arrayWithArray:array];
        }
        [self.tableView reloadData];
    }];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [[UIView alloc] init];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    [self addListener];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self removeListener];
}

- (void)backButtonClick {
    if ([QuecBleOTAManager.sharedInstance checkForUpgradableDevices]) {
        UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"Confirm Exit" message:@"Exiting this page will interrupt the Bluetooth device upgrade. Are you sure you want to exit?" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"Exit" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self.navigationController popViewControllerAnimated:YES];
        }];
        UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alertVc addAction:sureAction];
        [alertVc addAction:cancleAction];
        [self presentViewController:alertVc animated:true completion:nil];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"CellID"];
    }
    AccOTAPlanInfoModel *model = self.dataArray[indexPath.row];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.text = model.deviceName;
    cell.detailTextLabel.textColor = [UIColor lightGrayColor];
    QuecBleStateModel *bleStateModel = [QuecBleOTAManager.sharedInstance getDeviceProgressAndState:quec_deviceId(model.pk, model.dk)];
    model.upgradeProgress = bleStateModel.progress;
    model.otaStatus = bleStateModel.otaState;
    
    if (model.otaStatus == 0) {
        cell.detailTextLabel.text = @"Pending Update";
    }else if (model.otaStatus == 1){
        int progress = (int)(model.upgradeProgress * 100);
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%d%s",progress, "%"];
    }else if (model.otaStatus == 2){
        cell.detailTextLabel.text = @"Update Successful";
    }else if (model.otaStatus == 3){
        cell.detailTextLabel.text = @"Retry";
    }else if (model.otaStatus == 4){
        cell.detailTextLabel.text = @"Update Failed";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    AccOTAPlanInfoModel *model = self.dataArray[indexPath.row];
    if (model.otaStatus == 2 || model.otaStatus == 4 || model.otaStatus == 1) {
        return;
    }
    
    if (model == nil) {
        return;
    }
    
    NSMutableArray *planList = [NSMutableArray array];
    QuecBleOTAInfoModel *infoModel = [QuecBleOTAManager.sharedInstance getBleOTAInfoModel:quec_deviceId(model.pk, model.dk)];
    if (infoModel != nil) {
        [planList addObject:infoModel];
    }
    
    if (planList.count) {
        [QuecBleOTAManager.sharedInstance startOTAWithInfoList:planList.copy];
    }
    
}

#pragma mark - private method
- (void)loadPureBLEDeviceData:(void (^)(NSArray<AccOTAPlanInfoModel *> * _Nullable array))success {
    NSArray<NSDictionary<NSString *, NSString *> *> *bleList = [QuecDevice getConnectedBleList];
    if (!bleList || bleList.count == 0) {
        success(nil);
        return;
    }
    
    NSMutableArray<AccOTAPlanInfoModel *> *dataArray = [NSMutableArray array];
    dispatch_group_t dispatchGroup = dispatch_group_create();

    for (NSDictionary<NSString *, NSString *> *dict in bleList) {
        NSString *pk = dict[@"pk"];
        NSString *dk = dict[@"dk"];
        if (!pk || !dk) {
            continue;
        }
        
        dispatch_group_enter(dispatchGroup);
        
        [QuecBleOTAManager.sharedInstance checkVersionWithProductKey:pk deviceKey:dk infoBlock:^(QuecBleOTAInfoModel * _Nullable infoModel) {
            if (infoModel) {
                AccOTAPlanInfoModel *otaModel = [[AccOTAPlanInfoModel alloc] init];
                otaModel.dk = infoModel.dk;
                otaModel.pk = infoModel.pk;
                otaModel.des = infoModel.info;
                otaModel.versionInfo = infoModel.targetVersion;
                otaModel.otaStatus = 0;
                otaModel.planId = [NSString stringWithFormat:@"%ld", (long)infoModel.planId];
                otaModel.userConfirmStatus = 0;
                otaModel.isPureBLEDevice = YES;

                QuecDevice *device = [[QuecDevice alloc] initWithId:quec_deviceId(infoModel.pk, infoModel.dk)];
                if (device) {
                    otaModel.deviceName = device.model.deviceName;
                    otaModel.productIcon = device.model.logoImage != nil ? device.model.logoImage : (device.model.productIcon != nil ? device.model.productIcon : @"");
                }
                [dataArray addObject:otaModel];
            } else {
                NSLog(@"No info model received.");
            }
            
            dispatch_group_leave(dispatchGroup);
        }];
    }
    
    dispatch_group_notify(dispatchGroup, dispatch_get_main_queue(), ^{
        if (dataArray.count > 0) {
            success(dataArray.copy);
        } else {
            success(nil);
        }
    });
}

- (void)addListener {
    @quec_weakify(self);
    
    [QuecBleOTAManager.sharedInstance addProgressListener:self progressListener:^(NSString * _Nonnull pk, NSString * _Nonnull dk, CGFloat progress) {
        NSLog(@"Progress - PK: %@, DK: %@, Progress: %f", pk, dk, progress);
        @quec_strongify(self);
        [self.tableView reloadData];
    }];
    
    [QuecBleOTAManager.sharedInstance  addStateListener:self onSuccess:^(NSString * _Nonnull pk, NSString * _Nonnull dk, long waitTime) {
        NSLog(@"Success - PK: %@, DK: %@", pk, dk);
        @quec_strongify(self);
        [self.tableView reloadData];
    } onFail:^(NSString * _Nonnull pk, NSString * _Nonnull dk, QuecBleOTAErrorType errorType) {
        @quec_strongify(self);
        NSLog(@"Fail - PK: %@, DK: %@, errorType: %ld", pk, dk, (long)errorType);
        [self.tableView reloadData];
    }];
    
}

- (void)removeListener {
    [QuecBleOTAManager.sharedInstance removeProgressListener:self];
    [QuecBleOTAManager.sharedInstance removeStateListener:self];
    [QuecBleOTAManager.sharedInstance releaseAll];
}


@end
