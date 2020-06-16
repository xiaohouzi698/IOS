//
//  settingPassWardViewController.h
//  chuanke
//
//  Created by mj on 15/11/30.
//  Copyright © 2015年 jinzelu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CZPicker.h"
@interface SettingPatientInfoViewController : UIViewController<CZPickerViewDataSource, CZPickerViewDelegate,UITextFieldDelegate>

@property(nonatomic,retain) UITextField * phoneNumberTextField;
@property(retain,nonatomic)UIDatePicker *datePicker;
@end
