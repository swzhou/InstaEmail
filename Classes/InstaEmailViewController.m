//
//  InstaEmailViewController.m
//  InstaEmail
//
//  Created by renee on 3/17/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "InstaEmailViewController.h"

@implementation InstaEmailViewController
@synthesize emailPicker=emailPicker_;
@synthesize notesField = notesField_;


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	activities_ = [[NSArray alloc] initWithObjects:@"sleeping",
				   @"eating", @"working", @"thinking", @"crying", @"begging",
				   @"leaving", @"shopping", @"hello worlding", nil];
	feelings_ = [[NSArray alloc] initWithObjects:@"awesome",
				 @"sad", @"happy", @"ambivalent", @"nauseous", @"psyched",
				 @"confused", @"hopeful", @"anxious", nil];
}

#pragma mark -
#pragma mark Picker Datasource Protocol
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	if (component == 0) {
		return [activities_ count];
	} else {
		return [feelings_ count];
	}
}

#pragma mark -
#pragma mark Picker Delegate Protocol
-(NSString *)pickerView:(UIPickerView *)pickerView 
titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	if (component == 0) {
		return [activities_ objectAtIndex:row];
	}else {
		return [feelings_ objectAtIndex:row];
	}
}


#pragma mark -
#pragma mark Mail composer delegate method
- (void)mailComposeController:(MFMailComposeViewController*)
controller
		 didFinishWithResult:(MFMailComposeResult)result
						error:(NSError*)error;
{
	[self dismissModalViewControllerAnimated:YES];
}


#pragma mark -
#pragma mark Actions
-(IBAction) sendButtonTapped: (id) sender {
	NSString* theMessage = [NSString stringWithFormat:@"%@ I'm %@ and feeling %@ about it.",
							notesField_ ? notesField_.text : @"",
							[activities_ objectAtIndex:[emailPicker_ selectedRowInComponent:0]],
							[feelings_ objectAtIndex:[emailPicker_ selectedRowInComponent:1]]];
	if ([MFMailComposeViewController canSendMail]) {
		MFMailComposeViewController* mailController = [[MFMailComposeViewController alloc] init];
		mailController.mailComposeDelegate = self;
		[mailController setSubject:@"Hello Renee!"];
		[mailController setMessageBody:theMessage isHTML:NO];
		[self presentModalViewController:mailController animated:YES];
		[mailController release];
	}else {
		NSLog(@"%@", @"Sorry, you need to setup mail first!");
	}
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (IBAction) textFieldDoneEditing:(id) sender {
	[sender resignFirstResponder];
}

- (void)dealloc {
	[emailPicker_ release];
	[activities_ release];
	[feelings_ release];
	[notesField_ release];
    [super dealloc];
}

@end
