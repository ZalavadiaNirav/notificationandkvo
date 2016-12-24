//
//  ViewController.m
//  Notification
//
//  Created by C N Soft Net on 19/12/16.
//  Copyright © 2016 C N Soft Net. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(eventOccur:) name:@"TestNotification" object:nil];

}

//Notification Method
-(void)eventOccur:(NSNotification *)notification
{
    NSLog(@"Notification Center Method Called %@",notification.object);

    for (NSString *keys in notification.object) {
        NSLog(@"Keys=%@ and Values=%@",keys,[NSString stringWithFormat:@"%@",[notification.object objectForKey:keys]]);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:@"TestNotification"];

}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
}


@end
