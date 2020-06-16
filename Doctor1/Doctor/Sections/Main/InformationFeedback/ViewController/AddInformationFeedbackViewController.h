//
//  AddInformationFeedbackViewController.h
//  BRSF
//
//  Created by mac on 16/3/10.
//  Copyright © 2016年 HongTao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlaceholderTextView.h"
@interface AddInformationFeedbackViewController : UIViewController

{
    NSInteger operateType1;//保存操作类型，0是添加，1是修改
}
@property (nonatomic, strong) NSString *dbPath;

@property (nonatomic, strong) NSString *createtimeStr;
@property (nonatomic, strong) UITextField *titleTextField;
@property (nonatomic, strong) PlaceholderTextView * txtView;

@property (nonatomic, strong) UIButton * mysendButton;

@property (nonatomic, strong) UIView * aView;
@property (nonatomic, assign) NSInteger operateType;
//字数的限制
@property (nonatomic, strong)UILabel *wordCountLabel;


@end
