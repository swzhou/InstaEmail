//
//  InstaEmailAppDelegate.h
//  InstaEmail
//
//  Created by renee on 3/17/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class InstaEmailViewController;

@interface InstaEmailAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    InstaEmailViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet InstaEmailViewController *viewController;

@end

