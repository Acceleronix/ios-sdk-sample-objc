//
//  AccOTAViewController.m
//  AccIoTAppSdkDemo
//
//  Created by Leo Xue on 2024/11/11.
//

#import "AccOTAViewController.h"
#import <QuecOTAUpgradeKit/QuecOTAUpgradeKit.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import <Toast/Toast.h>
#import "AccOTAPlanInfoModel.h"
#import "AccBleOTAViewController.h"
#import "AccHttpOTAViewController.h"

@interface AccOTAViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSArray *dataArray;

@end

@implementation AccOTAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.dataArray = @[@"Check if there are any HTTP-OTA devices waiting for upgrade", @"Check if there are any BLE-OTA devices waiting for upgrade"];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [[UIView alloc] init];
    
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
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.textLabel.textColor = [UIColor blackColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        [self loadHttpOTAData];
    }else {
        [self loadBleOTAData];
    }
}

- (void)loadHttpOTAData {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    @quec_weakify(self);
    [QuecHttpOTAService.sharedInstance getUserlsHaveDeviceUpgrade:@"" success:^(NSInteger number) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        @quec_strongify(self);
        if (number > 0) {
            AccHttpOTAViewController *vc = [[AccHttpOTAViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }else {
            [self.view makeToast:@"No HTTP-OTA devices waiting for upgrade" duration:3 position:CSToastPositionCenter];
        }
    } failure:^(NSError *error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [self.view makeToast:error.localizedDescription duration:3 position:CSToastPositionCenter];
    }];
}

- (void)loadBleOTAData {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    @quec_weakify(self);
    [self loadPureBLEDeviceData:^(NSInteger number) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        @quec_strongify(self);
        if (number > 0) {
            AccBleOTAViewController *vc = [[AccBleOTAViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }else {
            [self.view makeToast:@"No BLE-OTA devices waiting for upgrade" duration:3 position:CSToastPositionCenter];
        }
    }];
}

- (void)loadPureBLEDeviceData:(void (^)(NSInteger))success {
    NSArray *bleList = [QuecDevice getConnectedBleList];
    if (!bleList || bleList.count == 0) {
        success(0);
        return;
    }

    NSMutableArray *dataArray = [NSMutableArray array];
    dispatch_group_t dispatchGroup = dispatch_group_create();

    for (NSDictionary *dict in bleList) {
        NSString *pk = dict[@"pk"];
        NSString *dk = dict[@"dk"];
        if (!pk || !dk) {
            continue;
        }
        
        dispatch_group_enter(dispatchGroup);
        
        [QuecBleOTAManager.sharedInstance checkVersionWithProductKey:pk deviceKey:dk infoBlock:^(QuecBleOTAInfoModel * _Nullable infoModel) {
            if (infoModel != nil) {
                [dataArray addObject:infoModel];
            } else {
                NSLog(@"No info model received.");
            }
            
            dispatch_group_leave(dispatchGroup);
        }];

    }
    
    dispatch_group_notify(dispatchGroup, dispatch_get_main_queue(), ^{
        success([dataArray count]);
    });
}


@end
