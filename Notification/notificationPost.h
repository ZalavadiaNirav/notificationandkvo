//
//  notificationPost.h
//  Notification
//
//  Created by C N Soft Net on 22/12/16.
//  Copyright © 2016 C N Soft Net. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Carparking.h"

@interface notificationPost : UIViewController
{
    NSMutableDictionary *DATA;
    Carparking *obj_park;
}

@property (retain)NSMutableDictionary *DATA;
@property (nonatomic,retain)Carparking *obj_park;
@end
