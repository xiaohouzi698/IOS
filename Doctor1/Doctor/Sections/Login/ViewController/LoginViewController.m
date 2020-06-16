//
//
//  BRSF
//
//  Created by mac on 16/3/9.
//  Copyright © 2016年 HongTao. All rights reserved.
//

#import "LoginViewController.h"
#import "ForgetPasswordViewController.h"
#import "RegisterViewController.h"
#import "MainViewController.h"
#import "RKAlertView.h"
#import "AppDelegate.h"
#import "ChechNetStatus.h"
#import "FriendListViewController.h"
#import "SettingViewController.h"
#import "LoginViewController.h"
#import "MBProgressHUD.h"
#import "AFNetWork.h"

@interface LoginViewController ()
{
    UIImageView *View;
    UIView *bgView;
    UITextField *textFieldPassword;
    UITextField *textFieldName;
    
    
}
@property(copy,nonatomic) NSString * accountNumber;
@property(copy,nonatomic) NSString * mmmm;
@property(copy,nonatomic) NSString * textFieldName;


@end

@implementation LoginViewController

-(void)viewWillAppear:(BOOL)animated
{
    //[[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:216/255.0f green:209/255.0f blue:192/255.0f alpha:1]];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  
   // [self registerNotification];
    //没有取消按钮的提示框
    
    
    //    [RKAlertView showAlertWithTitle:@"提示框" message:@"这是普通提示框" cancelTitle:@"取消" confirmTitle:@"确认" confrimBlock:^(UIAlertView *alertView) {
    //        NSLog(@"确认了");
    //    } cancelBlock:^{
    //        NSLog(@"取消了");
    //    }];
    
    //self.view.backgroundColor=[UIColor colorWithRed:240/255.0f green:240/255.0f blue:240/255.0f alpha:1];
    //设置NavigationBar背景颜色
    View=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    //View.backgroundColor=[UIColor redColor];
    View.image=[UIImage imageNamed:@"bg4.jpg"];
    [self.view addSubview:View];
    
    ////    self.title=@"登陆";
    ////    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(clickaddBtn:)];
    ////    [addBtn setImage:[UIImage imageNamed:@"goback_back_orange_on"]];
    ////    [addBtn setImageInsets:UIEdgeInsetsMake(0, -15, 0, 15)];
    ////    addBtn.tintColor=[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1];
    ////    [self.navigationItem setLeftBarButtonItem:addBtn];
    //
    //    UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(zhuce)];
    //    right.tintColor=[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1];
    //    self.navigationItem.rightBarButtonItem=right;
    
    //为了显示背景图片自定义navgationbar上面的三个按钮
    UIButton *but =[[UIButton alloc]initWithFrame:CGRectMake(5, 27, 35, 35)];
    [but setImage:[UIImage imageNamed:@"goback_back_orange_on"] forState:UIControlStateNormal];
    [but addTarget:self action:@selector(clickaddBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
    
    UIButton *zhuce =[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-60, 30, 50, 30)];
    [zhuce setTitle:@"注册" forState:UIControlStateNormal];
    [zhuce setTitleColor:[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1] forState:UIControlStateNormal];
    zhuce.titleLabel.font=[UIFont systemFontOfSize:17];
    [zhuce addTarget:self action:@selector(zhuce) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:zhuce];
    
    
    UILabel *lanel=[[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width-30)/2, 30, 50, 30)];
    lanel.text=@"登录";
    lanel.textColor=[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1];
    [self.view addSubview:lanel];
    
    
    [self createButtons];
    [self createImageViews];
    [self createTextFields];
    
    
    //    //...........xmpp
    //    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //
    //    NSString *userId = [defaults stringForKey:USERID];
    //    NSString *pass = [defaults stringForKey:PASSWORD];
    //  //  NSString *server = [defaults stringForKey:SERVER];
    //
    //    if ([userId length]>0) {
    //        textFieldName.text = userId;
    //    }
    //    if ([pass length]>0) {
    //        textFieldPassword.text = pass;
    //    }
    
    
    
    //[self createLabel];
}

