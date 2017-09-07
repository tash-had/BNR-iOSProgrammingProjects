//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by Tash-had Saqif on 2017-09-05.
//  Copyright © 2017 Tash-had Saqif. All rights reserved.
//

#import "BNRReminderViewController.h"
@import UserNotifications;

@interface BNRReminderViewController ()

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end
@implementation BNRReminderViewController

- (IBAction)addReminder:(id)sender{
    NSDate *dateSet = self.datePicker.date;
    
    // notification center obj
    UNUserNotificationCenter *notifCenter = [UNUserNotificationCenter currentNotificationCenter];
    
    // request user authorization to send notifications (done in viewDidLoad method below instead of this addReminder method)
//    UNAuthorizationOptions options = UNAuthorizationOptionAlert + UNAuthorizationOptionSound;
//    [notifCenter requestAuthorizationWithOptions:options completionHandler:^(BOOL granted, NSError * _Nullable error) {
//        if (!granted){
//            NSLog(@"ok bitch");
//        }else{
//            NSLog(@"thnx");
//        }
//    }];
    
    
    // Prep to send reminder req
    
    // Create NotificationContent object
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"Hypnotize Me!";
    content.body = @"It's time to get hypnotized!";
    
    // Get date that was set by date picker
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *comps = [cal components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:dateSet];
    
    // Create NotificationTrigger object
    UNCalendarNotificationTrigger *trigger = [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:comps repeats:NO];
    
    // Create and send reminder request
    UNNotificationRequest *requestNotif = [UNNotificationRequest requestWithIdentifier:@"HypnoNerdNotification" content:content trigger:trigger];
    [notifCenter addNotificationRequest:requestNotif withCompletionHandler:nil];
    
    // Make and log a nice looking date-string
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:dateSet];
    NSLog(@"Set reminder for %@", dateString);
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        UIImage *image = [UIImage imageNamed:@"Time.png"];
        self.tabBarItem.title = @"Reminder";
        self.tabBarItem.image = image;
    }
    return self;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    NSLog(@"BNRReminderViewController loaded its view");
    
    UNUserNotificationCenter *notifCenter = [UNUserNotificationCenter currentNotificationCenter];
    UNAuthorizationOptions options = UNAuthorizationOptionAlert + UNAuthorizationOptionSound;
    [notifCenter requestAuthorizationWithOptions:options completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (!granted){
            NSLog(@"ok bitch");
        }else{
            NSLog(@"thnx");
        }
    }];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}
@end
