//
//  AutomateAbilityPublishedVC.h
//  AccIoTAppSdkDemo
//
//  Created by Leo Xue on 2024/11/27.
//

#import <UIKit/UIKit.h>
#import <QuecDeviceKit/QuecDeviceKit.h>

NS_ASSUME_NONNULL_BEGIN

@class QuecProductTSLPropertyModel;

typedef void (^SelectedBlock)(QuecProductTSLPropertyModel *propertyModel);

@interface AutomateAbilityPublishedVC : UIViewController

@property(nonatomic, strong) QuecDeviceModel *deviceModel;
@property(nonatomic, assign) NSInteger type;

@property (nonatomic, copy)SelectedBlock block;



@end

NS_ASSUME_NONNULL_END
