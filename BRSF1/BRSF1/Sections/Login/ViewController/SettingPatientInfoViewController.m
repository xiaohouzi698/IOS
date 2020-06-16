//
//  settingPassWardViewController.m
//  chuanke
//
//  Created by mj on 15/11/30.
//  Copyright © 2015年 jinzelu. All rights reserved.
//

#import "SettingPatientInfoViewController.h"
#import "SettingPatientHeaderViewController.h"
#import "FSComboListView.h"
#import "AFNetWork.h"
@interface SettingPatientInfoViewController ()
{
    UIView *bgView;
    UITextField *name;
    UITextField *gender;
    UITextField *birthday;
    UITextField *degree;
    UITextField *maritalStatus;
    UITextField *workingCondition;
    
}
@property NSArray *fruits;
@property NSArray *fruitImages;
@property CZPickerView *pickerWithImage;
@property NSArray *pickerArray;

@end

@implementation SettingPatientInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    
    self.title=@"注册2/3";
    self.view.backgroundColor=[UIColor colorWithRed:240/255.0f green:240/255.0f blue:240/255.0f alpha:1];
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc] initWithTitle:@"xiayibu" style:UIBarButtonItemStylePlain target:self action:@selector(clickaddBtn)];
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
    
    birthday=[self createTextFielfFrame:CGRectMake(100, 100, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"1994-01"];
    birthday.clearButtonMode = UITextFieldViewModeWhileEditing;
   
    
    UILabel *birthdaylabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 102, 60, 25)];
    birthdaylabel.text=@"出生年月";
    birthdaylabel.textColor=[UIColor blackColor];
    birthdaylabel.textAlignment=NSTextAlignmentLeft;
    birthdaylabel.font=[UIFont systemFontOfSize:14];
    
    UIImageView *line3=[self createImageViewFrame:CGRectMake(20, 140, bgView.frame.size.width-40, 1) imageName:nil color:[UIColor colorWithRed:180/255.0f green:180/255.0f blue:180/255.0f alpha:.3]];
    
    degree=[self createTextFielfFrame:CGRectMake(100, 150, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"本科"];
    degree.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    
    UILabel *degreelabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 152, 50, 25)];
    degreelabel.text=@"学历";
    degreelabel.textColor=[UIColor blackColor];
    degreelabel.textAlignment=NSTextAlignmentLeft;
    degreelabel.font=[UIFont systemFontOfSize:14];
    
    UIImageView *line4=[self createImageViewFrame:CGRectMake(20, 190, bgView.frame.size.width-40, 1) imageName:nil color:[UIColor colorWithRed:180/255.0f green:180/255.0f blue:180/255.0f alpha:.3]];
    
    maritalStatus=[self createTextFielfFrame:CGRectMake(100, 200, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"已婚"];
    maritalStatus.clearButtonMode = UITextFieldViewModeWhileEditing;
   
    //maritalStatus.text = @"";
    
    UILabel *maritalStatuslabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 202, 60, 25)];
    maritalStatuslabel.text=@"婚姻状况";
    maritalStatuslabel.textColor=[UIColor blackColor];
    maritalStatuslabel.textAlignment=NSTextAlignmentLeft;
    maritalStatuslabel.font=[UIFont systemFontOfSize:14];
    
     UIImageView *line5=[self createImageViewFrame:CGRectMake(20, 240, bgView.frame.size.width-40, 1) imageName:nil color:[UIColor colorWithRed:180/255.0f green:180/255.0f blue:180/255.0f alpha:.3]];
    
    workingCondition=[self createTextFielfFrame:CGRectMake(100, 250, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"工作状况"];
    workingCondition.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    
    UILabel *workingConditionlabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 252, 60, 25)];
    workingConditionlabel.text=@"工作状况";
    workingConditionlabel.textColor=[UIColor blackColor];
    workingConditionlabel.textAlignment=NSTextAlignmentLeft;
    workingConditionlabel.font=[UIFont systemFontOfSize:14];

    
    UIButton *landBtn=[self createButtonFrame:CGRectMake(10, bgView.frame.size.height+bgView.frame.origin.y+30,self.view.frame.size.width-20, 37) backImageName:nil title:@"下一步" titleColor:[UIColor whiteColor]  font:[UIFont systemFontOfSize:17] target:self action:@selector(landClick)];
    landBtn.backgroundColor=[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1];
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
    NSUserDefaults *patient =[NSUserDefaults standardUserDefaults];
    //个人信息
    [patient setObject:name.text forKey:@"name"];
    [patient setObject:gender.text forKey:@"gender"];
    [patient setObject:birthday.text forKey:@"birthday"];
    [patient setObject:degree.text forKey:@"degree"];
    [patient setObject:maritalStatus.text forKey:@"maritalStatus"];
    [patient setObject:workingCondition.text forKey:@"workingCondition"];
    //精神状况
    [patient setObject:@"" forKey:@"emotionalState"];
    [patient setObject:@"" forKey:@"speakThink"];
    [patient setObject:@"" forKey:@"appearanceActions"];
    [patient setObject:@"" forKey:@"cognitive"];
    [patient setObject:@"" forKey:@"insight"];
    [patient setObject:@"" forKey:@"cognitiveFunction"];
    //个人病史
    [patient setObject:@"" forKey:@"chiefComplaint"];
    [patient setObject:@"" forKey:@"drugAllergy"];
    [patient setObject:@"" forKey:@"surgicalTrauma"];
    [patient setObject:@"" forKey:@"familyHistory"];
    [patient setObject:@"" forKey:@"somaticDiseases"];
    [patient setObject:@"" forKey:@"physicalExamination"];
   
    NSString *result =[patient objectForKey:@"name"];
    NSLog(@"测试程序的用户是%@",result);
    
    NSString *registerUsername=[patient objectForKey:@"registerUsername"];
    NSString *registerPassword=[patient objectForKey:@"registerPassword"];

    
    NSDateFormatter* formatter =[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
    NSString *createtimeStr = [formatter stringFromDate:[NSDate date]];
    BOOL emailVerified = true;
    
    NSString *email=[registerUsername stringByAppendingString:@"@macbookair.local"];
    AFNetWork *afNetWork = [[AFNetWork alloc] init];
    [afNetWork reach];
    [afNetWork postWithURL:@"http://115.159.159.35:3001/api/Patients" WithParmeters:@{
        @"name": name.text,
        @"gender": gender.text,
        @"birthday": birthday.text,
        @"degree": degree.text,
        @"email": email,
        @"maritalStatus": maritalStatus.text,
        @"workingCondition": workingCondition.text,
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




//..............................pickerview
- (NSAttributedString *)czpickerView:(CZPickerView *)pickerView
               attributedTitleForRow:(NSInteger)row{
    
    NSAttributedString *att = [[NSAttributedString alloc]
                               initWithString:self.fruits[row]
                               attributes:@{
                                            NSFontAttributeName:[UIFont fontWithName:@"Avenir-Light" size:18.0]
                                            }];
    return att;
}

- (NSString *)czpickerView:(CZPickerView *)pickerView
               titleForRow:(NSInteger)row{
    return self.fruits[row];
}

- (UIImage *)czpickerView:(CZPickerView *)pickerView imageForRow:(NSInteger)row {
    if([pickerView isEqual:self.pickerWithImage]) {
        return self.fruitImages[row];
    }
    return nil;
}

- (NSInteger)numberOfRowsInPickerView:(CZPickerView *)pickerView{
    return self.fruits.count;
}

- (void)czpickerView:(CZPickerView *)pickerView didConfirmWithItemAtRow:(NSInteger)row{
    NSLog(@"%@ is chosen!", self.fruits[row]);
//    [gender setText:(@"%@",self.fruits[row])];
}

-(void)czpickerView:(CZPickerView *)pickerView didConfirmWithItemsAtRows:(NSArray *)rows{
    for(NSNumber *n in rows){
        NSInteger row = [n integerValue];
        NSLog(@"%@ is chosen!", self.fruits[row]);
    }
}

- (void)czpickerViewDidClickCancelButton:(CZPickerView *)pickerView{
    NSLog(@"Canceled.");
}


-(void)showWithImages{
    self.pickerWithImage = [[CZPickerView alloc] initWithHeaderTitle:@"Fruits" cancelButtonTitle:@"Cancel" confirmButtonTitle:@"Confirm"];
    self.pickerWithImage.delegate = self;
    self.pickerWithImage.dataSource = self;
    self.pickerWithImage.needFooterView = YES;
    [self.pickerWithImage show];
}

-(void)showWithFooter{
    CZPickerView *picker = [[CZPickerView alloc] initWithHeaderTitle:@"Fruits" cancelButtonTitle:@"Cancel" confirmButtonTitle:@"Confirm"];
    picker.delegate = self;
    picker.dataSource = self;
    picker.needFooterView = YES;
    [picker show];
}

-(void)showWithoutFooter {
    CZPickerView *picker = [[CZPickerView alloc] initWithHeaderTitle:@"Fruits" cancelButtonTitle:@"Cancel" confirmButtonTitle:@"Confirm"];
    picker.headerTitleFont = [UIFont systemFontOfSize: 40];
    picker.delegate = self;
    picker.dataSource = self;
    picker.needFooterView = NO;
    [picker show];
}

-(void)showWithMultipleSelection{
    CZPickerView *picker = [[CZPickerView alloc] initWithHeaderTitle:@"Fruits" cancelButtonTitle:@"Cancel" confirmButtonTitle:@"Confirm"];
    picker.delegate = self;
    picker.dataSource = self;
    picker.allowMultipleSelection = YES;
    [picker show];
}





@end

