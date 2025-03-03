//
//  AutomateDetailViewController.m
//  AccIoTAppSdkDemo
//
//  Created by Leo Xue on 2024/11/28.
//

#import "AutomateDetailViewController.h"
#import <QuecDeviceKit/QuecDeviceKit.h>
#import <QuecAutomateKit/QuecAutomateKit.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import <Toast/Toast.h>
#import <QuecSmartHomeKit/QuecSmartHomeKit.h>
#import "SceneSelectedViewController.h"
#import <QuecCommonUtil/QuecCommonUtil.h>
#import "AutomateAbilityPublishedVC.h"
#import <QuecSceneKit/QuecSceneKit.h>

@interface AutomateDetailViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataOneArray;
@property (nonatomic, strong) NSArray *dataTwoArray;
@property (nonatomic, strong) QuecAutomateModel *detailModel;

@end

@implementation AutomateDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.title = self.automateModel.name;
    
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [addButton setTitle:@"Edit" forState:UIControlStateNormal];
    addButton.frame = CGRectMake(0, 0, 60, 50);
    [addButton setTitleColor:UIColor.systemBlueColor forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(addButtonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:addButton];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    [self getData];
    
}

- (void)addButtonClick {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    NSString *fid = @"";
    if (QuecSmartHomeService.sharedInstance.enable) {
        fid = [QuecSmartHomeService sharedInstance].currentFamily.fid;
    }
    
    self.detailModel.fid = fid;
    
    long long timestamp = (long long)quec_TimestampMSEC();//获取毫秒级时间戳
    self.detailModel.name = [NSString stringWithFormat:@"%@%lld",@"Custom_",timestamp];
    
    @quec_weakify(self);
    [QuecAutomateService editAutomationWithModel:self.detailModel success:^{
        @quec_strongify(self);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [self.view makeToast:@"Edit Successful" duration:2 position:CSToastPositionCenter];
        [self.navigationController popViewControllerAnimated:YES];
        
    } failure:^(NSError *error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [self.view makeToast:error.description duration:1 position:CSToastPositionCenter];
    }];
}

//仅做接口数据展示，具体编辑效果及UI交互根据自身业务需求自行开发
- (void)getData {
    NSString *fid = @"";
    if (QuecSmartHomeService.sharedInstance.enable) {
        fid = [QuecSmartHomeService sharedInstance].currentFamily.fid;
    }
    
    [QuecAutomateService getAutomationInfoWithFid:fid automationId:self.automateModel.automationId success:^(QuecAutomateModel * _Nonnull model) {
        self.detailModel = model;
        self.dataOneArray = [NSArray arrayWithArray:model.conditions];
        self.dataTwoArray = [NSArray arrayWithArray:model.actions];
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
    
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return self.dataOneArray.count;
    }
    return self.dataTwoArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"CellID"];
    }
    
    if (indexPath.section == 0) {
        QuecAutomationConditionModel *conditionModel = self.dataOneArray[indexPath.row];
        NSString *typeStr = @"";
        if (conditionModel.type == 0) {
            typeStr = @"Device";
        }else {
            typeStr = @"Time";
        }
        cell.textLabel.text = [NSString stringWithFormat:@"Trigger Type：%@，Name:%@",typeStr, conditionModel.name];
    }else {
        QuecAutomationActionModel *actionModel = self.dataTwoArray[indexPath.row];
        NSString *typeStr = @"";
        if (actionModel.type == 1) {
            typeStr = @"Delay";
        }else if (actionModel.type == 2) {
            typeStr = @"Device";
        }else if (actionModel.type == 3) {
            typeStr = @"Group";
        }else {
            typeStr = @"Scene";
        }
        cell.textLabel.text = [NSString stringWithFormat:@"Execution Type：%@，Name:%@",typeStr, actionModel.name];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


@end
