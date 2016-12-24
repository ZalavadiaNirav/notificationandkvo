//
//  notificationPost.m
//  Notification
//
//  Created by C N Soft Net on 22/12/16.
//  Copyright © 2016 C N Soft Net. All rights reserved.
//

#import "notificationPost.h"
#import "Carparking.h"

@interface notificationPost ()

@end

@implementation notificationPost
@synthesize DATA,obj_park;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.DATA=[[NSMutableDictionary alloc] init];
    [self.DATA setValue:@"v1" forKey:@"firstValue"];
    [self.DATA setValue:@"v2" forKey:@"secondValue"];
    
    //call notification and passing dictionary
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TestNotification" object:self.DATA];
    
    //Another observer on Dict's firstValue key KVO for observing value of old and new value
    [self.DATA addObserver:self forKeyPath:@"firstValue" options:(NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew) context:NULL];
    [self.DATA setValue:@"v1New" forKey:@"firstValue"];
    [self.DATA removeObserver:self forKeyPath:@"firstValue"];
    
    
    //Add 2nd observer for NSObject class 
    self.obj_park=[[Carparking alloc] init];
    [self.obj_park addObserver:self forKeyPath:@"loc" options:(NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew)
                  context:NULL];
    self.obj_park.loc=2;
    self.obj_park.loc=100;
    [self.obj_park removeObserver:self forKeyPath:@"loc" context:NULL];



}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"observer called");
    if([keyPath isEqualToString:@"firstValue"])
    {
        NSLog(@"Old values = %@ New Values = %@",[NSString stringWithFormat:@"%@",[change objectForKey:NSKeyValueChangeOldKey]],[NSString stringWithFormat:@"%@",[change objectForKey:NSKeyValueChangeNewKey]]);
    }
    if([keyPath isEqualToString:@"loc"])
    {
        NSLog(@"Old values = %@ New Values = %@",[NSString stringWithFormat:@"%@",[change objectForKey:NSKeyValueChangeOldKey]],[NSString stringWithFormat:@"%@",[change objectForKey:NSKeyValueChangeNewKey]]);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
