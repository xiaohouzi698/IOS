//
//  PatientSelfViewController.m
//  BRSF
//
//  Created by mac on 16/3/10.
//  Copyright © 2016年 HongTao. All rights reserved.
//

#import "SettingPatientHeaderViewController.h"
#import "FSComboListView.h"
#import "PatientSelfCheckViewController.h"
#import "AFNetWork.h"
#import "RKAlertView.h"

@interface PatientSelfCheckViewController ()<FSComboPickerViewDelegate>
{
    UIView *bgView;
    UITextField *searchid;
    UITextField *name;
    UITextField *gender;
    UITextField *birthday;
    UITextField *degree;
    UITextField *maritalStatus;
    UITextField *workingCondition;
}



@end

@implementation PatientSelfCheckViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title=@"个人信息";
    self.view.backgroundColor=[UIColor colorWithRed:240/255.0f green:240/255.0f blue:240/255.0f alpha:1];
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(clickaddBtn)];
    [addBtn setImage:[UIImage imageNamed:@"goback_back_orange_on"]];
    [addBtn setImageInsets:UIEdgeInsetsMake(0, -15, 0, 15)];
    addBtn.tintColor=[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1];
    [self.navigationItem setLeftBarButtonItem:addBtn];
    
    [self createTextFields];
    
    
    
    
}

