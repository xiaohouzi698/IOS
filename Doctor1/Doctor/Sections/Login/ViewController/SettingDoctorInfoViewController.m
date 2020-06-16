//
//  settingPassWardViewController.m
//  chuanke
//
//  Created by mj on 15/11/30.
//  Copyright © 2015年 jinzelu. All rights reserved.
//

#import "SettingDoctorInfoViewController.h"
#import "SettingPatientHeaderViewController.h"
#import "FSComboListView.h"
#import "AFNetWork.h"

@interface SettingDoctorInfoViewController ()
{
    UIView *bgView;
    UITextField *name;
    UITextField *gender;
    UITextField *introduction;
    UITextField *degree;
    UITextField *professional;
    UITextField *workPlace;
    
}


@end

@implementation SettingDoctorInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    
    self.title=@"注册2/3";
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
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(30, 75, self.view.frame.size.width-90, 30)];
    label.text=@"请输入个人信息";
    label.textColor=[UIColor grayColor];
    label.textAlignment=NSTextAlignmentLeft;
    label.font=[UIFont systemFontOfSize:13];
    [self.view addSubview:label];
    
    CGRect frame=[UIScreen mainScreen].bounds;
    bgView=[[UIView alloc]initWithFrame:CGRectMake(10, 110, frame.size.width-20, 300)];
    bgView.layer.cornerRadius=3.0;
    bgView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:bgView];
    
    name =[self createTextFielfFrame:CGRectMake(100, 10, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"张三"];
    name.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    UILabel *namelabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 12, 50, 25)];
    namelabel.text=@"姓名";
    namelabel.textColor=[UIColor blackColor];
    namelabel.textAlignment=NSTextAlignmentLeft;
    namelabel.font=[UIFont systemFontOfSize:14];
    
    UIImageView *line1=[self createImageViewFrame:CGRectMake(20, 40, bgView.frame.size.width-40, 1) imageName:nil color:[UIColor colorWithRed:180/255.0f green:180/255.0f blue:180/255.0f alpha:.3]];
    
    gender=[self createTextFielfFrame:CGRectMake(100, 50, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"男／女"];
    gender.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    UILabel *genderlabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 52, 50, 25)];
    genderlabel.text=@"性别";
    genderlabel.textColor=[UIColor blackColor];
    genderlabel.textAlignment=NSTextAlignmentLeft;
    genderlabel.font=[UIFont systemFontOfSize:14];
    
    UIImageView *line2=[self createImageViewFrame:CGRectMake(20, 90, bgView.frame.size.width-40, 1) imageName:nil color:[UIColor colorWithRed:180/255.0f green:180/255.0f blue:180/255.0f alpha:.3]];
    
    introduction=[self createTextFielfFrame:CGRectMake(100, 100, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"简介"];
    introduction.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    
    UILabel *introductionlabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 102, 60, 25)];
    introductionlabel.text=@"简介";
    introductionlabel.textColor=[UIColor blackColor];
    introductionlabel.textAlignment=NSTextAlignmentLeft;
    introductionlabel.font=[UIFont systemFontOfSize:14];
    
    UIImageView *line3=[self createImageViewFrame:CGRectMake(20, 140, bgView.frame.size.width-40, 1) imageName:nil color:[UIColor colorWithRed:180/255.0f green:180/255.0f blue:180/255.0f alpha:.3]];
    
    degree=[self createTextFielfFrame:CGRectMake(100, 150, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"本科"];
    degree.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    
    UILabel *degreelabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 152, 50, 25)];
    degreelabel.text=@"学历";
    degreelabel.textColor=[UIColor blackColor];
    degreelabel.textAlignment=NSTextAlignmentLeft;
    degreelabel.font=[UIFont systemFontOfSize:14];
    
    UIImageView *line4=[self createImageViewFrame:CGRectMake(20, 190, bgView.frame.size.width-40, 1) imageName:nil color:[UIColor colorWithRed:180/255.0f green:180/255.0f blue:180/255.0f alpha:.3]];
    
    professional=[self createTextFielfFrame:CGRectMake(100, 200, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"职称"];
    professional.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    UILabel *professionallabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 202, 60, 25)];
    professionallabel.text=@"职称";
    professionallabel.textColor=[UIColor blackColor];
    professionallabel.textAlignment=NSTextAlignmentLeft;
    professionallabel.font=[UIFont systemFontOfSize:14];
    
    UIImageView *line5=[self createImageViewFrame:CGRectMake(20, 240, bgView.frame.size.width-40, 1) imageName:nil color:[UIColor colorWithRed:180/255.0f green:180/255.0f blue:180/255.0f alpha:.3]];
    
    workPlace=[self createTextFielfFrame:CGRectMake(100, 250, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"工作单位"];
    workPlace.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    
    UILabel *workPlacelabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 252, 60, 25)];
    workPlacelabel.text=@"工作单位";
    workPlacelabel.textColor=[UIColor blackColor];
    workPlacelabel.textAlignment=NSTextAlignmentLeft;
    workPlacelabel.font=[UIFont systemFontOfSize:14];
    
    UIButton *landBtn=[self createButtonFrame:CGRectMake(10, bgView.frame.size.height+bgView.frame.origin.y+30,self.view.frame.size.width-20, 37) backImageName:nil title:@"提交" titleColor:[UIColor whiteColor]  font:[UIFont systemFontOfSize:17] target:self action:@selector(landClick)];
    landBtn.backgroundColor=[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1];
    landBtn.layer.cornerRadius=5.0f;
    
    [bgView addSubview:name];
    [bgView addSubview:namelabel];
    [bgView addSubview:line1];
    
    [bgView addSubview:gender];
    [bgView addSubview:genderlabel];
    [bgView addSubview:line2];
    
    [bgView addSubview:introduction];
    [bgView addSubview:introductionlabel];
    [bgView addSubview:line3];
    
    [bgView addSubview:degree];
    [bgView addSubview:degreelabel];
    [bgView addSubview:line4];
    
    [bgView addSubview:professional];
    [bgView addSubview:professionallabel];
    [bgView addSubview:line5];
    
    [bgView addSubview:workPlace];
    [bgView addSubview:workPlacelabel];
    
    [self.view addSubview:landBtn];
}

