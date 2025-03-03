//
//  AutomateAbilityPublishedVC.m
//  AccIoTAppSdkDemo
//
//  Created by Leo Xue on 2024/11/27.
//

#import "AutomateAbilityPublishedVC.h"
#import <QuecAutomateKit/QuecAutomateKit.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import <Toast/Toast.h>

@interface AutomateAbilityPublishedVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation AutomateAbilityPublishedVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Set Device Action";
    self.view.backgroundColor = UIColor.whiteColor;
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [addButton setTitle:@"Save" forState:UIControlStateNormal];
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
    if (self.block && self.dataArray.count) {
        for (QuecProductTSLPropertyModel *model in self.dataArray) {
            if ([model.dataType isEqualToString:@"BOOL"]) {
                self.block(model);
                break;
            }
        }
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)getData {
    @quec_weakify(self);
    [QuecAutomateService getAutomationTSLWithProductKey:self.deviceModel.productKey type:self.type success:^(NSArray<QuecProductTSLPropertyModel *> * _Nonnull conditions, NSArray<QuecProductTSLPropertyModel *> * _Nonnull actions) {
        @quec_strongify(self);
        if (self.type == 1) {
            self.dataArray = [NSArray arrayWithArray:conditions];
        }else {
            self.dataArray = [NSArray arrayWithArray:actions];
        }
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
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
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    QuecProductTSLPropertyModel *propertyModel = self.dataArray[indexPath.row];
    cell.textLabel.text = propertyModel.name;
    cell.detailTextLabel.text = @"For display purposes only, interaction should be handled according to business requirements";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
