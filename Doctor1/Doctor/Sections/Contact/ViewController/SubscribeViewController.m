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
    
    
    View=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    //View.backgroundColor=[UIColor redColor];
    View.image=[UIImage imageNamed:@"bg5.jpg"];
    [self.view addSubview:View];
    

    
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