-(void)clickaddBtn:(UIButton *)button
{
    //      [kAPPDelegate appDelegateInitTabbar];
    self.view.backgroundColor=[UIColor whiteColor];
    exit(0);
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void)createTextFields
{
    CGRect frame=[UIScreen mainScreen].bounds;
    bgView=[[UIView alloc]initWithFrame:CGRectMake(10, 75, frame.size.width-20, 100)];
    bgView.layer.cornerRadius=3.0;
    bgView.alpha=0.7;
    bgView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:bgView];
    
    textFieldName=[self createTextFielfFrame:CGRectMake(60, 10, 271, 30) font:[UIFont systemFontOfSize:14] placeholder:@"请输入的用户名"];
    //user.text=@"13419693608";;
    textFieldName.clearButtonMode = UITextFieldViewModeWhileEditing;
    textFieldName.autocapitalizationType =UITextAutocapitalizationTypeNone;
    
    
    
    
    
    textFieldPassword=[self createTextFielfFrame:CGRectMake(60, 60, 271, 30) font:[UIFont systemFontOfSize:14]  placeholder:@"密码" ];
    textFieldPassword.clearButtonMode = UITextFieldViewModeWhileEditing;
    //pwd.text=@"123456";
    //密文样式
    textFieldPassword.secureTextEntry=YES;
    //pwd.keyboardType=UIKeyboardTypeNumberPad;
    
    
    UIImageView *userImageView=[self createImageViewFrame:CGRectMake(20, 10, 25, 25) imageName:@"ic_landing_nickname" color:nil];
    UIImageView *pwdImageView=[self createImageViewFrame:CGRectMake(20, 60, 25, 25) imageName:@"mm_normal" color:nil];
    UIImageView *line1=[self createImageViewFrame:CGRectMake(20, 50, bgView.frame.size.width-40, 1) imageName:nil color:[UIColor colorWithRed:180/255.0f green:180/255.0f blue:180/255.0f alpha:.3]];
    
    [bgView addSubview:textFieldName];
    [bgView addSubview:textFieldPassword];
    
    [bgView addSubview:userImageView];
    [bgView addSubview:pwdImageView];
    [bgView addSubview:line1];
}


-(void)touchesEnded:(nonnull NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    [textFieldName resignFirstResponder];
    [textFieldPassword resignFirstResponder];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [textFieldName resignFirstResponder];
    [textFieldPassword resignFirstResponder];
}

-(void)createImageViews
{
    //    UIImageView *userImageView=[self createImageViewFrame:CGRectMake(25, 10, 25, 25) imageName:@"ic_landing_nickname" color:nil];
    //    UIImageView *pwdImageView=[self createImageViewFrame:CGRectMake(25, 60, 25, 25) imageName:@"ic_landing_password" color:nil];
    //    UIImageView *line1=[self createImageViewFrame:CGRectMake(25, 50, 260, 1.5) imageName:nil color:[UIColor lightGrayColor]];
    //
    //    //UIImageView *line2=[self createImageViewFrame:CGRectMake(88, 210, 280, 1) imageName:nil color:[UIColor grayColor]];
    
    UIImageView *line3=[self createImageViewFrame:CGRectMake(2, 400, 100, 1) imageName:nil color:[UIColor lightGrayColor]];
    UIImageView *line4=[self createImageViewFrame:CGRectMake(self.view.frame.size.width-100-4, 400, 100, 1) imageName:nil color:[UIColor lightGrayColor]];
    
    //    [bgView addSubview:userImageView];
    //    [bgView addSubview:pwdImageView];
    //    [bgView addSubview:line1];
    //[self.view addSubview:line2];
    [self.view addSubview:line3];
    [self.view addSubview:line4];
    
}


-(void)createButtons
{
    UIButton *landBtn=[self createButtonFrame:CGRectMake(10, 190, self.view.frame.size.width-20, 37) backImageName:nil title:@"登录" titleColor:[UIColor whiteColor]  font:[UIFont systemFontOfSize:19] target:self action:@selector(landLogin)];
    landBtn.backgroundColor=[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1];
    landBtn.layer.cornerRadius=5.0f;
    
    UIButton *newUserBtn=[self createButtonFrame:CGRectMake(5, 235, 70, 30) backImageName:nil title:@"快速注册" titleColor:[UIColor grayColor] font:[UIFont systemFontOfSize:13] target:self action:@selector(registration:)];
    //newUserBtn.backgroundColor=[UIColor lightGrayColor];
    
    UIButton *forgotPwdBtn=[self createButtonFrame:CGRectMake(self.view.frame.size.width-75, 235, 60, 30) backImageName:nil title:@"找回密码" titleColor:[UIColor grayColor] font:[UIFont systemFontOfSize:13] target:self action:@selector(fogetPwd:)];
    //fogotPwdBtn.backgroundColor=[UIColor lightGrayColor];
    
    
#define Start_X 60.0f           // 第一个按钮的X坐标
#define Start_Y 440.0f           // 第一个按钮的Y坐标
#define Width_Space 50.0f        // 2个按钮之间的横间距
#define Height_Space 20.0f      // 竖间距
#define Button_Height 50.0f    // 高
#define Button_Width 50.0f      // 宽
    
    [self.view addSubview:landBtn];
    [self.view addSubview:newUserBtn];
    [self.view addSubview:forgotPwdBtn];
    
    
}


