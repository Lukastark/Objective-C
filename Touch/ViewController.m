//
//  ViewController.m
//  touch
//
//  Created by Luka Jashiashvili on 2/10/16.
//  Copyright © 2016 Luka Stark. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIView *floatingView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.floatingView.alpha = 0;
    self.floatingView.layer.cornerRadius = 50;
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.floatingView.alpha = 1;
    }];
    
    
    self.floatingView.center = location;
}

- (void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    
            self.floatingView.center = location;
}

- (void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    [UIView animateWithDuration:0.3 animations:^{
        self.floatingView.alpha = 0;
    }];
}

- (void) touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}
@end
