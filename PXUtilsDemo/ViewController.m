//
//  ViewController.m
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/17.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#import "ViewController.h"
#import "PXUtils.h"
#import "User.h"
#import "TwoVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"一";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [UIFont px_showAllFonts];
    
    UILabel *view = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
    [self.view addSubview:view];
    view.font = PXUtilsMicrosoftFont(20);
    view.lineType = PXLineTypeMid;
    view.lineColor = PXUtilsColorHex(@"3fd15b");
    view.text = [NSDate date].currentTimeString;
    
    UITextView *tv = [[UITextView alloc] init];
    [self.view addSubview:tv];
    
    tv.backgroundColor = [UIColor px_colorWithHexString:@"E9E9E9"];
    tv.textColor = [UIColor orangeColor];
    tv.text = @"删除可以看到placeholder";
    tv.placeholder = @"请输入";
    tv.placeholderFont = PXUtilsFont(16);
    tv.placeholderColor = [UIColor magentaColor];
    tv.font = PXUtilsFont(16);
    [tv px_limitMaxLength:tv.text.length];
    [tv setFrame:CGRectMake(100, 150, 200, 300)];
    
    User *user0 = [User sharedInstance];
    User *user1 = [User sharedInstance];
    
    PXUtilsLog(@"%@===%@",user0,user1);
    
    UIButton *btn = [UIButton px_buttonWithTitle:@"toTwoVC"
                                       titleFont:PXUtilsFont(16)
                                      titleColor:PXUtilsColorHex(@"af6109")
                                 backgroundColor:[UIColor cyanColor]
                                          target:self
                                          action:@selector(toTwoVC)];
    [btn setFrame:CGRectMake(100, tv.bottom + 20, 100, 100)];
    [btn setImage:PXUtilsImageNamed(@"imagename") forState:UIControlStateNormal];
    [btn px_buttonType:PXButtonTypeTopImage space:10];
    [self.view addSubview:btn];
    
}

- (void)toTwoVC{
    TwoVC *vc = [TwoVC new];
    vc.navigationItem.title = @"二";
    [self.navigationController pushViewController:vc animated:TRUE];
}

@end
