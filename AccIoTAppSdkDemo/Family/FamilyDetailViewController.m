//
//  FamilyDetailViewController.m
//  AccIoTAppSdkDemo
//
//  Created by Leo Xue on 2024/11/21.
//

#import "FamilyDetailViewController.h"
#import <QuecSmartHomeKit/QuecSmartHomeKit.h>
#import "FamilyRoomListViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface FamilyDetailViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSArray *roomDataArray;
@property(nonatomic, strong)NSArray *dataArray;

@end

@implementation FamilyDetailViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self getData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.upModel.familyName;
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [addButton setTitle:@"Delete" forState:UIControlStateNormal];
    addButton.frame = CGRectMake(0, 0, 50, 50);
    [addButton setTitleColor:UIColor.systemBlueColor forState:UIControlStateNormal];
    addButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [addButton addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:addButton];
    
    
}

- (void)getData {
    @quec_weakify(self);
    [QuecSmartHomeService.sharedInstance getFamilyRoomListWithFid:self.upModel.fid pageNumber:1 pageSize:10000 success:^(NSArray<QuecFamilyRoomItemModel *> *list, NSInteger total) {
        @quec_strongify(self);
        self.roomDataArray = [NSArray arrayWithArray:list];
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
    [QuecSmartHomeService.sharedInstance getFamilyMemberListWithFid:self.upModel.fid pageNumber:1 pageSize:10000 success:^(NSArray<QuecFamilyMemberItemModel *> *list, NSInteger total) {
        @quec_strongify(self);
        self.dataArray = [NSArray arrayWithArray:list];
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}

- (void)deleteButtonClick {
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"Are you sure you want to delete the current room? All room-related data will be cleared after deletion！" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"Confirm" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self deleteFamily];
    }];
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertVc addAction:sureAction];
    [alertVc addAction:cancleAction];
    [self presentViewController:alertVc animated:true completion:nil];
}

- (void)deleteFamily {
    @quec_weakify(self);
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [QuecSmartHomeService.sharedInstance deleteFamilyWithFid:self.upModel.fid success:^{
        @quec_strongify(self);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Home_List_Refresh_Notification" object:nil];
        [self.navigationController popViewControllerAnimated:YES];
    } failure:^(NSError *error) {
        
    }];;
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
    return 20;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return UIView.new;
    }
    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 0, self.view.bounds.size.width, 20);
    view.backgroundColor = UIColor.separatorColor;
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 100, 20)];
    label.textColor = UIColor.lightGrayColor;
    label.font = [UIFont systemFontOfSize:12];
    label.text = @"Family Members";
    [view addSubview:label];
    
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"CellID"];
    }
    cell.accessoryType = UITableViewCellAccessoryNone;
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"Family Name";
                cell.detailTextLabel.text = self.upModel.familyName;
                break;
            case 1:
                cell.textLabel.text = @"Family Location";
                cell.detailTextLabel.text = self.upModel.familyLocation;
                break;
            case 2:
                cell.textLabel.text = @"Room Management";
                cell.detailTextLabel.text = [NSString stringWithFormat:@"%luRoom", (unsigned long)self.roomDataArray.count];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                break;
                
            default:
                break;
        }
    }else {
        QuecFamilyMemberItemModel *itemModel = self.dataArray[indexPath.row];
        NSString *textStr = itemModel.memberRole == 1 ? @"Creator" : (itemModel.memberRole == 3 ? @"Regular Member" : @"Administrator");
        cell.textLabel.text = [NSString stringWithFormat:@"%@-%@",itemModel.nikeName, textStr];
        cell.detailTextLabel.text = itemModel.phone;
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0 && indexPath.row == 2) {
        FamilyRoomListViewController *vc = [[FamilyRoomListViewController alloc]init];
        vc.upModel = self.upModel;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

@end