-(void)createTextFields
{
//    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(30, 75, self.view.frame.size.width-90, 30)];
//    label.text=@"更新个人信息";
//    label.textColor=[UIColor grayColor];
//    label.textAlignment=NSTextAlignmentLeft;
//    label.font=[UIFont systemFontOfSize:13];
//    [self.view addSubview:label];

    
    searchid=[self createTextFielfFrame:CGRectMake(30, 75, self.view.frame.size.width-60, 30) font:[UIFont systemFontOfSize:14] placeholder:@"请输入患者id"];
    searchid.clearButtonMode = UITextFieldViewModeWhileEditing;
    searchid.borderStyle=UITextBorderStyleRoundedRect;
    [self.view addSubview:searchid];
    
    CGRect frame=[UIScreen mainScreen].bounds;
    bgView=[[UIView alloc]initWithFrame:CGRectMake(10, 110, frame.size.width-20, 300)];
    bgView.layer.cornerRadius=3.0;
    bgView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:bgView];
    
    name =[self createTextFielfFrame:CGRectMake(100, 10, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"姓名"];
    name.clearButtonMode = UITextFieldViewModeWhileEditing;
    name.userInteractionEnabled = NO;
    
    UILabel *namelabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 12, 50, 25)];
    namelabel.text=@"姓名";
    namelabel.textColor=[UIColor blackColor];
    namelabel.textAlignment=NSTextAlignmentLeft;
    namelabel.font=[UIFont systemFontOfSize:14];
    
    UIImageView *line1=[self createImageViewFrame:CGRectMake(20, 40, bgView.frame.size.width-40, 1) imageName:nil color:[UIColor colorWithRed:180/255.0f green:180/255.0f blue:180/255.0f alpha:.3]];
    
    gender=[self createTextFielfFrame:CGRectMake(100, 50, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"男／女"];
    gender.clearButtonMode = UITextFieldViewModeWhileEditing;
    gender.userInteractionEnabled = NO;
    
    //    FSComboListView *genderListView = [[FSComboListView alloc] initWithValues:@[@"男",@"女"]frame:CGRectMake(90, 160, 180, 20)];
    //    genderListView.delegate = self;
    //    genderListView.tintColor = [UIColor darkGrayColor];
    //    genderListView.textColor = [UIColor darkGrayColor];
    
    UILabel *genderlabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 52, 50, 25)];
    genderlabel.text=@"性别";
    genderlabel.textColor=[UIColor blackColor];
    genderlabel.textAlignment=NSTextAlignmentLeft;
    genderlabel.font=[UIFont systemFontOfSize:14];
    
    UIImageView *line2=[self createImageViewFrame:CGRectMake(20, 90, bgView.frame.size.width-40, 1) imageName:nil color:[UIColor colorWithRed:180/255.0f green:180/255.0f blue:180/255.0f alpha:.3]];
    
    birthday=[self createTextFielfFrame:CGRectMake(100, 100, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"出生年月"];
    birthday.clearButtonMode = UITextFieldViewModeWhileEditing;
    birthday.userInteractionEnabled = NO;
    
    UILabel *birthdaylabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 102, 60, 25)];
    birthdaylabel.text=@"出生年月";
    birthdaylabel.textColor=[UIColor blackColor];
    birthdaylabel.textAlignment=NSTextAlignmentLeft;
    birthdaylabel.font=[UIFont systemFontOfSize:14];
    
    UIImageView *line3=[self createImageViewFrame:CGRectMake(20, 140, bgView.frame.size.width-40, 1) imageName:nil color:[UIColor colorWithRed:180/255.0f green:180/255.0f blue:180/255.0f alpha:.3]];
    
    degree=[self createTextFielfFrame:CGRectMake(100, 150, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"学历"];
    degree.clearButtonMode = UITextFieldViewModeWhileEditing;
    degree.userInteractionEnabled = NO;

    
    UILabel *degreelabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 152, 50, 25)];
    degreelabel.text=@"学历";
    degreelabel.textColor=[UIColor blackColor];
    degreelabel.textAlignment=NSTextAlignmentLeft;
    degreelabel.font=[UIFont systemFontOfSize:14];
    
    UIImageView *line4=[self createImageViewFrame:CGRectMake(20, 190, bgView.frame.size.width-40, 1) imageName:nil color:[UIColor colorWithRed:180/255.0f green:180/255.0f blue:180/255.0f alpha:.3]];
    
    maritalStatus=[self createTextFielfFrame:CGRectMake(100, 200, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"婚姻状况"];
    maritalStatus.clearButtonMode = UITextFieldViewModeWhileEditing;
    maritalStatus.userInteractionEnabled = NO;

       //maritalStatus.text = @"";
    
    UILabel *maritalStatuslabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 202, 60, 25)];
    maritalStatuslabel.text=@"婚姻状况";
    maritalStatuslabel.textColor=[UIColor blackColor];
    maritalStatuslabel.textAlignment=NSTextAlignmentLeft;
    maritalStatuslabel.font=[UIFont systemFontOfSize:14];
    
    UIImageView *line5=[self createImageViewFrame:CGRectMake(20, 240, bgView.frame.size.width-40, 1) imageName:nil color:[UIColor colorWithRed:180/255.0f green:180/255.0f blue:180/255.0f alpha:.3]];
    
    workingCondition=[self createTextFielfFrame:CGRectMake(100, 250, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"工作状况"];
    workingCondition.clearButtonMode = UITextFieldViewModeWhileEditing;
    workingCondition.userInteractionEnabled = NO;
    
    UILabel *workingConditionlabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 252, 60, 25)];
    workingConditionlabel.text=@"工作状况";
    workingConditionlabel.textColor=[UIColor blackColor];
    workingConditionlabel.textAlignment=NSTextAlignmentLeft;
    workingConditionlabel.font=[UIFont systemFontOfSize:14];
    
    UIButton *landBtn=[self createButtonFrame:CGRectMake(10, bgView.frame.size.height+bgView.frame.origin.y+30,self.view.frame.size.width-20, 37) backImageName:nil title:@"查询" titleColor:[UIColor whiteColor]  font:[UIFont systemFontOfSize:17] target:self action:@selector(landClick)];
    landBtn.backgroundColor=[UIColor colorWithRed:0/255.0 green:153/255.0 blue:255/255.0 alpha:1.0];
    landBtn.layer.cornerRadius=5.0f;
    
    [bgView addSubview:name];
    [bgView addSubview:namelabel];
    [bgView addSubview:line1];
    
    [bgView addSubview:gender];
    [bgView addSubview:genderlabel];
    [bgView addSubview:line2];
    
    [bgView addSubview:birthday];
    [bgView addSubview:birthdaylabel];
    [bgView addSubview:line3];
    
    [bgView addSubview:degree];
    [bgView addSubview:degreelabel];
    [bgView addSubview:line4];
    
    [bgView addSubview:maritalStatus];
    [bgView addSubview:maritalStatuslabel];
    [bgView addSubview:line5];
    
    [bgView addSubview:workingCondition];
    [bgView addSubview:workingConditionlabel];
    
    
    
    
    
    //  [self.view addSubview:genderListView];
    
    
    
    
    
    // [self setupGenderListView];
    [self.view addSubview:landBtn];
}

