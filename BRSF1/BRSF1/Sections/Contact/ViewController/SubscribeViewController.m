//
//  SubscribeViewController.h
//  BRSF
//
//  Created by mac on 16/3/9.
//  Copyright © 2016年 HongTao. All rights reserved.
//

#import "SubscribeViewController.h"

@interface SubscribeViewController (){
    UIImageView *View;
   
    
    
}

@end

@implementation SubscribeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)subscribeUser:(id)sender {
    [[[DWXMPP_Core sharedManager] xmppRoster] subscribePresenceToUser:[XMPPJID jidWithString:self.userName_Text.text]];
}

- (IBAction)hidKeyBoard:(id)sender {
    [self.userName_Text resignFirstResponder];
    [self.nickName_Text resignFirstResponder];
}
@end
