//
//  InstaEmailViewController.h
//  InstaEmail
//
//  Created by renee on 3/17/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface InstaEmailViewController : UIViewController
<UIPickerViewDataSource, UIPickerViewDelegate, MFMailComposeViewControllerDelegate> {
	UIPickerView *emailPicker_;
	NSArray* activities_;
	NSArray* feelings_;
}

@property (nonatomic, retain) IBOutlet UIPickerView *emailPicker;
-(IBAction) sendButtonTapped: (id) sender;

@end