-(void)landClick
{
    NSString *getName = name.text ;
    NSString *getGender = gender.text;
    NSString *getBirthday = birthday.text;
    NSString *getDegree = degree.text;
    NSString *getMaritalStatus = maritalStatus.text;
    NSString *getWorkingCondition = workingCondition.text;
    
    
//    
//    AFNetWork *afNetWork = [[AFNetWork alloc] init];
//    [afNetWork reach];
//    [afNetWork getWithURL:@"http://115.159.159.35:3001/api/Doctors?filter[where][username]=" WithParmeters:@{@"name":getName, @"gender":getGender,@"birthday":getBirthday, @"degree":getDegree,@"maritalStatus":getMaritalStatus, @"workingCondition":getWorkingCondition}];
//    [afNetWork setBlock:^(id info){
//        
//        NSLog(@"info = %@", info);
//        NSArray *array = info[@"data"][@"topic"];
//        NSLog(@"%@",array);
//        for (int i = 0; i < array.count; i++) {
//            // [_dataSource addObject:array[i]];
//        }
//        
//        //[self.tableView reloadData];
//    }];

    
    //添加一个遮罩，禁止用户操作
    
     //
     //    1.设置请求路径
         NSString *urlStr=[NSString stringWithFormat:@"http://115.159.159.35:3001/api/Doctors?filter[where][username]=%@",searchid.text];
         NSURL *url=[NSURL URLWithString:urlStr];
    
     //    2.创建请求对象
         NSURLRequest *request=[NSURLRequest requestWithURL:url];
    
     //    3.发送请求
        //3.1发送同步请求，在主线程执行
     //    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
         //（一直在等待服务器返回数据，这行代码会卡住，如果服务器没有返回数据，那么在主线程UI会卡住不能继续执行操作）
    
         //3.1发送异步请求
         //创建一个队列（默认添加到该队列中的任务异步执行）
     //    NSOperationQueue *queue=[[NSOperationQueue alloc]init];
         //获取一个主队列
         NSOperationQueue *queue=[NSOperationQueue mainQueue];
         [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                 NSLog(@"--block回调数据--%@---%d", [NSThread currentThread],data.length);
                 //隐藏HUD，刷新UI的操作一定要放在主线程执行
                                //解析data
             
                 NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
                 NSLog(@"%@",dict);
             
             }];
   
    
    
    
    //[[self navigationController] popViewControllerAnimated:YES];
    //    PickImageViewController *ickImageViewController = [[PickImageViewController alloc] init];
    //    [self presentModalViewController:ickImageViewController animated:YES];
    
    
    //    if([passward.text isEqualToString:@""])
    //    {
    //        //[SVProgressHUD showInfoWithStatus:@"您还未设置密码"];
    //        return;
    //    }
    //    else if (passward.text.length <6)
    //    {
    //        //[SVProgressHUD showInfoWithStatus:@"亲,密码长度至少六位"];
    //        return;
    //    }
//    [self.navigationController pushViewController:[[SettingPatientHeaderViewController alloc]init] animated:YES];
    // [CheckTools savePassword:passward.text];
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

-(void)clickaddBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - FSComboListView

- (void)setupGenderListView
{
    //    FSComboListView *genderListView = [[FSComboListView alloc] initWithValues:@[@"男",@"女"]frame:CGRectMake(0, 0, 300, 40)];
    //    genderListView.delegate = self;
    //    genderListView.tintColor = [UIColor darkGrayColor];
    //    genderListView.textColor = [UIColor darkGrayColor];
    //
    //    [self.view addSubview:genderListView];
}
- (void) comboboxOpened:(FSComboListView *)combobox
{
    NSLog(@"comboboxOpened");
}

- (void) comboboxClosed:(FSComboListView *)combobox
{
    NSLog(@"comboboxClosed");
}

- (void) comboboxChanged:(FSComboListView *)combobox toValue:(NSString *)toValue
{
    NSLog(@"comboboxChanged to value %@",toValue);
    
    //    _msgLabel.text = [NSString stringWithFormat:@"%lu,  %@", (unsigned long)combobox.selectedRow, toValue];
}


@end