-(void)landClick
{

    NSUserDefaults *doctor =[NSUserDefaults standardUserDefaults];
    //个人信息
    [doctor setObject:name.text forKey:@"name"];
    [doctor setObject:gender.text forKey:@"gender"];
    [doctor setObject:introduction.text forKey:@"introduction"];
    [doctor setObject:degree.text forKey:@"degree"];
    [doctor setObject:professional.text forKey:@"professional"];
    [doctor setObject:workPlace.text forKey:@"workPlace"];
    
    
    NSString *result =[doctor objectForKey:@"name"];
    NSLog(@"测试程序的用户是%@",result);

    
    NSString *registerUsername=[doctor objectForKey:@"registerUsername"];
    NSString *registerPassword=[doctor objectForKey:@"registerPassword"];
    
    
    NSDateFormatter* formatter =[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
    NSString *createtimeStr = [formatter stringFromDate:[NSDate date]];
    BOOL emailVerified = true;
    
    NSString *email=[registerUsername stringByAppendingString:@"@macbookair.local"];
    AFNetWork *afNetWork = [[AFNetWork alloc] init];
    [afNetWork reach];
    [afNetWork postWithURL:@"http://115.159.159.35:3001/api/Doctors" WithParmeters:@{
    @"name": name.text,
    @"gender": gender.text,
    @"major": @"抑郁症",
    @"introduction": introduction.text,
    @"degree": degree.text,
    @"email": email,
    @"professional": professional.text,
    @"workPlace": workPlace.text,
    @"username": registerUsername,
    @"password":registerPassword,
    @"created": createtimeStr,
                                            }];
    [afNetWork setBlock:^(id info){
        
        NSLog(@"info = %@", info);
        NSArray *array = info[@"data"][@"topic"];
        NSLog(@"%@",array);
        for (int i = 0; i < array.count; i++) {
            // [_dataSource addObject:array[i]];
        }
        
        //[self.tableView reloadData];
    }];

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
    [self.navigationController pushViewController:[[SettingPatientHeaderViewController alloc]init] animated:YES];
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

