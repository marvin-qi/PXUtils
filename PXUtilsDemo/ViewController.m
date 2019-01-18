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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *view = [[UILabel alloc] initWithFrame:CGRectMake(100, 50, 200, 50)];
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
    [tv setFrame:CGRectMake(100, 100, 200, 300)];
    
    User *user0 = [User sharedInstance];
    User *user1 = [User sharedInstance];
    
    PXUtilsLog(@"%@===%@",user0,user1);
}


@end
