//
//  UserInfoViewController.h
//  BRSF
//
//  Created by mac on 16/3/9.
//  Copyright © 2016年 HongTao. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "DWXMPP_Core.h"

@interface UserInfoViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *userName_Label;
@property (strong, nonatomic) IBOutlet UILabel *nickName_Label;
@property (strong, nonatomic) IBOutlet UISwitch *isSub_Switch;
@property (strong, nonatomic) IBOutlet UIImageView *userPhoto_ImageView;
@property (strong, nonatomic) IBOutlet UISwitch *isSendSub_Switch;
@property (strong, nonatomic) IBOutlet UILabel *unreadMessageCount_Label;

@property (nonatomic, strong) XMPPJID *userJID;
@property (nonatomic, strong) XMPPUserCoreDataStorageObject *userInfo;
@property (nonatomic, strong) XMPPvCardTemp *uservCardTemp;

- (instancetype)initWithUserJID:(XMPPJID *)userJID;

@end
