//
//  ViewController.m
//  Touches
//
//  Created by supermacho on 18.08.16.
//  Copyright © 2016 supermacho. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) UIView* testView;
@property (weak, nonatomic) UIView* dragginView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView* view1 = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    
    view1.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:view1];
 
    self.testView = view1;
    
    UIView* view2 = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    view2.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:view2];
    
    //[self.view bringSubviewToFront:self.viewSB];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Touches


//- (void) logTouches:(NSSet*)touches withMethod:(NSString*) methodName {
//    NSMutableString* string = [NSMutableString stringWithString:methodName];
//    
//    for(UITouch* touch in touches){
//        CGPoint point = [touch locationInView:self.view];
//        [string appendFormat:@" %@",NSStringFromCGPoint(point)];
//        
//    }
//    NSLog(@" %@",string);
//}


- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   // [self logTouches:touches withMethod:@"touchesBegan"];
    UITouch* touch = [touches anyObject];
    CGPoint pointOnMainView = [touch locationInView:self.view];
    //NSLog(@"inside = %d",[self.testView pointInside:point withEvent:event]);
    UIView* view = [self.view hitTest:pointOnMainView withEvent:event];
    if (![view isEqual:self.view]) {
        self.dragginView = view;
        [self.view bringSubviewToFront:self.dragginView];
        
    }
}

- (void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   // [self logTouches:touches withMethod:@"touchesMoved"];
    if (self.dragginView) {
        UITouch* touch = [touches anyObject];
        CGPoint pointOnMainView = [touch locationInView:self.view];
        self.dragginView.center = pointOnMainView;
        
    }
}

@end
