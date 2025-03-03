//
//  SceneSetDeviceActionVC.m
//  AccIoTAppSdkDemo
//
//  Created by Leo Xue on 2024/11/26.
//

#import "SceneSetDeviceActionVC.h"
#import <QuecDeviceKit/QuecDeviceKit.h>

@interface SceneSetDeviceActionVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) QuecProductTSLModel *tslModel;

@end

@implementation SceneSetDeviceActionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    self.title = @"Set Device Action";
    
    UIButton *createButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [createButton setTitle:@"Confirm" forState:UIControlStateNormal];
    createButton.frame = CGRectMake(0, 0, 50, 50);
    [createButton setTitleColor:UIColor.systemBlueColor forState:UIControlStateNormal];
    createButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [createButton addTarget:self action:@selector(createButtonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:createButton];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    [self getData];
    
}

- (void)createButtonClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)getData {
    
    [QuecDeviceService.sharedInstance getProductTSLWithProductKey:self.deviceModel.productKey success:^(QuecProductTSLModel *tslModel) {
        
        self.tslModel = tslModel;
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
    
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tslModel.properties.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"CellID"];
    }
    QuecProductTSLPropertyModel *model = self.tslModel.properties[indexPath.row];
    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = @"For display purposes only, interaction should be handled according to business requirements";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
   
}

@end
