//
//  ViewController.h
//  SlideAutoLayoutDemo
//
//  Created by Chang YuanYu on 2015/2/8.
//  Copyright (c) 2015年 yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btmBtn1;
@property (weak, nonatomic) IBOutlet UIButton *btmBtn2;

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIButton *slideBtn;
- (IBAction)slideBtnAction:(id)sender;

@end