-(UITextField *)createTextFielfFrame:(CGRect)frame font:(UIFont *)font placeholder:(NSString *)placeholder
{
    UITextField *textField=[[UITextField alloc]initWithFrame:frame];
    
    textField.font=font;
    
    textField.textColor=[UIColor grayColor];
    
    textField.borderStyle=UITextBorderStyleNone;
    
    textField.placeholder=placeholder;
    
    return textField;
}

-(UIImageView *)createImageViewFrame:(CGRect)frame imageName:(NSString *)imageName color:(UIColor *)color
{
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:frame];
    
    if (imageName)
    {
        imageView.image=[UIImage imageNamed:imageName];
    }
    if (color)
    {
        imageView.backgroundColor=color;
    }
    
    return imageView;
}

-(UIButton *)createButtonFrame:(CGRect)frame backImageName:(NSString *)imageName title:(NSString *)title titleColor:(UIColor *)color font:(UIFont *)font target:(id)target action:(SEL)action
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=frame;
    if (imageName)
    {
        [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    
    if (font)
    {
        btn.titleLabel.font=font;
    }
    
    if (title)
    {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    if (color)
    {
        [btn setTitleColor:color forState:UIControlStateNormal];
    }
    if (target&&action)
    {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return btn;
}


//登录
-(void) landLogin
{
    if ([textFieldName.text isEqualToString:@""])
    {
       
        //[SVProgressHUD showInfoWithStatus:@"亲,请输入用户名"];
        return;
    }
    else if ([textFieldPassword.text isEqualToString:@""])
    {
        //[SVProgressHUD showInfoWithStatus:@"亲,请输入密码"];
        return;
    }
    else if (textFieldPassword.text.length <3)
    {
        //[SVProgressHUD showInfoWithStatus:@"亲,密码长度至少六位"];
        return;
    }else{
        
        
        NSUserDefaults *doctor =[NSUserDefaults standardUserDefaults];
        //个人信息
        [doctor setObject:textFieldName.text forKey:@"username"];
        [doctor setObject:textFieldPassword.text forKey:@"password"];
        
        
        //get请求
        
//        AFNetWork *afNetWork = [[AFNetWork alloc] init];
//        [afNetWork reach];
//      //   afNetWork postWithURL:<#(NSString *)#> WithParmeters:<#(NSDictionary *)#>
//    
//        [afNetWork getWithURL:@"http://115.159.159.35:3001/api/Doctors" WithParmeters:@{@"filter[where][username]":@"hongtao", @"access_token":@"rv3WKirc6p84w2j1KK5jI4Ort2PpebthlHeZ2vwl19YQVWdtStuF4NxeiJggxL8e"}];
//        
//        
//        //[afNetWork postWithURL:@"http://115.159.159.35:3001/api/Doctors/login" WithParmeters:@{@"username":@"hongtest99", @"password":@"123456"}];
//        
//        [afNetWork setBlock:^(id info){
//        
//NSLog(@"--------------------------info = %@", info);
//        
//NSArray *array = info[@"data"][@"topic"];
//NSLog(@"---------------------------%@",array);
//        
//        
//                for (int i = 0; i < array.count; i++) {
//                   // [_dataSource addObject:array[i]];
//                }
//                
//                //[self.tableView reloadData];
//            }];
//
//        
//        
        
        //get请求
        
        NSString *getUsername = textFieldName.text;
        NSString *getPassword = textFieldPassword.text;
        
        AFNetWork *afNetWork = [[AFNetWork alloc] init];
        [afNetWork reach];
        
        [afNetWork postWithURL:@"http://115.159.159.35:3001/api/Doctors/login" WithParmeters:@{@"username":getUsername, @"password":getPassword}];
        [afNetWork setBlock:^(id info){
            
            NSLog(@"info = %@", info);
//            NSArray *array = info[@"data"][@"topic"];
//            NSLog(@"%@",array);
//            for (int i = 0; i < array.count; i++) {
//               //  [_dataSource addObject:array[i]];
//            }
            
           // [self.tableView reloadData];
        }];

        
        
        
        
        //        //从本地取得用户名，密码和服务器地址
        //        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        //        NSString *userId = [defaults stringForKey:USERID];
        //
        //        NSString *name =userId;
        //        if (![textFieldName.text isEqualToString:userId]) {
        //            name = [NSString stringWithFormat:@"%@@macbookair.local",textFieldName.text];
        //        }
        //
        //        NSString *pas = textFieldPassword.text;
        //        NSString *server = @"127.0.0.1";
        //        if ([server length]==0) {
        //            server = @"127.0.0.1";
        //        }
        //
        //        if ([self validateWithUser:name andPass:pas andServer:server]) {
        //
        //            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        //            [defaults setObject:name forKey:USERID];
        //            [defaults setObject:pas forKey:PASSWORD];
        //            [defaults setObject:server forKey:SERVER];
        //            //保存
        //            [defaults synchronize];
        //
        //            [self dismissModalViewControllerAnimated:YES];
        //        }else {
        //            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入用户名，密码和服务器" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        //            [alert show];
        //        }
        
        
        
        
        NSString *userName = textFieldName.text ;
        NSString *passWord = textFieldPassword.text;
        
        NSLog(@"login-username:%@",userName);
        NSLog(@"login-passWord:%@",passWord);
        
        userName=[userName stringByAppendingString:@"@macbookair.local"];
        NSLog(@"注册时候的username是：%@",userName);
        
        
        [[DWXMPP_Core sharedManager] loginWithUserName:userName andPassWord:passWord];
        
        
        [self.view removeFromSuperview];
        UIWindow *window =[UIApplication sharedApplication].delegate.window;
        window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        //[NSThread sleepForTimeInterval:0.1];//设置启动页面时间
        window.backgroundColor = [UIColor whiteColor];
        
        
        UITabBarController *tabbar = [[UITabBarController alloc] init];
        MainViewController *mainVC = [[MainViewController alloc] init];
        UINavigationController *mainNC = [[UINavigationController alloc] initWithRootViewController:mainVC];
        UIImage* mainImageNormal = [UIImage imageNamed:@"icon_contact_normal"];
        UIImage* mainImageSelected = [UIImage imageNamed:@"icon_contact_pressed"];
        mainNC.tabBarItem.title = @"主页";
        mainNC.tabBarItem.selectedImage = [mainImageSelected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        mainNC.tabBarItem.image = [mainImageNormal imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        FriendListViewController *contactVC = [[FriendListViewController alloc] init];
        UINavigationController *contactNC = [[UINavigationController alloc] initWithRootViewController:contactVC];
        UIImage* contactImageNormal = [UIImage imageNamed:@"icon_message_normal"];
        UIImage* contactImageSelected = [UIImage imageNamed:@"icon_message_pressed"];
        contactNC.tabBarItem.title = @"联系人";
        contactNC.tabBarItem.selectedImage = [contactImageSelected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        contactNC.tabBarItem.image = [contactImageNormal imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        
        
        SettingViewController *settingVC = [[SettingViewController alloc] init];
        UINavigationController *settingNC = [[UINavigationController alloc] initWithRootViewController:settingVC];
        UIImage* settingImageNormal = [UIImage imageNamed:@"icon_setting_normal"];
        UIImage* settingImageSelected = [UIImage imageNamed:@"icon_setting_pressed"];
        settingNC.tabBarItem.title = @"设置";
        settingNC.tabBarItem.selectedImage = [settingImageSelected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        settingNC.tabBarItem.image = [settingImageNormal imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        //不同controller之间传值。
       // settingVC->firstValue = textFieldName.text;

        
        
        tabbar.viewControllers = @[mainNC,contactNC,settingNC];
        window.rootViewController =tabbar;
        
        
        
        
        
        
        
        
        
        [window makeKeyAndVisible];
        
        [self presentModalViewController:tabbar animated:YES];
    }
    
    
    
}



-(BOOL)validateWithUser:(NSString *)userText andPass:(NSString *)passText andServer:(NSString *)serverText{
    
    if (userText.length > 0 && passText.length > 0 && serverText.length > 0) {
        return YES;
    }
    
    return NO;
}

//------------------xmpp login
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:DWXMPP_NOTIFICATION_WILL_CONNECT object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:DWXMPP_NOTIFICATION_CONNECT_FAULT object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:DWXMPP_NOTIFICATION_AUTNENTICATE_SUCCEED object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:DWXMPP_NOTIFICATION_AUTNENTICATE_FAULT object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:DWXMPP_NOTIFICATION_REGISTER_SUCCEED object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:DWXMPP_NOTIFICATION_REGISTER_FAULT object:nil];
}

#pragma mark - Login


- (void)didLogin:(NSNotification *)notification{
    NSString *strNotification = notification.name;
    
    if ([strNotification isEqualToString:DWXMPP_NOTIFICATION_WILL_CONNECT]) {
        MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.view];
        HUD.labelText = @"正在连接服务器";
        HUD.removeFromSuperViewOnHide = YES;
        [self.view addSubview:HUD];
        [HUD show:YES];
    }
    else if ([strNotification isEqualToString:DWXMPP_NOTIFICATION_AUTNENTICATE_SUCCEED]){
        //        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        //
        //        MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.view];
        //        HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
        //        HUD.mode = MBProgressHUDModeCustomView;
        //        HUD.labelText = @"登陆成功";
        //        HUD.removeFromSuperViewOnHide = YES;
        //        [self.view addSubview:HUD];
        //        [HUD show:YES];
        //        [HUD hide:YES afterDelay:1.0];
        
        FriendListViewController *friendListView = [[FriendListViewController alloc] initWithStyle:UITableViewStyleGrouped];
        //        [self presentViewController:friendListView animated:NO completion:nil];
        [self.navigationController pushViewController:friendListView animated:YES];
    }
}

- (void)didNotLogin:(NSNotification *)notification{
    NSString *strNotification = notification.name;
    
    if ([strNotification isEqualToString:DWXMPP_NOTIFICATION_CONNECT_FAULT]) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        
        MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.view];
        HUD.mode = MBProgressHUDModeText;
        HUD.detailsLabelText = @"连接服务器失败\n请稍后再试";
        HUD.removeFromSuperViewOnHide = YES;
        [self.view addSubview:HUD];
        [HUD show:YES];
        [HUD hide:YES afterDelay:2];
    }
    else if([strNotification isEqualToString:DWXMPP_NOTIFICATION_AUTNENTICATE_FAULT]){
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        
        MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.view];
        HUD.mode = MBProgressHUDModeText;
        HUD.detailsLabelText = @"用户名或密码输入错误\n请重新输入";
        HUD.removeFromSuperViewOnHide = YES;
        [self.view addSubview:HUD];
        [HUD show:YES];
        [HUD hide:YES afterDelay:2];
    }
}


#pragma mark - Logout
- (IBAction)userLogout:(id)sender {
    [[DWXMPP_Core sharedManager] logout];
}





//-----------------查看网络状态
-(void)checkNetStatus{
    
    NSInteger status = [ChechNetStatus checkDreviceNetStatus];
    switch (status) {
        case 0:
            [RKAlertView showNoCancelBtnAlertWithTitle:@"网络连接" message:@"请检查您的网络连接" confirmTitle:@"确认" confrimBlock:^{
                NSLog(@"请检查您的网络连接");
            }];
            
            break;
            
        case 1:
            [RKAlertView showNoCancelBtnAlertWithTitle:@"网络连接" message:@"wifi" confirmTitle:@"确认" confrimBlock:^{
                NSLog(@"wifi");
            }];
            
            break;
            
        case 2:
            [RKAlertView showNoCancelBtnAlertWithTitle:@"网络连接" message:@"数据" confirmTitle:@"确认" confrimBlock:^{
                NSLog(@"数据");
            }];
            break;
            
        default:
            break;
    }
    
}

//注册
-(void)zhuce
{
    [self.navigationController pushViewController:[[RegisterViewController alloc]init] animated:YES];
}

-(void)registration:(UIButton *)button
{
    [self.navigationController pushViewController:[[RegisterViewController alloc]init] animated:YES];
}


-(void)fogetPwd:(UIButton *)button
{
    [self.navigationController pushViewController:[[ForgetPasswordViewController alloc]init] animated:YES];
}

@end
