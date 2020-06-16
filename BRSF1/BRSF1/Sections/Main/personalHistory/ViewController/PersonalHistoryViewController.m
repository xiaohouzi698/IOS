//
//  PersonalHistoryViewController.m
//  BRSF
//
//  Created by mac on 16/3/10.
//  Copyright © 2016年 HongTao. All rights reserved.
//

#import "PersonalHistoryViewController.h"
#import "SettingPatientHeaderViewController.h"
#import "FSComboListView.h"
#import "AFNetWork.h"

@interface PersonalHistoryViewController ()<FSComboPickerViewDelegate>
{
    UIView *bgView;
    UITextField *chiefComplaint;
    UITextField *drugAllergy;
    UITextField *surgicalTrauma;
    UITextField *familyHistory;
    UITextField *somaticDiseases;
    UITextField *physicalExamination;
}


@end

@implementation PersonalHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title=@"个人病史";
    self.view.backgroundColor=[UIColor colorWithRed:240/255.0f green:240/255.0f blue:240/255.0f alpha:1];
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(clickaddBtn)];
    [addBtn setImage:[UIImage imageNamed:@"goback_back_orange_on"]];
    [addBtn setImageInsets:UIEdgeInsetsMake(0, -15, 0, 15)];
    addBtn.tintColor=[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1];
    [self.navigationItem setLeftBarButtonItem:addBtn];
    
    [self createTextFields];
    
    
    NSUserDefaults *patient =[NSUserDefaults standardUserDefaults];
    chiefComplaint.text=[patient objectForKey:@"chiefComplaint"];
    drugAllergy.text=[patient objectForKey:@"drugAllergy"];
    surgicalTrauma.text=[patient objectForKey:@"surgicalTrauma"];
    familyHistory.text=[patient objectForKey:@"familyHistory"];
    somaticDiseases.text=[patient objectForKey:@"somaticDiseases"];
    physicalExamination.text=[patient objectForKey:@"physicalExamination"];
    

    
    
}

