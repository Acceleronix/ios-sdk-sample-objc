//
//  DeviceControlViewController.m
//  QuecDeviceKitExample
//
//  Created by quectel.steven on 2021/10/28.
//

#import "DeviceControlViewController.h"
#import "DeviceDetailViewController.h"
#import <QuecDeviceKit/QuecDeviceKit.h>
#import <Toast/Toast.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import "TslNumberUTableViewCell.h"
#import "TslBoolTableViewCell.h"
#import "TslEnumAndDateTableViewCell.h"
#import "TlsTextTableViewCell.h"
#import <YYModel/YYModel.h>
#import <QuecIotChannelKit/QuecIotChannelKit.h>
#import "BRPickerView.h"
//#import "QuecOTAViewController.h"


@interface DeviceControlViewController ()<UITableViewDelegate, UITableViewDataSource, TslNumberUTableViewCellDelegate, TslBoolTableViewCellDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) BRDatePickerView *datePickerView;
@property (nonatomic, assign) NSInteger dateIndex;
@property (nonatomic, assign) NSInteger enumIndex;
@property (nonatomic, strong) QuecDevice *currentDevice;

@end

@implementation DeviceControlViewController

- (void)dealloc
{
    NSLog(@"DeviceControlViewController dealloc");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Device Control";
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *detailButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [detailButton setTitle:@"Settings" forState:UIControlStateNormal];
    detailButton.frame = CGRectMake(0, 0, 50, 50);
    [detailButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    detailButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [detailButton addTarget:self action:@selector(detailButtonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:detailButton];
    
    
    _datePickerView = [[BRDatePickerView alloc]init];
    _datePickerView.pickerMode = BRDatePickerModeYMDHMS;
    _datePickerView.title = @"Select Time";
    _datePickerView.selectDate = [NSDate date];
    _datePickerView.minDate = [NSDate br_setYear:1949 month:3 day:12];
    _datePickerView.isAutoSelect = YES;
    @quec_weakify(self);
    _datePickerView.resultBlock = ^(NSDate *selectDate, NSString *selectValue) {
        @quec_strongify(self);
        QuecProductTSLPropertyModel *model = self.dataArray[self.dateIndex];
        QuecIotDataPoint *dataPoint = QuecIotDataPoint.new;
        dataPoint.Id = (int)model.itemId;
        dataPoint.dataType = QuecIotDataPointDataTypeDATE;
        dataPoint.code = model.code;
        dataPoint.value = @([self getTimeStrWithString:selectValue]);
        [self sendDps:@[dataPoint]];
    };
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.currentDevice = [QuecDevice deviceWithId:self.dataModel.deviceId];
    [self getTls];
}

- (long)getTimeStrWithString:(NSString*)str {
    NSDateFormatter*dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate *tempDate = [dateFormatter dateFromString:str];
    return (long)[tempDate timeIntervalSince1970]*1000;
}

/// The DP updates.
/// @param device device instance.
/// @param dps  command dictionary.
- (void)device:(QuecDevice *)device dpsUpdate:(QuecIotDataPointsModel *)dps{
    NSLog(@"dpsUpdate-------->%@", [dps yy_modelToJSONObject]);
}

- (void)getTls {
    QuecWeakSelf(self);
    [[QuecDeviceService sharedInstance] getProductTSLWithProductKey:self.dataModel.productKey success:^(QuecProductTSLModel *tslModel) {
        QuecStrongSelf(self);
        self.dataArray = tslModel.properties.copy;
        if (self.dataModel.capabilitiesBitmask != 4) {
            [self getTslValue];
        }else{
            [self.tableView reloadData];
        }
    } failure:^(NSError *error) {
        
    }];
}

- (void)getTslValue {
    [[QuecDeviceService sharedInstance] getDeviceBusinessAttributesWithProductKey:self.dataModel.productKey deviceKey:self.dataModel.deviceKey gatewayPk:@"" gatewayDk:@"" codeList:@"" type:@"" success:^(QuecProductTSLInfoModel *tslInfoModel) {
        [self handleDataWithDataModel:tslInfoModel];
    } failure:^(NSError *error) {
        
    }];
}

- (void)handleDataWithDataModel:(QuecProductTSLInfoModel *)tslInfoModel {
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < self.dataArray.count; i ++) {
        QuecProductTSLPropertyModel *model = self.dataArray[i];
        if ([model.subType isEqualToString:QuecProductionTslSubTypeR]) {
            continue;
        }
        if (![self isAllowedDataType:model.dataType]) {
            continue;
        }
        for (int j = 0; j < tslInfoModel.customizeTslInfo.count; j ++) {
            QuecProductTSLCustomInfoModel *infoModel = tslInfoModel.customizeTslInfo[j];
            if ([model.code isEqualToString:infoModel.resourceCode]) {
                model.attributeValue = infoModel.resourceValue;
                break;
            }
        }
        [tempArray addObject:model];
    }
    if (tempArray.count) {
        self.dataArray = tempArray.mutableCopy;
    }
    [self.tableView reloadData];
}

- (BOOL)isAllowedDataType:(NSString *)dataType {
    if ([QuecProductionTslDataTypeBOOL isEqualToString:dataType]
        || [QuecProductionTslDataTypeTEXT isEqualToString:dataType]
        || [QuecProductionTslDataTypeINT isEqualToString:dataType]
        || [QuecProductionTslDataTypeFLOAT isEqualToString:dataType]
        || [QuecProductionTslDataTypeDOUBLE isEqualToString:dataType]
        || [QuecProductionTslDataTypeENUM isEqualToString:dataType]
        || [QuecProductionTslDataTypeDATE isEqualToString:dataType]) {
        return YES;
    }
    return NO;
}

- (void)detailButtonClick {
    DeviceDetailViewController *detailVc = [[DeviceDetailViewController alloc] init];
    detailVc.dataModel = self.dataModel;
    [self.navigationController pushViewController:detailVc animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    QuecProductTSLPropertyModel *model = self.dataArray[indexPath.row];
    if ([QuecProductionTslDataTypeBOOL isEqualToString:model.dataType] ) {
        return 140.0;
    }
    else if ([QuecProductionTslDataTypeTEXT isEqualToString:model.dataType] ) {
        return 130.0;
    }
    else if ([QuecProductionTslDataTypeINT isEqualToString:model.dataType]
             || [QuecProductionTslDataTypeFLOAT isEqualToString:model.dataType]
             || [QuecProductionTslDataTypeDOUBLE isEqualToString:model.dataType]) {
        return 120.0;
    }
    else if ([QuecProductionTslDataTypeENUM isEqualToString:model.dataType]
             || [QuecProductionTslDataTypeDATE isEqualToString:model.dataType]) {
        return 80.0;
    }
    else {
        return 0.01;
    }
    return 0.01;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QuecProductTSLPropertyModel *model = self.dataArray[indexPath.row];
    if ([QuecProductionTslDataTypeBOOL isEqualToString:model.dataType] ) {
        TslBoolTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BoolCellID"];
        if (!cell) {
            cell = [[TslBoolTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"BoolCellID"];
        }
        [cell refreshCellWithModel:self.dataArray[indexPath.row] index:indexPath.row];
        cell.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if ([QuecProductionTslDataTypeTEXT isEqualToString:model.dataType] ) {
        TlsTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextCellID"];
        if (!cell) {
            cell = [[TlsTextTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"TextCellID"];
        }
        [cell refreshCellWithModel:self.dataArray[indexPath.row]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if ([QuecProductionTslDataTypeINT isEqualToString:model.dataType]
             || [QuecProductionTslDataTypeFLOAT isEqualToString:model.dataType]
             || [QuecProductionTslDataTypeDOUBLE isEqualToString:model.dataType]) {
        TslNumberUTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NumberCellID"];
        if (!cell) {
            cell = [[TslNumberUTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"NumberCellID"];
        }
        [cell refreshCellWithModel:self.dataArray[indexPath.row] index:indexPath.row];
        cell.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if ([QuecProductionTslDataTypeENUM isEqualToString:model.dataType]
             || [QuecProductionTslDataTypeDATE isEqualToString:model.dataType]) {
        TslEnumAndDateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EnumAndDateCellID"];
        if (!cell) {
            cell = [[TslEnumAndDateTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"EnumAndDateCellID"];
        }
        [cell refreshCellWithModel:self.dataArray[indexPath.row]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"CellID"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    QuecProductTSLPropertyModel *model = self.dataArray[indexPath.row];
    if ([model.dataType isEqualToString:QuecProductionTslDataTypeTEXT]) {
        [self showTextInputWithText:model.attributeValue row:indexPath.row];
    }
    else if ([model.dataType isEqualToString:QuecProductionTslDataTypeDATE]) {
        self.dateIndex = indexPath.row;
        [_datePickerView show];
    }
    else if ([model.dataType isEqualToString:QuecProductionTslDataTypeENUM]) {
        self.enumIndex = indexPath.row;
        [self showActionSheet];
    }
}

#pragma -TslNumberUTableViewCellDelegate
- (void)valueChanged:(NSString *)value index:(NSInteger)index {
    QuecProductTSLPropertyModel *model = self.dataArray[index];
    QuecIotDataPoint *dataPoint = QuecIotDataPoint.new;
    dataPoint.Id = (int)model.itemId;
    if ([model.dataType isEqualToString:QuecProductionTslDataTypeINT]){
        dataPoint.dataType = QuecIotDataPointDataTypeINT;
    }else if ([model.dataType isEqualToString:QuecProductionTslDataTypeFLOAT]){
        dataPoint.dataType = QuecIotDataPointDataTypeFLOAT;
    }else if ([model.dataType isEqualToString:QuecProductionTslDataTypeDOUBLE]){
        dataPoint.dataType = QuecIotDataPointDataTypeDOUBLE;
    }
    dataPoint.code = model.code;
    dataPoint.value = value;
    [self sendDps:@[dataPoint]];
}

#pragma mark - TslBoolTableViewCellDelegate
- (void)stateChanged:(NSString *)state index:(NSInteger)index {
    QuecProductTSLPropertyModel *model = self.dataArray[index];
    QuecIotDataPoint *dataPoint = QuecIotDataPoint.new;
    dataPoint.Id = (int)model.itemId;
    dataPoint.dataType = QuecIotDataPointDataTypeBOOL;
    dataPoint.code = model.code;
    dataPoint.value = state;
    [self sendDps:@[dataPoint]];
}

- (void)sendDps:(NSArray<QuecIotDataPoint*> *)dps{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [self.currentDevice writeDps:dps success:^{
        quec_async_on_main(^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [self.view makeToast:@"Dispatch Successful" duration:3 position:CSToastPositionCenter];
        });
    } failure:^(NSError * _Nonnull error) {
        quec_async_on_main(^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [self.view makeToast:@"Dispatch Failed" duration:3 position:CSToastPositionCenter];
        });
    }];
}

- (void)showTextInputWithText:(NSString *)text row:(NSInteger)row  {
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"Please enter text" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"Confirm" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self updateTextWithText:alertVc.textFields.firstObject.text row:row];
    }];
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertVc addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Please enter a name";
        textField.text = text;
    }];
    [alertVc addAction:sureAction];
    [alertVc addAction:cancleAction];
    [self presentViewController:alertVc animated:true completion:nil];
}

- (void)updateTextWithText:(NSString *)text row:(NSInteger)row {
    QuecProductTSLPropertyModel *model = self.dataArray[row];
    QuecIotDataPoint *dataPoint = QuecIotDataPoint.new;
    dataPoint.Id = (int)model.itemId;
    dataPoint.dataType = QuecIotDataPointDataTypeTEXT;
    dataPoint.code = model.code;
    dataPoint.value = text;
    [self sendDps:@[dataPoint]];
}

- (void)showActionSheet {
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"Please select an enumeration" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    QuecProductTSLPropertyModel *model = self.dataArray[self.enumIndex];
    for (int i = 0; i < model.formatSpecs.count; i ++) {
        QuecProductTSLSpecModel *specModel = model.formatSpecs[i];
        UIAlertAction *action = [UIAlertAction actionWithTitle:specModel.name style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self updateEnumValueWithValue:specModel.value];
        }];
        [alertVc addAction:action];
    }
    
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertVc addAction:cancleAction];
    [self presentViewController:alertVc animated:true completion:nil];
}

- (void)updateEnumValueWithValue:(NSString *)value {
    QuecProductTSLPropertyModel *model = self.dataArray[self.enumIndex];
    QuecIotDataPoint *dataPoint = QuecIotDataPoint.new;
    dataPoint.Id = (int)model.itemId;
    dataPoint.dataType = QuecIotDataPointDataTypeENUM;
    dataPoint.code = model.code;
    dataPoint.value = value;
    [self sendDps:@[dataPoint]];
}

@end
