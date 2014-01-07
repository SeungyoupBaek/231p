//
//  ViewController.m
//  231p
//
//  Created by Youp on 2014. 1. 8..
//  Copyright (c) 2014년 admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController


-(IBAction)series:(id)sender{
    // 연속애니메이션
    [UIView beginAnimations:@"id_series" context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:1.0];
    
    // 델리게이트
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(changeBackgroundClear)];
    
    self.imageView.backgroundColor = [UIColor whiteColor];
    
    [UIView commitAnimations];
}

-(void)changeBackgroundClear{
    [UIView beginAnimations:@"id_series2" context:NULL];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationDelegate:self];
    
    self.imageView.backgroundColor = [UIColor clearColor];
    
    [UIView commitAnimations];
}

// 원상복귀
-(IBAction)setOriginal:(id)sender{
    [UIView beginAnimations:@"original" context:Nil];
    [UIView setAnimationDuration:0.7];
    
    self.imageView.transform = CGAffineTransformIdentity;

}

// 두개의 트랜스폼 결합
-(IBAction)combination:(id)sender{
    CGAffineTransform t1 = CGAffineTransformMakeScale(1.2, 1.2);
    CGAffineTransform t2 = CGAffineTransformMakeTranslation(30, 30);
    CGAffineTransform comb = CGAffineTransformConcat(t1, t2);
    CGAffineTransform t = CGAffineTransformConcat(self.imageView.transform, comb);
    
    [UIView beginAnimations:@"id_move" context:Nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.7];
    
    self.imageView.transform = t;
    
    [UIView commitAnimations];
}

// 회전
-(IBAction)rotate:(id)sender{
    [UIView beginAnimations:@"id_rotate" context:Nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.7];
    
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI);
    
    [UIView commitAnimations];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