-(void)createTextFields
{
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(30, 75, self.view.frame.size.width-90, 30)];
    label.text=@"填写个人病史";
    label.textColor=[UIColor grayColor];
    label.textAlignment=NSTextAlignmentLeft;
    label.font=[UIFont systemFontOfSize:13];
    [self.view addSubview:label];
    
    CGRect frame=[UIScreen mainScreen].bounds;
    bgView=[[UIView alloc]initWithFrame:CGRectMake(10, 110, frame.size.width-20, 300)];
    bgView.layer.cornerRadius=3.0;
    bgView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:bgView];
    
    chiefComplaint =[self createTextFielfFrame:CGRectMake(100, 10, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"主诉"];
    chiefComplaint.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    
    UILabel *chiefComplaintlabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 12, 50, 25)];
    chiefComplaintlabel.text=@"主诉";
    chiefComplaintlabel.textColor=[UIColor blackColor];
    chiefComplaintlabel.textAlignment=NSTextAlignmentLeft;
    chiefComplaintlabel.font=[UIFont systemFontOfSize:14];
    
    UIImageView *line1=[self createImageViewFrame:CGRectMake(20, 40, bgView.frame.size.width-40, 1) imageName:nil color:[UIColor colorWithRed:180/255.0f green:180/255.0f blue:180/255.0f alpha:.3]];
    
    drugAllergy=[self createTextFielfFrame:CGRectMake(100, 50, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"药物过敏史"];
    drugAllergy.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    
    UILabel *drugAllergylabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 52, 70, 25)];
    drugAllergylabel.text=@"药物过敏史";
    drugAllergylabel.textColor=[UIColor blackColor];
    drugAllergylabel.textAlignment=NSTextAlignmentLeft;
    drugAllergylabel.font=[UIFont systemFontOfSize:14];
    
    UIImageView *line2=[self createImageViewFrame:CGRectMake(20, 90, bgView.frame.size.width-40, 1) imageName:nil color:[UIColor colorWithRed:180/255.0f green:180/255.0f blue:180/255.0f alpha:.3]];
    
    surgicalTrauma=[self createTextFielfFrame:CGRectMake(100, 100, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"手术外伤史"];
    surgicalTrauma.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    UILabel *surgicalTraumalabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 102, 70, 25)];
    surgicalTraumalabel.text=@"手术外伤史";
    surgicalTraumalabel.textColor=[UIColor blackColor];
    surgicalTraumalabel.textAlignment=NSTextAlignmentLeft;
    surgicalTraumalabel.font=[UIFont systemFontOfSize:14];
    
    UIImageView *line3=[self createImageViewFrame:CGRectMake(20, 140, bgView.frame.size.width-40, 1) imageName:nil color:[UIColor colorWithRed:180/255.0f green:180/255.0f blue:180/255.0f alpha:.3]];
    
    familyHistory=[self createTextFielfFrame:CGRectMake(100, 150, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"家族史"];
    familyHistory.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    UILabel *familyHistorylabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 152, 60, 25)];
    familyHistorylabel.text=@"家族史";
    familyHistorylabel.textColor=[UIColor blackColor];
    familyHistorylabel.textAlignment=NSTextAlignmentLeft;
    familyHistorylabel.font=[UIFont systemFontOfSize:14];
    
    UIImageView *line4=[self createImageViewFrame:CGRectMake(20, 190, bgView.frame.size.width-40, 1) imageName:nil color:[UIColor colorWithRed:180/255.0f green:180/255.0f blue:180/255.0f alpha:.3]];
    
    somaticDiseases=[self createTextFielfFrame:CGRectMake(100, 200, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"躯体疾病史"];
    somaticDiseases.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    
    UILabel *somaticDiseaseslabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 202, 70, 25)];
    somaticDiseaseslabel.text=@"躯体疾病史";
    somaticDiseaseslabel.textColor=[UIColor blackColor];
    somaticDiseaseslabel.textAlignment=NSTextAlignmentLeft;
    somaticDiseaseslabel.font=[UIFont systemFontOfSize:14];
    
    UIImageView *line5=[self createImageViewFrame:CGRectMake(20, 240, bgView.frame.size.width-40, 1) imageName:nil color:[UIColor colorWithRed:180/255.0f green:180/255.0f blue:180/255.0f alpha:.3]];
    
    physicalExamination=[self createTextFielfFrame:CGRectMake(100, 250, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"体格检查"];
    physicalExamination.clearButtonMode = UITextFieldViewModeWhileEditing;
   
    
    UILabel *physicalExaminationlabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 252, 60, 25)];
    physicalExaminationlabel.text=@"体格检查";
    physicalExaminationlabel.textColor=[UIColor blackColor];
    physicalExaminationlabel.textAlignment=NSTextAlignmentLeft;
    physicalExaminationlabel.font=[UIFont systemFontOfSize:14];
    
    UIButton *landBtn=[self createButtonFrame:CGRectMake(10, bgView.frame.size.height+bgView.frame.origin.y+30,self.view.frame.size.width-20, 37) backImageName:nil title:@"提交" titleColor:[UIColor whiteColor]  font:[UIFont systemFontOfSize:17] target:self action:@selector(landClick)];
    landBtn.backgroundColor=[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1];
    landBtn.layer.cornerRadius=5.0f;
    
    [bgView addSubview:chiefComplaint];
    [bgView addSubview:chiefComplaintlabel];
    [bgView addSubview:line1];
    
    [bgView addSubview:drugAllergy];
    [bgView addSubview:drugAllergylabel];
    [bgView addSubview:line2];
    
    [bgView addSubview:surgicalTrauma];
    [bgView addSubview:surgicalTraumalabel];
    [bgView addSubview:line3];
    
    [bgView addSubview:familyHistory];
    [bgView addSubview:familyHistorylabel];
    [bgView addSubview:line4];
    
    [bgView addSubview:somaticDiseases];
    [bgView addSubview:somaticDiseaseslabel];
    [bgView addSubview:line5];
    
    [bgView addSubview:physicalExamination];
    [bgView addSubview:physicalExaminationlabel];
    
    [self.view addSubview:landBtn];
}

-(void)landClick
{
    NSUserDefaults *patient =[NSUserDefaults standardUserDefaults];
    
    //个人病史
    [patient setObject:chiefComplaint.text forKey:@"chiefComplaint"];
    [patient setObject:drugAllergy.text forKey:@"drugAllergy"];
    [patient setObject:surgicalTrauma.text forKey:@"surgicalTrauma"];
    [patient setObject:familyHistory.text forKey:@"familyHistory"];
    [patient setObject:somaticDiseases.text forKey:@"somaticDiseases"];
    [patient setObject:physicalExamination.text forKey:@"physicalExamination"];
    
    
    
    NSString *postChiefComplaint = chiefComplaint.text ;
    NSString *postDrugAllergy = drugAllergy.text;
    NSString *postSurgicalTrauma = surgicalTrauma.text;
    NSString *postFamilyHistory = familyHistory.text;
    NSString *postSomaticDiseases = somaticDiseases.text;
    NSString *postPhysicalExamination = physicalExamination.text;
    
    
    
    AFNetWork *afNetWork = [[AFNetWork alloc] init];
    [afNetWork reach];
    [afNetWork postWithURL:@"http://115.159.159.35:3001/api/Patients" WithParmeters:@{@"chiefComplaint":postChiefComplaint, @"drugAllergy":postDrugAllergy,@"surgicalTrauma":postSurgicalTrauma, @"familyHistory":postFamilyHistory,@"somaticDiseases":postSomaticDiseases, @"physicalExamination":postPhysicalExamination}];
    [afNetWork setBlock:^(id info){
        
        NSLog(@"info = %@", info);
        NSArray *array = info[@"data"][@"topic"];
        NSLog(@"%@",array);
        for (int i = 0; i < array.count; i++) {
            // [_dataSource addObject:array[i]];
        }
        
        //[self.tableView reloadData];
    }];

    
    
    
    
    
    [[self navigationController] popViewControllerAnimated:YES];
    
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

