//
//  ViewController.m
//  AnimationTest
//
//  Created by Jinho Son on 2014. 1. 7..
//  Copyright (c) 2014년 STD1. All rights reserved.
//

#import "ViewController.h"

#define DISABLE_BLOCK_CODE   1

@interface ViewController ()
{
    BOOL moveFlag;
}

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (IBAction)move:(id)sender
{
#if DISABLE_BLOCK_CODE
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.7];
    
    if (moveFlag)
    {
        self.imageView.center = CGPointMake(self.imageView.center.x+100, self.imageView.center.y+100);
    }
    else
    {
        self.imageView.center = CGPointMake(self.imageView.center.x-100, self.imageView.center.y-100);
    }
    
    moveFlag = !moveFlag;
    [UIView commitAnimations];
    
#else // 블럭을 이용한 코드
    [UIView animateWithDuration:0.7 animations:^{
        if (moveFlag)
        {
            self.imageView.center = CGPointMake(self.imageView.center.x+100, self.imageView.center.y+100);
        }
        else
        {
            self.imageView.center = CGPointMake(self.imageView.center.x-100, self.imageView.center.y-100);
        }
        
        moveFlag = !moveFlag;
    }];
#endif

}

- (IBAction)alpha:(id)sender
{
    
#if DISABLE_BLOCK_CODE
    NSLog(@"changing alpha");
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    
    self.imageView.alpha = (self.imageView.alpha == 0.0) ? 1.0 : 0.0;
    [UIView commitAnimations];
#else // 블럭을 이용한 코드
    [UIView animateWithDuration:0.7 animations:^{
        self.imageView.alpha = (self.imageView.alpha == 0.0) ? 1.0 : 0.0;
    }];
#endif
    
}


// 배경을 흰색으로 변경, 이후에는 다른 애니메이션 호출
- (IBAction)series:(id)sender
{
    
#if DISABLE_BLOCK_CODE
    [UIView beginAnimations:@"series1" context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:1.0];
    
    // 델리게이트
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(changeBackgroundClear)];
    self.imageView.backgroundColor = [UIColor whiteColor];
    [UIView commitAnimations];
    
#else  // 블록을 이용한 코드
    [UIView animateWithDuration:1.0 animations:^{
        self.imageView.backgroundColor = [UIColor whiteColor];
        } completion:^(BOOL finished){
            [UIView animateWithDuration:1.0 animations:^{
                self.imageView.backgroundColor = [UIColor clearColor];
        }];
    }];
#endif
}

- (void)changeBackgroundClear
{
    [UIView beginAnimations:@"series2" context:NULL];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationDelegate:self];
    
    self.imageView.backgroundColor = [UIColor clearColor];
    
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
