//
//  SubscribeViewController.h
//  BRSF
//
//  Created by mac on 16/3/9.
//  Copyright © 2016年 HongTao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DWXMPP_Core.h"

@interface SubscribeViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *userName_Text;
@property (weak, nonatomic) IBOutlet UITextField *nickName_Text;
@property (strong, nonatomic) IBOutlet UIButton *subscribe_Button;
- (IBAction)subscribeUser:(id)sender;
- (IBAction)hidKeyBoard:(id)sender;

@end
