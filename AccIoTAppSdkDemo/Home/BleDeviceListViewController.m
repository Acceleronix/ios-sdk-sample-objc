//
//  DeviceListViewController.m
//  QuecConfigureNetworkKitExample
//
//  Created by quectel.steven on 2021/11/24.
//

#import "BleDeviceListViewController.h"
#import "ConfigNetworkViewController.h"
#import "BleDeviceListTableViewCell.h"
#import <QuecSmartConfigKit/QuecSmartConfigKit.h>
#import <Toast/Toast.h>
#import <QuecDeviceKit/QuecDeviceKit.h>
#import <QuecSmartHomeKit/QuecSmartHomeKit.h>

@interface BleDeviceListViewController ()<UITableViewDelegate, UITableViewDataSource, QuecBleManagerDelegate, QuecPairingDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<BleDeviceBindModel *> *dataArray;
@property (nonatomic, copy) NSString *ssid;
@property (nonatomic, copy) NSString *pwd;
@property (nonatomic, copy) NSString *fid;

@end

@implementation BleDeviceListViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[QuecDevicePairingService sharedInstance] addPairingListener:self];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[QuecDevicePairingService sharedInstance] removePairingListener:self];
    [[QuecDevicePairingService sharedInstance] cancelAllDevicePairing];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Device List";
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:BleDeviceListTableViewCell.class forCellReuseIdentifier:NSStringFromClass(BleDeviceListTableViewCell.class)];
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.dataArray = @[].mutableCopy;
    self.fid = [QuecSmartHomeService sharedInstance].currentFamily.fid;
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [addButton setTitle:@"Scan" forState:UIControlStateNormal];
    addButton.frame = CGRectMake(0, 0, 50, 50);
    [addButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    addButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [addButton addTarget:self action:@selector(startScan) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:addButton];
}

- (void)startScan {
    [self.dataArray removeAllObjects];
    [self.tableView reloadData];
    [[QuecDevicePairingService sharedInstance] scanWithFid:self.fid filier:nil];
}

- (void)stopScan {
    [[QuecDevicePairingService sharedInstance] stopScan];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BleDeviceListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(BleDeviceListTableViewCell.class) forIndexPath:indexPath];
    BleDeviceBindModel *model = [self.dataArray quec_safeObjectAtIndex:indexPath.row];
    [cell configureModel:model indexPath:indexPath];
    @quec_weakify(self);
    cell.bindAction = ^(NSIndexPath * _Nonnull indexPath) {
        @quec_strongify(self);
        if (model.peripheral.peripheralModel.capabilitiesBitmask != 4 && ![self.ssid quec_isStringAndNotEmpty]){
            [self configWifiWithIndex:indexPath];
            return;
        }
        [self startBinding:indexPath];
    };
    return cell;
}

- (void)startBinding:(NSIndexPath *)indexPath{
    BleDeviceBindModel *model = [self.dataArray quec_safeObjectAtIndex:indexPath.row];
    [self stopScan];
    [[QuecDevicePairingService sharedInstance] startPairingByDevices:@[model.peripheral] fid:self.fid ssid:self.ssid pwd:self.pwd];
    model.bindState = QuecBinding;
    [self.tableView reloadData];
    
}

#pragma mark - QuecPairingDelegate

- (void)didUpdatePairingStatus:(QuecPairingPeripheral *)pairingPeripheral progress:(CGFloat)progress{
    NSLog(@"deviceName:%@--------progress:%.2f", pairingPeripheral.deviceName, progress);
}

- (void)didUpdatePairingResult:(QuecPairingPeripheral *)pairingPeripheral result:(BOOL)result error:(NSError *)error{
    NSLog(@"deviceName:%@--------result:%d-----error: %@", pairingPeripheral.deviceName, result, error);
    NSInteger row = 99999;
    for (int i = 0; i < self.dataArray.count; i++) {
        BleDeviceBindModel *model = [self.dataArray quec_safeObjectAtIndex:i];
        if ([pairingPeripheral.peripheralModel.uuid isEqualToString:model.peripheral.peripheralModel.uuid]){
            row = i;
            break;
        }
    }
    if (row != 99999){
        BleDeviceBindModel *model = [self.dataArray quec_safeObjectAtIndex:row];
        if (result){
            model.bindState = QuecBindingSucc;
        }else{
            model.bindState = QuecBindingFail;
            model.errorMsg = error.localizedDescription;
        }
        [self.tableView reloadData];
    }
}

- (void)centralDidDiscoverPairingPeripheral:(QuecPairingPeripheral *)pairingPeripheral{
    dispatch_async(dispatch_get_main_queue(), ^{
        BOOL isExist = NO;
        for (int i = 0; i < self.dataArray.count; i ++) {
            BleDeviceBindModel *model = [self.dataArray quec_safeObjectAtIndex:i];
            if ([model.peripheral.peripheralModel.uuid isEqualToString:pairingPeripheral.peripheralModel.uuid]) {
                isExist = YES;
            }
        }
        if (!isExist) {
            BleDeviceBindModel *model = BleDeviceBindModel.new;
            model.peripheral = pairingPeripheral;
            model.bindState = QuecWaitingBind;
            [self.dataArray quec_safeAddObject:model];
            [self.tableView reloadData];
        }
    });
}

- (void)configWifiWithIndex:(NSIndexPath *)index{
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"Please enter 2.4GHz WiFi information" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"Confirm" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.ssid = alertVc.textFields[0].text;
        self.pwd = alertVc.textFields[1].text;
        if (self.ssid.length == 0) {
            [self.view makeToast:@"Please enter WiFi name" duration:1.0f position:CSToastPositionCenter];
            [self presentViewController:alertVc animated:true completion:nil];
            return;
        }
        [self startBinding:index];
    }];
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertVc addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Please enter WiFi name";
    }];
    [alertVc addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Please enter WiFi password";
    }];
    [alertVc addAction:sureAction];
    [alertVc addAction:cancleAction];
    [self presentViewController:alertVc animated:true completion:nil];
}


@end
