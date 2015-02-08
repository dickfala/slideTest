//
//  ViewController.m
//  SlideAutoLayoutDemo
//

//  Copyright (c) 2015年 yu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    BOOL isContainerOpen;
    CGSize screenSize;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    isContainerOpen = NO;
    
    screenSize = [self getScreenSize];
    NSLog(@"%f/%f",screenSize.height,screenSize.width);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)slideBtnAction:(id)sender {
    if (isContainerOpen) {
        // 100 is for user click region
        // it is slide view action (close)
        [self replaceTopConstraintOnView:self.containerView withConstant: -self.containerView.frame.size.height + 40];
    } else {
        // it is slide view action(open)
        [self replaceTopConstraintOnView:self.containerView withConstant: self.containerView.frame.size.height - _btmBtn1.frame.size.height - 40];
    }
    
    [self animateConstraints];
    isContainerOpen = !isContainerOpen;
    
}

- (void)replaceTopConstraintOnView:(UIView *)view withConstant:(float)constant
{
    [self.view.constraints enumerateObjectsUsingBlock:^(NSLayoutConstraint *constraint, NSUInteger idx, BOOL *stop) {
        if ((constraint.firstItem == view) && (constraint.firstAttribute == NSLayoutAttributeTop)) {
            constraint.constant = constant;
        }
    }];
}

- (void)animateConstraints
{
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }];
}

-(CGSize)getScreenSize {
    CGSize mScreenSize = [UIScreen mainScreen].bounds.size;
    if ((NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return CGSizeMake(mScreenSize.height, mScreenSize.width);
    }
    return mScreenSize;
}

@end
